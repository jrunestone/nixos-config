{ inputs, lib, pkgs, config, outputs, ... }: {
  environment.systemPackages = [pkgs.moonlight-qt]; 
}
