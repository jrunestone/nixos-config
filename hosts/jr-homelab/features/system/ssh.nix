{ pkgs, inputs, ... }: {
  services.openssh = {
    enable = true;
    ports = [22];

    settings = {
      AllowUsers = ["jr"];
      PasswordAuthentication = false;
    };
  };

  users.users.jr.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAt6S7VQGYS2X2RM44KNcbvtCbrTURZgIEWUOtrzQ26T johan85@hotmail.com"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII24IDUM7AHXVxtXU6P0lQ4gn4FEvUPwOIjDutuH4Rp+ johan.runsten@toxic.se"
  ];

  networking.firewall.allowedTCPPorts = [22];
}
