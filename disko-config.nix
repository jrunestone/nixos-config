{ disk, pp, ... }: {
  disko = {
    # enableConfig = false;

    devices = {
      disk.primary = {
        device = disk;
        type = "disk";

        content = {
          type = "gpt";

          partitions = {
            boot = {
              size = "1M";
              type = "EF02"; # for grub MBR
              priority = 0;
            };

            ESP = {
              name = "ESP";
              size = "512M";
              type = "EF00";
              priority = 1;

              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["fmask=0077" "dmask=0077"];
              };
            };

            nix = {
              size = "50%";

              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/nix";
                mountOptions = ["compress-force=zstd" "noatime"];
              };
            };

            persist = {
              size = "100%";

              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/persist";
                mountOptions = ["compress-force=zstd" "noatime"];
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

  # fileSystems."/boot" = {
  #   device = "${disk}${pp}2";
  #   fsType = "vfat";
  #   options = ["fmask=0077" "dmask=0077"];
  # };

  # fileSystems."/" = {
  #   device = "none";
  #   fsType = "tmpfs";
  #   options = ["defaults" "mode=755" "noatime" "size=8G"];
  # };

  # fileSystems."/nix" = {
  #   device = "${disk}${pp}3";
  #   fsType = "ext4";
  #   options = ["compress-force=zstd" "noatime"];
  # };

  # fileSystems."/persist" = {
  #   device = "${disk}${pp}4";
  #   fsType = "ext4";
  #   options = ["compress-force=zstd" "noatime"];
  #   neededForBoot = true;
  # };
}