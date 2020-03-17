{ stdenv }:

stdenv.mkDerivation {
  pname = "my_program";
  version = "0.0.1";

  src = ./.;

  preInstall = "export TARGET=$out";

  nativeBuildInputs = [ stdenv ];
}
