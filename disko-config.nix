{ disk, ... }: {
  disko = {
    devices = {
      disk.primary = {
        device = disk;
        type = "disk";

        content = {
          type = "gpt";

          partitions = {
            boot = {
              name = "boot";
              size = "1M";
              type = "EF02";
              bootable = true;
            };

            ESP = {
              name = "ESP";
              size = "512M";
              type = "EF00";

              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
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
        mountOptions = ["mode=755" "noatime" "size=8G"]; # will not reserve 8gb
      };
    };
  };

  fileSystems = {
    "/".neededForBoot = true;
    "/nix".neededForBoot = true;
    "/boot".neededForBoot = true;
  };
}