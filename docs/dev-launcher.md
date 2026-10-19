<!--
────────────────────────────────────────────────────────────────────────────
  SPDX-FileCopyrightText: Copyright © 2026 Yehor Marichev <legal@rsqb.dev>
  SPDX-License-Identifier: MPL-2.0

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at https://mozilla.org/MPL/2.0/.
────────────────────────────────────────────────────────────────────────────
-->

# [ZPF](../README.md) / [Development](DEVELOPMENT.md) / Workflow Launcher

The `dev` file is a polyglot POSIX sh/PowerShell dispatcher for `script/console` and `script/clean`.
On Windows, they run via [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).

**Usage:** `./dev [shell|clean]` (default: `shell`)

> [!NOTE]
> **Windows:** under `iex`, the script cannot know its own path,
> so it searches the current and ancestor directories for the nearest file `dev`.

## Code structure

> [!CAUTION]
> Code below presupposes placement on a single line; be careful not to break the polyglot script.

<details>
<summary><b>Complete minified source</b></summary>

```text
echo `# <#`>/dev/null;cd -- "$(dirname -- "$0")";case ${1:-shell} in shell)exec script/console;;clean)exec script/clean;esac;echo "usage: ./dev [shell|clean]">&2;exit 1 #>>$null;$root="$PWD";while($root-and![IO.File]::Exists("$root/dev")){$root=Split-Path $root}if(!$root){[Console]::Error.WriteLine('dev: project root not found');$global:LASTEXITCODE=1;return}switch -CaseSensitive($(if($args){$args[0]}else{'shell'})){shell{wsl --cd $root script/console}clean{wsl --cd $root script/clean}default{[Console]::Error.WriteLine('usage: dev [shell|clean]');$global:LASTEXITCODE=1}}
```
</details>

The dispatcher consists of four minified segments concatenated in order, with no separators:

| # | POSIX sh      | PowerShell                                    |
|:--|:--------------|:----------------------------------------------|
| 1 | silent `echo` | starts `echo` statement, opens block comment  |
| 2 | code          | comment                                       |
| 3 | comment       | closes comment, discards `echo` output of `#` |
| 4 | comment       | code                                          |

### Source segments

1. **Polyglot glue**
   ```text
   echo `# <#`>/dev/null;
   ```

2. **POSIX sh**
   ```shell
   cd -- "$(dirname -- "$0")"

   # No default case as `exec` hands over shell
   case ${1:-shell} in
       shell) exec script/console ;;
       clean) exec script/clean
   esac

   echo "usage: ./dev [shell|clean]" >&2
   exit 1
   ```
   <details>
   <summary>Minified</summary>

   ```shell
   cd -- "$(dirname -- "$0")";case ${1:-shell} in shell)exec script/console;;clean)exec script/clean;esac;echo "usage: ./dev [shell|clean]">&2;exit 1
   ```
   </details>
<!-- [force loose list in faulty renderers] -->
3. **Polyglot glue**
> [!IMPORTANT]
> Preserve the leading space
> so `#` starts a shell comment instead of becoming part of a preceding token.
> ```text
>  #>>$null;
> ```

4. **PowerShell**
   ```powershell
   $root = "$PWD"

   while ($root -and ![IO.File]::Exists("$root/dev")) {
       $root = Split-Path $root
   }

   if (!$root) {
       [Console]::Error.WriteLine('dev: project root not found')
       $global:LASTEXITCODE = 1
       return
   }

   switch -CaseSensitive ($(if ($args) { $args[0] } else { 'shell' })) {
       shell {
           wsl --cd $root script/console
       }
       clean {
           wsl --cd $root script/clean
       }
       default {
           [Console]::Error.WriteLine('usage: dev [shell|clean]')
           $global:LASTEXITCODE = 1
       }
   }
   ```
   <details>
   <summary>Minified</summary>

   ```powershell
   $root="$PWD";while($root-and![IO.File]::Exists("$root/dev")){$root=Split-Path $root}if(!$root){[Console]::Error.WriteLine('dev: project root not found');$global:LASTEXITCODE=1;return}switch -CaseSensitive($(if($args){$args[0]}else{'shell'})){shell{wsl --cd $root script/console}clean{wsl --cd $root script/clean}default{[Console]::Error.WriteLine('usage: dev [shell|clean]');$global:LASTEXITCODE=1}}
   ```
   </details>

---

[To DEVELOPMENT.md](DEVELOPMENT.md)
