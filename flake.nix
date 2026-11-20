# SPDX-License-Identifier: AGPL-3.0-or-later
{
  description = "AnkiQuest-Android-Backend: build environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # The dev shells, formatter and pinned toolchains of every AnkiQuest
    # repository.
    ankiquest-dev = {
      url = "github:AnkiQuest/AnkiQuest-Dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ankiquest-dev,
  }: let
    forAllSystems = nixpkgs.lib.genAttrs ankiquest-dev.lib.systems;
  in {
    inherit (ankiquest-dev) formatter;

    # AnkiQuest-Dev's android-backend shell: JBR 21, the Android SDK with NDK
    # r28c and r29, Rust for the Android targets, cargo-ndk and Anki's tools.
    devShells = forAllSystems (system: {
      default = ankiquest-dev.devShells.${system}.android-backend;
    });

    checks = forAllSystems (system: {
      format = ankiquest-dev.lib.formatCheck nixpkgs.legacyPackages.${system} self;
    });
  };
}
