{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.gcc
    pkgs.bash
    pkgs.gnumake
  ];

  # Set environment variables for compilation
  shellHook = ''
    export CFLAGS="-Wno-format-security"
    export CXXFLAGS="-Wno-format-security"
    export CPPFLAGS="-Wno-format-security"
    export LDFLAGS="-Wno-format-security"
    mkdir -p /bin
    ln -sf ${pkgs.bash}/bin/bash /bin/bash
  '';
}

