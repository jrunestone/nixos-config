{
  inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      nixos-secrets.url = "git+ssh://git@github.com/jrunestone/nixos-secrets?ref=main";
  };

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";    
    certPath = nixos-secrets.hosts.jr-home.certs;
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in pkgs.mkShell {
      DEVENV_NAME = "projectname";

      packages = with pkgs; [
        (with dotnetCorePackages; combinePackages [
          sdk_9_0
        ])
        jetbrains.rider
      ];

      shellHook = ''
        cp ${certPath.localhost-pfx} $DEVENV_PROJECT_ROOT/.devcontainer/localhost.pfx
        exec zsh
        #trap 'echo "Bye"' EXIT
      '';
    };
  };
}
