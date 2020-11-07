{ pkgs ? import <nixpkgs> {} }:

let
  hpkgs = pkgs.haskellPackages;

  site = hpkgs.callCabal2nix "ineedanew-pw" ./. {};
in

if pkgs.lib.inNixShell then hpkgs.shellFor {
  packages = _: [ site ];
  withHoogle = true;
} else site
