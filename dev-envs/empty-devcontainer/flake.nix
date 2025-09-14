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

        if [ -f $DEVCONTAINER_PATH/post-create.sh ]; then
          chmod +x $DEVCONTAINER_PATH/post-create.sh
        fi

        exec zsh
        #trap 'echo "Bye"' EXIT
      '';
    };
  };
}
