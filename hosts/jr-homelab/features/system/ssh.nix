{ pkgs, inputs, ... }: {
  services.openssh = {
    enable = true;
    ports = [22];

    settings = {
      AllowUsers = ["jr"];
      PasswordAuthentication = false;
    };

    #knownHosts = {
    #  "jr-home" = {
    #    publicKey = "";
        
    #};
  };

  networking.firewall.allowedTCPPorts = [22];
}
