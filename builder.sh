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

