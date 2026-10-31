# ────────────────────────────────────────────────────────────────────────
# SPDX-FileCopyrightText: Copyright © 2026 Yehor Marichev <legal@rsqb.dev>
# SPDX-License-Identifier: MPL-2.0
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
# ────────────────────────────────────────────────────────────────────────

{
  description = "ZPF development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.just
          pkgs.mandoc
          pkgs.nushell
          pkgs.reuse
          pkgs.zig_0_17
        ];
      };
    };
}
