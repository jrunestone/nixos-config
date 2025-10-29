{ inputs, pkgs, lib, config, ... }: {
  home.packages = [ pkgs.gitstatus ];

  programs.git = {
    enable = true;
 
    settings = {
      alias = {
        logp = "log --pretty='%C(Yellow)%h %C(reset)%ad (%C(Green)%cr%C(reset)) %C(Cyan)%an %C(auto)%d %C(reset)%s' --date=format:'%Y-%m-%d %H:%M' --graph";
        undoc = "reset HEAD~1";
        pp = "push origin HEAD";
        pl = "!git pull origin $(git branch --show-current)";
      };

      core.autocrlf = "input";
      core.askPass = "";
      init.defaultBranch = "main";
      credential.helper = "cache --timeout=28800";
      pull.rebase = true;

      url = {
        "git@github.com:" = {
          insteadOf = "https://github.com/";
        };
      };

      user = {
        name = "Johan Runsten";
        email = inputs.nixos-secrets.hosts.${config.host-options.hostname}.email;
      };
    };
  };
}
