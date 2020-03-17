{ pkgs ? import <nixpkgs> {}, ... }:

with pkgs; mkShell {
  name = "my_program";
  nativeBuildInputs = [ stdenv ];
}
