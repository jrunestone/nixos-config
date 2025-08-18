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

        DEVCONTAINER_PATH=$DEVENV_PROJECT_ROOT/.devcontainer

        if ! [ -d $DEVCONTAINER_PATH ]; then
          cp -r ./.devcontainer $DEVENV_PROJECT_ROOT/
        fi

        if ! [ -f $DEVENV_PROJECT_ROOT/.editorconfig ]; then
          cp ./.editorconfig $DEVENV_PROJECT_ROOT/
        fi

        if ! [ -f $DEVCONTAINER_PATH/localhost.pfx ]; then
          cp ${certPath.localhost-pfx} $DEVCONTAINER_PATH/localhost.pfx
          chmod +w $DEVCONTAINER_PATH/localhost.pfx
        fi

        if [ -f $DEVCONTAINER_PATH/post-create.sh ]; then
          chmod +x $DEVCONTAINER_PATH/post-create.sh
        fi

        exec zsh
        #trap 'echo "Bye"' EXIT
      '';
    };
  };
}
