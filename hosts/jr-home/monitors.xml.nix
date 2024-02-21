{
  monitors = {
    xml = ''
      <monitors version="2">
        <configuration>
          <logicalmonitor>
            <x>0</x>
            <y>0</y>
            <scale>1</scale>
            <primary>yes</primary>
            <monitor>
              <monitorspec>
                <connector>HDMI-1</connector>
                <vendor>GSM</vendor>
                <product>LG TV SSCR2</product>
                <serial>0x01010101</serial>
              </monitorspec>
              <mode>
                <width>3840</width>
                <height>2160</height>
                <rate>100.000</rate>
              </mode>
            </monitor>
          </logicalmonitor>
        </configuration>
      </monitors>
    '';
  };
}
