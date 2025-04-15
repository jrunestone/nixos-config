{
  inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";    
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in pkgs.mkShell {
      DEVENV_NAME = "projectname";

      packages = with pkgs; [
        cmake
        ninja
        ccache
        clang-tools
        gdb
        valgrind
      ];

      shellHook = ''
        exec zsh
      '';
    };
  };
}
