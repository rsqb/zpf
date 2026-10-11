<!--
────────────────────────────────────────────────────────────────────────────
  SPDX-FileCopyrightText: Copyright © 2026 Yehor Marichev <legal@rsqb.dev>
  SPDX-License-Identifier: MPL-2.0

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at https://mozilla.org/MPL/2.0/.
────────────────────────────────────────────────────────────────────────────
-->

# [ZPF](../README.md) / Development

## Prerequisites

<!-- FIXME @rsqb: determine whether WSL (version 1) or WSL (version 2) must be used -->
- **Unix:** _(none)_
- **Windows:**
  [WSL (Windows Subsystem for Linux)](https://learn.microsoft.com/en-us/windows/wsl/install)
  with a distribution installed

## Workflow

> [!IMPORTANT]
> Run from the project root, or substitute the path to `nix` (e.g. `../nix`).

### Unix

- Set up tools, show available recipes: `./nix dev` or just `./nix`


- Reset to pre-bootstrap state: `./nix clean`

### Windows

- Set up tools, show available recipes
  ```powershell
  gc nix | iex
  ```
  or
  ```powershell
  iex "&{$(gc nix)} dev"
  ```

- Reset to pre-bootstrap state
  ```powershell
  iex "&{$(gc nix)} clean"
  ```

## Editors

> [!NOTE]
> Editor-specific files are excluded from source archives.

- **JetBrains IDEs:** run configurations (`.run/`), required plugins (`externalDependencies.xml`)

## Layout

```yaml
├── .idea/          # IDE project settings
├── .run/           # IDE run configurations
├── docs/           # documentation and assets
├── examples/       # example projects
├── LICENSES/       # licence texts
├── scratch/        # temporary local files
├── script/         # workflow scripts
├── templates/      # starter templates
├── flake.nix       # Nix tool declarations
├── justfile        # Just recipes
├── nix             # polyglot script launcher
├── PROJECT_COLOR   # IDE project colour
└── REUSE.toml      # licensing for headerless files
```

---

[To README](../README.md)
