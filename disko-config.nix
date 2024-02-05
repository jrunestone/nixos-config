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
                mountOptions = ["umask=0077"];
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
        mountOptions = ["mode=755" "noatime" "nodev" "size=8G"]; # will not reserve 8gb
      };
    };
  };

  fileSystems = {
    "/".neededForBoot = true;
    "/boot".neededForBoot = true;
    "/nix".neededForBoot = true;
  };
}