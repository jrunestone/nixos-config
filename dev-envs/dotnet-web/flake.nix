{
  inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      nixos-secrets.url = "git+ssh://git@github.com/jrunestone/nixos-secrets?ref=main";
  };

  outputs = { self, nixpkgs, nixos-secrets, ... }: let
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
        #(with dotnetCorePackages; combinePackages [
          #sdk_9_0
        #])
        #jetbrains.rider
      ];

      shellHook = ''
        set +a
        source ./.env
        set -a

        if ! [ -f $DEVENV_PROJECT_ROOT/.devcontainer/jr-home.pfx ]; then
          cp ${certPath.localhost-pfx} $DEVENV_PROJECT_ROOT/.devcontainer/jr-home.pfx
        fi

        exec zsh
        #trap 'echo "Bye"' EXIT
      '';
    };
  };
}
