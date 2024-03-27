{ inputs, lib, pkgs, config, outputs, ... }: {
  home.packages = [ 
    (pkgs.vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = true;
    })
  ];
}
