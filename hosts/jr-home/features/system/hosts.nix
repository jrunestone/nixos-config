{ pkgs, inputs, ... }: {
  networking.hosts = {
    "192.168.8.243" = ["homelab"];
    "192.168.8.115" = ["dashboard"];
    "192.168.8.214" = ["openmediavault"];
    "192.168.8.158" = ["jellyfin"];
  };
}
