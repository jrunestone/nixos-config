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
        dotnetCorePackages.sdk_9_0
        jetbrains.rider
      ];

      shellHook = ''
        exec zsh
        #trap 'echo "Bye"' EXIT
      '';
    };
  };
}
