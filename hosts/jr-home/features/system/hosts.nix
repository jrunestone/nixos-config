{ pkgs, inputs, ... }: {
  networking.hosts = {
    "192.168.8.243" = ["homelab"];
    "192.168.8.207" = ["lxconsole"];
    "192.168.8.115" = ["dashboard"];
  };
}
