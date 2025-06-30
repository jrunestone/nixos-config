{ pkgs, lib, config, ... }: {
  programs.vscode = {
    enable = true;

    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          ms-dotnettools.csdevkit
          ms-dotnettools.csharp
          ms-vscode-remote.remote-containers
          ms-vscode.theme-tomorrowkit
          dbaeumer.vscode-eslint
          esbenp.prettier-vscode
        ];

        keybindings = [
          {
            key = "ctrl+'";
            command = "editor.action.commentLine";
            when = "editorTextFocus && !editorReadonly";
          }

          {
            key = "ctrl+shift+d";
            command = "editor.action.copyLinesDownAction";
            when = "editorTextFocus && !editorReadOnly";
          }

          {
            key = "ctrl+alt+s";
            command = "workbench.action.files.saveAll";
          }
        ];

        userSettings = {
          "workbench.colorTheme" = "Tomorrow Night";
          "dev.containers.dockerPath" = "podman";
          "dev.container.dockerSocketPath" = "/run/user/1000/podman/podman.sock";
          "explorer.confirmDragAndDrop" = false;
          "remote.autoForwardPortsSource" = "hybrid";
          "update.mode" = "none";
          "extensions.ignoreRecommendations" = true;
          "extensions.autoUpdate" = false;
          "workbench.startupEditor" = "none";
          "editor.codeLens" = false;
        };
      };
    };
  };
}
