{ pkgs, inputs, config, ... }: {
  networking.firewall.allowedTCPPorts = [80 443];

  services.traefik = {
    enable = true;

    staticConfigOptions = {
      entryPoints = {
        web = {
          address = ":80";
          asDefault = true;
        };

        websecure = {
          address = ":443";
        };
      };
    };

    dynamicConfigOptions = {
      tls.certificates = [{
        certFile = inputs.nixos-secrets.hosts.jr-home.certs.localhost;
        keyFile = inputs.nixos-secrets.hosts.jr-home.certs.localhost-key;
      }];

      http = {
        routers = {
          devc-router = {
            entryPoints = ["websecure"];
            rule = "Host(`devd.dev.localhost`)";
            service = "devc";
            tls = true;
          };
        };

        services = {
          devc.loadBalancer.servers = [{url = "https://localhost:5000";}];
        };
      };
    };
  };
}
