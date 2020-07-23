{ project ? import ./nix {} }:
{
  cyberchef = project.pkgs.stdenv.mkDerivation rec {
    name = "cyberchef";
    version = "9.21.0";
    src = project.pkgs.fetchzip {
      url = "https://gchq.github.io/CyberChef/CyberChef_v${version}.zip";
      stripRoot = false;
      sha256 = "1y4z8fmy377wzzhrf7c6amglx7cl52hzpflwa6669y8s4d16bd6g";
    };
    installPhase = ''
      PATH=$coreutils/bin:$PATH
      mkdir -p $out/bin
      cp -r $src/* $out
      cat <<EOF > $out/bin/cyberchef
      #!/usr/bin/env bash
      set -euxo pipefail
      # to run on linux or mac
      xdg-open $out/CyberChef*.html || open $out/CyberChef*.html
      EOF
      chmod +x $out/bin/cyberchef
    '';
    coreutils = project.pkgs.coreutils;
  };
  ci = (import ./nix {}).ci;
}
