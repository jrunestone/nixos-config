{ inputs, lib, pkgs, config, ... }: {
  home.file."${config.xdg.stateHome}/wireplumber/default-nodes" = {
    force = true;

    text = ''
      [default-nodes]
      default.configured.audio.sink=alsa_output.pci-0000_0a_00.1.hdmi-stereo
      default.configured.audio.sink.0=alsa_output.pci-0000_0a_00.1.hdmi-stereo
    '';
  };

  home.file."${config.xdg.stateHome}/wireplumber/default-routes" = {
    force = true;
    
    text = ''
      [default-routes]
      alsa_card.pci-0000_0a_00.1:output:hdmi-output-0={"iec958Codecs":[], "channelMap":["FL", "FR"], "mute":false, "latencyOffsetNsec":0, "channelVolumes":[1.000000, 1.000000]}
      alsa_card.pci-0000_0a_00.1:profile:output:hdmi-stereo=["hdmi-output-0"]
    '';
  };
}
