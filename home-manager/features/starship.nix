{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.starship ];

  programs.starship = {
    enable = true;
  };

  programs.bash.initExtra = ''
    eval "$(starship init bash)"
  '';

  programs.starship.settings = {
    format = "$nix_shell$directory$git_branch$git_status$git_state$time$cmd_duration$status$line_break$character";

    character = {
      success_symbol = "[\\$]($style)";
      error_symbol = "[\\$]($style)";
    };

    directory = {
      style = "fg:#9b859d";
      format = "[ $path ]($style)";
      truncate_to_repo = false;
      truncation_length = 10;
      truncation_symbol = "…/";
    };

    time = {
      style = "fg:#cda869";
      disabled = false;
      time_format = "%R";
      format = "[ 󱑔 $time ]($style)";
    };

    cmd_duration = {
      style = "fg:#8f9d6a";
      format = "[ ⏱ $duration ]($style)";
    };

    status = {
      style = "fg:#8f9d6a";
      disabled = false;
      format = "[  $status ]($style)";
    };

    git_status = {
      style = "fg:#f9ee98";
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
      style = "fg:#f9ee98";
      symbol = "";
      format = "[ $symbol $branch ]($style)";
    };

    git_state = {
      style = "fg:#f9ee98";
      format = "[ \($state( $progress_current/$progress_total)\)]($style) ";
    };

    nix_shell = {
      style = "fg:#cf6a4c";
      symbol = "shell";
      format = "[\\[$symbol\\] ]($style)";
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
  };
}
