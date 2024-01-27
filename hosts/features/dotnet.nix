{ inputs, lib, pkgs, config, outputs, ... }: {
  environment.systemPackages = [
    pkgs.dotnet-sdk_8
  ];
}