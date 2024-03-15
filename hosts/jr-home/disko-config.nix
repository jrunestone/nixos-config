{ disk, ... }: {
  disko = {
    devices = {
      disk.secondary = {
        device = disk;
        type = "disk";

        content = {
          type = "gpt";

          partitions = {
            games = {
              size = "100%";

              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/games";
                mountOptions = ["noatime"];
              };
            };
          };
        };
      };
    };
  };
}
