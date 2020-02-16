let
  pkgs = import <nixpkgs> {};
in

with pkgs;

let ob = import ./config.nix;
in
pkgs.stdenv.mkDerivation rec {
  name = "hoge";

  src = fetchurl {
    url = "https://nixos.org/releases/nix/nix-2.3.2/nix-2.3.2.tar.xz";
    sha256 = "1y7fkd34rl7q64gb4av87aprd0zlv757wvyk0p7nsa8bvd94pslz";
  };

  buildInputs = [ boost openssh sqlite pkg-config bzip2 curl editline lzma brotli ];

  #OPENSSL_LIBS = "${openssl}/lib/pkgconfig";
  configureFlags = [];

  # debug outs
  # phases = [ "installPhase" ];
  # installPhase = ''
  #   echo ${ob.x}
  #   echo ${openssl}/lib
  # '';

  meta = with pkgs.stdenv.lib; {
    homepage = https://scalameta.org/metals/;
    license = licenses.asl20;
    description = "Work-in-progress language server for Scala";
    maintainers = with maintainers; [ ceedubs tomahna ];
  };
}
