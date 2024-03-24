{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.starship ];

  programs.starship = {
    enable = true;
  };

  programs.bash.initExtra = ''
    eval "$(starship init bash)"
  '';

  programs.starship.settings = {
    palette = "catppuccin_mocha";

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
      style = "fg:lavender"; #style = "fg:#9b859d";
      format = "[$path]($style) ";
      truncate_to_repo = false;
      truncation_length = 10;
      truncation_symbol = "…/";
    };

    time = {
      style = "fg:teal";#"fg:#cda869";
      disabled = false;
      time_format = "%R";
      format = "[󱑔 $time]($style)";
    };

    cmd_duration = {
      style = "fg:teal";#"fg:#8f9d6a";
      format = "  [⏱ $duration]($style)";
    };

    status = {
      style = "fg:red";#"fg:#cf6a4c";
      disabled = false;
      format = "  [ $status]($style)";
    };

    git_status = {
      style = "fg:green";#"fg:#f9ee98";
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
      style = "fg:green";#"fg:#f9ee98";
      symbol = "";
      format = "[$symbol $branch]($style) ";
    };

    git_state = {
      style = "fg:green";#"fg:#f9ee98";
      format = "[\($state($progress_current/$progress_total)\)]($style) ";
    };

    nix_shell = {
      style = "fg:overlay0";#"fg:#cf6a4c";
      symbol = "shell";
      format = "[$symbol]($style) ";
    };

    env_var = {
      style = "fg:overlay0";#"fg:#cf6a4c";
      symbol = "";
      variable = "DEVENV_NAME";
      format = "[$symbol$env_value]($style) ";
    };

    c = {
      symbol = "c/";
      format = "[ $symbol ($version)]($style)";
    };

    php = {
      symbol = "php/";
      format = "[ $symbol ($version)]($style)";
    };

    java = {
      symbol = "java/";
      format = "[ $symbol ($version)]($style)";
    };

    dotnet = {
      symbol = ".net/";
      format = "[ ($tfm)]($style)";
    };

    nodejs = {
      symbol = "nodejs/";
      format = "[ $symbol($version)]($style)";
    };

    rust = {
      symbol = "rust/";
      format = "[ $symbol ($version)]($style)";
    };

    palettes.catppuccin_mocha = {
      rosewater = "#f5e0dc";
      flamingo = "#f2cdcd";
      pink = "#f5c2e7";
      mauve = "#cba6f7";
      red = "#f38ba8";
      maroon = "#eba0ac";
      peach = "#fab387";
      yellow = "#f9e2af";
      green = "#a6e3a1";
      teal = "#94e2d5";
      sky = "#89dceb";
      sapphire = "#74c7ec";
      blue = "#89b4fa";
      lavender = "#b4befe";
      text = "#cdd6f4";
      subtext1 = "#bac2de";
      subtext0 = "#a6adc8";
      overlay2 = "#9399b2";
      overlay1 = "#7f849c";
      overlay0 = "#6c7086";
      surface2 = "#585b70";
      surface1 = "#45475a";
      surface0 = "#313244";
      base = "#1e1e2e";
      mantle = "#181825";
      crust = "#11111b";
    };
  };
}
