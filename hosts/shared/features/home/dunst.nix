{ inputs, lib, pkgs, config, outputs, ... }: {
  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 300;
        height = 300;
        frame_width = 0;
        padding = 16;
        horizontal_padding = 16;
        line_height = 0;
        font = "Noto Sans 14";
        format = "<b>%a</b>\n%s";
      };

      urgency_normal = {
        background = "#${config.colorScheme.palette.base00}";
        foreground = "#${config.colorScheme.palette.base06}";
        highlight = "#${config.colorScheme.palette.base08}";
      };

      urgency_low = {
        background = "#${config.colorScheme.palette.base00}";
        foreground = "#${config.colorScheme.palette.base06}";
        highlight = "#${config.colorScheme.palette.base08}";
      };

      urgency_critical = {
        background = "#${config.colorScheme.palette.base00}";
        foreground = "#${config.colorScheme.palette.base09}";
        highlight = "#${config.colorScheme.palette.base08}";
      };
    };
  };
}
