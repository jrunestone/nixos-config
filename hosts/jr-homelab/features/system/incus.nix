{ pkgs, inputs, ... }: {
  networking = {
    nftables.enable = true;
    useDHCP = false;
    tempAddresses = "disabled";
    hostId = "cf9fe3d2";
    hostName = "jr-homelab";
    firewall.trustedInterfaces = ["internalbr0"];
    
    bridges = {
      externalbr0 = {
        interfaces = ["enp1s0"];
      };
    };

    interfaces = {
      externalbr0 = {
        useDHCP = true;
        macAddress = "a6:3f:8a:0e:bf:19";
      };
    };
  };

  virtualisation.incus = {
    enable = true;
    ui.enable = true;
    package = pkgs.incus;

    preseed = {
      networks = [
        {
          name = "internalbr0";
          type = "bridge";
          description = "Internal/NATted bridge";
    
          config = {
            "ipv4.address" = "auto";
            "ipv4.nat" = "true";
            "ipv4.firewall" = "false";
            "ipv6.address" = "auto";
            "ipv6.nat" = "true";
            "ipv6.firewall" = "false";
          };
        }
      ];

      profiles = [
        {
          name = "default";
          description = "Default Incus Profile";
        
          devices = {
            eth0 = {
              name = "eth0";
              network = "internalbr0";
              type = "nic";
            };

            root = {
              path = "/";
              pool = "default";
              type = "disk";
            };
          };
        }

        {
          name = "bridged";
          description = "Instances bridged to LAN";
          
          devices = {
            eth0 = {
              name = "eth0";
              nictype = "bridged";
              parent = "externalbr0";
              type = "nic";
            };
            
            root = {
              path = "/";
              pool = "default";
              type = "disk";
            };
          };
        }
      ];

      storage_pools = [
        {
          config = {
            source = "/var/lib/incus/storage-pools/default";
          };

          driver = "dir";
          name = "default";
        }
      ];
    };
  };

  users.users.jr.extraGroups = ["incus-admin"];
}
