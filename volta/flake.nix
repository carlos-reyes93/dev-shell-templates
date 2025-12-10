{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    utils,
    ...
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShell = with pkgs;
          mkShell {
            packages = [volta];
            shellHook = ''
              export VOLTA_HOME=$HOME/.volta
              export PATH=$VOLTA_HOME/bin:$PATH
            '';
          };
      }
    );
}
