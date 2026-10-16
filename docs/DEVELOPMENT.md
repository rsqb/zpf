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
> Run from the project root, or substitute the path to [dev file](dev-launcher.md) (e.g. `../dev`).
>
> **Windows:** only paths to ancestor directories work.

### Unix

- Set up tools, show available recipes: `./dev shell` or just `./dev`
<!-- [force loose list in faulty renderers] -->
- Reset to pre-bootstrap state: `./dev clean`

### Windows

- Set up tools, show available recipes
  ```powershell
  gc dev | iex
  ```
  or
  ```powershell
  iex "&{$(gc dev)} shell"
  ```

- Reset to pre-bootstrap state
  ```powershell
  iex "&{$(gc dev)} clean"
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
├── script/         # workflow scripts (bootstrap, console, clean)
├── templates/      # starter templates
├── dev             # polyglot script launcher
├── flake.nix       # Nix tool declarations
├── justfile        # Just recipes
├── PROJECT_COLOR   # IDE project colour
└── REUSE.toml      # licensing for headerless files
```

## Versioning

- **Releases:** [SemVer 2.0](https://semver.org/spec/v2.0.0.html)
- **Dev builds:**

  ```text
  X.Y.Z-dev.N+gYYwWWS
  │         │  │  │ └─ commit within week (z*[a-z])
  │         │  │  └─── ISO week (01–53)
  │         │  └────── ISO week-year (00–99)
  │         └───────── dev build number
  └─────────────────── next release
  ```

---

[To README](../README.md)
