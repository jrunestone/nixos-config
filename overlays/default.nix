{inputs, ...}: {
  additions = final: _prev: import ../pkgs {pkgs = final;};

  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    vintagestory = prev.vintagestory.overrideAttrs (old: rec {
      version = "1.20.0-rc.6";
      src = prev.fetchurl {
        url = "https://cdn.vintagestory.at/gamefiles/unstable/vs_client_linux-x64_${version}.tar.gz";
        sha256 = "sha256-JxyQrZrAmMkUy28JUak0BHHpuGEb2fbxNrtOGVKGhOQ=";
      };
    });
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
