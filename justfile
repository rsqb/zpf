# ────────────────────────────────────────────────────────────────────────
# SPDX-FileCopyrightText: Copyright © 2026 Yehor Marichev <legal@rsqb.dev>
# SPDX-License-Identifier: MPL-2.0
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
# ────────────────────────────────────────────────────────────────────────

# Requires:
#   just, nu   on PATH
#
# All tooling bootstrapped by Nix flake.

# ───── Settings ───────────────────────────────────────────────────────────────
set shell              := ["nu", "--no-config-file", "--commands"]
set dotenv-load        := false
set dotenv-override    := false
set dotenv-required    := false
set ignore-comments    := true
set no-exit-message    := true
set lazy               := true
set quiet              := true
set script-interpreter := ["nu", "--no-config-file"]

root := justfile_directory()

# ═════ Recipes ════════════════════════════════════════════════════════════════

alias h := help

[doc('Default: Show available recipes')]
[default]
help:
	{{just_executable()}} --justfile {{justfile()}} --list --unsorted
