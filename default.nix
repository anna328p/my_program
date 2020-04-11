{ stdenv, gtk3, pkgconfig }:

stdenv.mkDerivation {
  pname = "my_program";
  version = "0.0.1";

  src = ./.;

  preInstall = "export TARGET=$out";

  nativeBuildInputs = [ stdenv pkgconfig ];
  buildInputs = [ gtk3 ];
}
