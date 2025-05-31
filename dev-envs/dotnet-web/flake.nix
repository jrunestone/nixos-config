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
        (with dotnetCorePackages; combinePackages [
          sdk_9_0
        ])
        jetbrains.rider
        devpod
        mkcert
      ];

      shellHook = ''
        if ! [ -f $DEVENV_PROJECT_ROOT/.devcontainer/localhost.pfx ]; then
          # assumes rootCA is present in $CAROOT, password is "changeit"
          mkdir -p $DEVENV_PROJECT_ROOT/.devcontainer && mkcert -p12-file $DEVENV_PROJECT_ROOT/.devcontainer/localhost.pfx -pkcs12 localhost
        fi

        exec zsh
        #trap 'echo "Bye"' EXIT
      '';
    };
  };
}
