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

            root = {
              size = "100%";

              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = ["noatime"];
              };
            };
          };
        };
      };
    };
  };

  fileSystems."/".neededForBoot = true;
}
