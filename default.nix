{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11") {} }:
pkgs.mkShell {
  packages = [
    pkgs.go-task
    pkgs.kind
    pkgs.kubectl
    pkgs.helmfile
    pkgs.cilium-cli
    pkgs.k9s

    (pkgs.wrapHelm pkgs.kubernetes-helm { plugins = [ pkgs.kubernetes-helmPlugins.helm-diff ]; })
  ];
}
