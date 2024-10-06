{inputs, ...}: {
  additions = final: _prev: import ../pkgs {pkgs = final;};

  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    vintagestory = prev.vintagestory.overrideAttrs (old: {
      preFixup = builtins.replaceStrings
        ["--prefix LD_LIBRARY_PATH"]
        ["--set LD_PRELOAD ${final.xorg.libXcursor}/lib/libXcursor.so.1 --prefix LD_LIBRARY_PATH"]
        old.preFixup;
    });
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
