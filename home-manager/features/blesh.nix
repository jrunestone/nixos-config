{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.blesh ];
  #programs.blesh.enable = true;

  programs.bash.initExtra = ''
    source "$(blesh-share)"/ble.sh --attach=none
    ble-attach
  '';

  home.file.".blerc".text = ''
    ble-bind -f up 'history-search-backward immediate-accept'
    ble-bind -f down 'history-search-forward immediate-accept'

    bleopt prompt_eol_mark=
    bleopt exec_errexit_mark=
    bleopt exec_elapsed_mark=
    #bleopt exec_exit_mark=
    #bleopt edit_marker=
    #bleopt edit_marker_error=

    ble-face auto_complete='fg=#6c7086'
    ble-face syntax_command='fg=default,bold'
    ble-face syntax_quoted='fg=#a6e3a1'
    ble-face syntax_quotation='fg=#a6e3a1'
    ble-face command_builtin='fg=default,bold'
    ble-face command_file='fg=default,bold'
    ble-face command_alias='fg=default,bold'
    ble-face command_function='fg=default,bold'
    ble-face command_directory='fg=#b4befe,underline'
    ble-face filename_directory='fg=#b4befe,underline'
    ble-face argument_option='fg=#afc4db'
    ble-face region_insert='fg=#b4befe'
    ble-face region_match='bg=153,fg=black,bold'
    ble-face varname_export='fg=#a6e3a1,bold'
    ble-face syntax_error='bg=#f38ba8'
  '';
}
