{ pkgs, inputs, ... }: {
  fileSystems."/media/shield" = {
    device = "//192.168.8.213/WD USB drive/NVIDIA_SHIELD";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  };

  
  # samba network share secrets file
  environment.etc."nixos/smb-secrets" = {
    mode = "0444";
    text = inputs.nixos-secrets.hosts.jr-home.smb;
  };
}
