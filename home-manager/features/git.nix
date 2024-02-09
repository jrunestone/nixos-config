{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.git ];
  
  programs.git = {
    enable = true;
    
    aliases = {
      s = "status";
      l = "log --pretty='%C(Yellow)%h %C(reset)%ad (%C(Green)%cr%C(reset)) %C(Cyan)%an %C(auto)%d %C(reset)%s' --date=format:'%Y-%m-%d %H:%M' --graph";
      u = "reset HEAD~1";
    };

    extraConfig = {
      init.defaultBranch = "main";

      pull = {
        rebase = true;
      };

      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };
    };

    userName = "Johan Runsten";
  };
}
