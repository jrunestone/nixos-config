{ disk, ... }: {
  disko = {
    devices = {
      disk.primary = {
        device = disk;
        type = "disk";

        content = {
          type = "gpt";

          partitions = {
            ESP = {
              name = "ESP";
              size = "512M";
              type = "EF00";

              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["fmask=0077" "dmask=0077"];
              };
            };

            nix = {
              size = "100%";

              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/nix";
                mountOptions = ["noatime"];
              };
            };
          };
        };
      };

      nodev."/" = {
        fsType = "tmpfs";
        mountOptions = ["defaults" "mode=755" "noatime" "size=8G"]; # will not reserve 8gb
      };
    };
  };
}