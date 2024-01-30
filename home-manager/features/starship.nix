{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.starship ];

  programs.starship = {
    enable = true;
  };

  programs.bash.initExtra = ''
    eval "$(starship init bash)"
  '';

  programs.starship.settings = {
    format = "[ 󰆚 $nix_shell](fg:#FFFFFF bg:#DA627D)[](fg:#DA627D bg:#d62d53)$directory[](fg:#d62d53 bg:#FCA17D)$git_branch$git_status$git_state[](fg:#FCA17D bg:#33658A)$time[](fg:#33658A bg:#DA627D)$cmd_duration$status[](fg:#DA627D)$line_break$character";

    character = {
      success_symbol = "[\\$](fg:#FFFFFF)";
      error_symbol = "[\\$](fg:#FFFFFF)";
    };

    directory = {
      style = "bg:#d62d53 fg:#FFFFFF";
      format = "[ $path ]($style)";
      truncate_to_repo = false;
      truncation_length = 10;
      truncation_symbol = "…/";
    };

    time = {
      disabled = false;
      time_format = "%R";
      style = "bg:#33658A fg:#FFFFFF";
      format = "[ 󱑔 $time ]($style)";
    };

    cmd_duration = {
      style = "bg:#DA627D fg:#FFFFFF";
      format = "[ ⏱ $duration ]($style)";
    };

    status = {
      disabled = false;
      style = "bg:#DA627D fg:#FFFFFF";
      format = "[  $status ]($style)";
    };

    git_status = {
      style = "bg:#FCA17D fg:#FFFFFF";
      format = "[$all_status$ahead_behind]($style)";
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
      symbol = "";
      style = "bg:#FCA17D fg:#FFFFFF";
      format = "[ $symbol $branch ]($style)";
    };

    git_state = {
      style = "bg:#FCA17D fg:#FFFFFF";
      format = "[ \($state( $progress_current/$progress_total)\)]($style) ";
    };

    nix_shell = {
      symbol = "nix-shell/";
      style = "bg:#DA627D fg:#FFFFFF";
      format = "[\\[$symbol$state\\] ]($style)";
    };

    c = {
      symbol = "c/";
      style = "bg:#86BBD8 fg:#FFFFFF";
      format = "[ $symbol ($version)]($style)";
    };

    php = {
      symbol = "php/";
      style = "bg:#86BBD8 fg:#FFFFFF";
      format = "[ $symbol ($version)]($style)";
    };

    java = {
      symbol = "java/";
      style = "bg:#86BBD8 fg:#FFFFFF";
      format = "[ $symbol ($version)]($style)";
    };

    dotnet = {
      symbol = ".net/";
      style = "bg:#86BBD8 fg:#FFFFFF";
      format = "[ ($tfm)]($style)";
    };

    nodejs = {
      symbol = "nodejs/";
      style = "bg:#86BBD8 fg:#FFFFFF";
      format = "[ $symbol($version)]($style)";
    };

    rust = {
      symbol = "rust/";
      style = "bg:#86BBD8 fg:#FFFFFF";
      format = "[ $symbol ($version)]($style)";
    };
  };
}
