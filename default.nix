{ project ? import ./nix {} }:

#(import ./nix {}).ci
project.pkgs.stdenv.mkDerivation rec {
  name = "cyberchef";
  version = "9.21.0";
  src = project.pkgs.fetchzip {
    url = "https://gchq.github.io/CyberChef/CyberChef_v${version}.zip";
    stripRoot=false;
    sha256 = "1y4z8fmy377wzzhrf7c6amglx7cl52hzpflwa6669y8s4d16bd6g";
  };
  builder = ./builder.sh;
  coreutils = project.pkgs.coreutils;
}
