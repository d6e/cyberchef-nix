{ project ? import ./nix {}
}:

project.pkgs.mkShell {
  buildInputs = builtins.attrValues project.devTools ++ [ project.pkgs.firefox project.pkgs.xdg_utils ];
  shellHook = ''
    ${project.ci.pre-commit-check.shellHook}
  '';
}
