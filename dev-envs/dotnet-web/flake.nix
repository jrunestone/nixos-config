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
          sdk_8_0
        ])
        jetbrains.rider
        mkcert
      ];

      shellHook = ''
        if ! [ -f $DEVENV_DIR/dev-certs/localhost.pfx ]; then
          # password is "changeit"
          mkdir -p $DEVENV_DIR/dev-certs && mkcert -p12-file $DEVENV_DIR/dev-certs/localhost.pfx -pkcs12 localhost
        fi

        exec zsh
        #trap 'echo "Bye"' EXIT
      '';
    };
  };
}
