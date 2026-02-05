{ pkgs, inputs, ... }: {
  environment.systemPackages = [ pkgs.pavucontrol ];
}
