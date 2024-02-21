{ inputs, lib, pkgs, config, ... }: {
  home.file."${config.xdg.stateHome}/wireplumber/default-nodes".text = ''
    [default-nodes]
    default.configured.audio.sink=alsa_output.pci-0000_0a_00.1.hdmi-stereo-extra1
    default.configured.audio.sink.0=alsa_output.pci-0000_0a_00.1.hdmi-stereo-extra1
  '';

  home.file."${config.xdg.stateHome}/wireplumber/default-routes".text = ''
    [default-routes]
    alsa_card.pci-0000_0a_00.1:output:hdmi-output-1:channelMap=FL;FR;
    alsa_card.pci-0000_0a_00.1:output:hdmi-output-1:channelVolumes=1.0;1.0;
    alsa_card.pci-0000_0a_00.1:output:hdmi-output-1:iec958Codecs=
    alsa_card.pci-0000_0a_00.1:output:hdmi-output-1:latencyOffsetNsec=0
    alsa_card.pci-0000_0a_00.1:profile:output:hdmi-stereo-extra1=hdmi-output-1;
  '';
}
