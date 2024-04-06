{ pkgs, lib, config, ... }: {
  # init starship as early as possible
  programs.bash.bashrcExtra = ''
    eval "$(starship init bash)";
  '';

  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      format = lib.concatStrings [
        "$nix_shell"
        "$env_var"
        "$directory "
        "$git_branch"
        "$git_status"
        "$git_state"
        "$time"
        "$cmd_duration"
        "$status"
        "$line_break"
        "$character"
      ];

      character = {
        success_symbol = "[\\$]($style)";
        error_symbol = "[\\$]($style)";
      };

      directory = {
        style = "fg:#${config.colorScheme.palette.base0D}";
        format = "[$path]($style) ";
        truncate_to_repo = false;
        truncation_length = 10;
        truncation_symbol = "…/";
      };

      time = {
        style = "fg:#${config.colorScheme.palette.base0C}";
        disabled = false;
        time_format = "%R";
        format = "[󱑔 $time]($style)";
      };

      cmd_duration = {
        style = "fg:#${config.colorScheme.palette.base0C}";
        format = "  [⏱ $duration]($style)";
      };

      status = {
        style = "fg:#${config.colorScheme.palette.base0F}";
        disabled = false;
        format = "  [ $status]($style)";
      };

      git_status = {
        style = "fg:#${config.colorScheme.palette.base0B}";
        format = "[$all_status$ahead_behind]($style) ";
        conflicted = "~$count ";
        ahead = "⇡$count ";
        behind = "⇣$count ";
        diverged = "^$count ";
        untracked = "?$count ";
        stashed = "*$count ";
        modified = "!$count ";
        staged = "+$count ";
        renamed = "!$count ";
        deleted = "!$count ";
      };

      git_branch = {
        style = "fg:#${config.colorScheme.palette.base0B}";
        symbol = "";
        format = "[$symbol $branch]($style) ";
      };

      git_state = {
        style = "fg:#${config.colorScheme.palette.base0B}";
        format = "[\($state($progress_current/$progress_total)\)]($style) ";
      };

      nix_shell = {
        style = "fg:#${config.colorScheme.palette.base09}";
        symbol = "shell";
        format = "[$symbol]($style) ";
      };

      env_var = {
        style = "fg:#${config.colorScheme.palette.base09}";
        symbol = "";
        variable = "DEVENV_NAME";
        format = "[$symbol$env_value]($style) ";
      };
    };
  };
}
