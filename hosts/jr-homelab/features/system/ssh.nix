{ pkgs, inputs, ... }: {
  services.openssh = {
    enable = true;
    ports = [22];

    settings = {
      AllowUsers = ["jr"];
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.jr.openssh.authorizedKeys.keys = [
    inputs.nixos-secrets.hosts.jr-home.pubkey
    inputs.nixos-secrets.hosts.jr-work.pubkey
  ];

  networking.firewall.allowedTCPPorts = [22];
}
