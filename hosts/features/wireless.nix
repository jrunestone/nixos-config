{ inputs, lib, pkgs, config, outputs, ... }: {
  networking.networkmanager.unmanaged = [
    "*" "except:type:wwan" "except:type:gsm"
  ];

  networking.wireless.enable = lib.mkForce true;
}