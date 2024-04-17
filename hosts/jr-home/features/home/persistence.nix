{ inputs, lib, pkgs, config, outputs, ... }: {  
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.persistence."/nix/persist/home/${config.home.username}" = {
    directories = [
      "Documents"
      "dev"

      ".gnupg"
      ".ssh"
      ".nuget"
      ".pki"

      ".local/share/keyrings"
      ".local/share/containers"
      ".local/share/icons"
      ".local/share/NuGet"
      ".local/share/flatpak"

      # ble.sh
      ".cache/blesh"

      # jetbrains
      ".java"
      ".local/share/JetBrains"
      ".config/JetBrains"
      ".cache/JetBrains"

      # spotify
      ".config/spotify"
      ".cache/spotify"

      # firefox
      ".cache/mozilla/firefox"
      "./.mozilla/firefox"

      # notesnook
      ".config/Notesnook"

      # misc
      ".var/app/com.valvesoftware.Steam"
      ".config/obsidian"
      ".config/Slack"
      ".config/1Password"
      ".config/Insomnia"
    ];

    files = [
      ".bash_history"
    ];

    allowOther = true;
  };
}
