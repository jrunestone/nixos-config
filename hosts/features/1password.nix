{ inputs, lib, pkgs, config, outputs, ... }: {
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "jr" ];
  };

  programs._1password.enable = true;
}
