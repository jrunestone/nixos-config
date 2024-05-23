## TODO WORK
* keybind media keys
* have each monitor have its own workspace queue

## TODO
* stylix
* sublime package ctl
* pwa: outlook, teams, proton
* Keyring doesn't unlock on boot
* fzf default command doesnt ignore git folder

## Known issues
* History scan up/down (history substring search) doesn't work with p10k
* No audio in games running in bottles if Spotify is running

## Aliases
* `$NIXCONFIG` or `nixdir`
* `nixedit`
* `nix-rebuild [switch|boot] $NIXCONFIG.#$HOSTNAME` or `nixbuild [switch|boot]`

### devshells
* Uses devenvs with flakes and nix develop.
* Separate repo for project-specific devenv setups
* A devenv is a parent folder with meta files and then the project in a project dir gitignored
* Run `just develop` to init the devenv with the correct dirs, setup certs etc

Todo:
* Global justfile for shared cmds like develop, export/import db, make certs
* Change to a shared azure sql server for umbraco dbs?
* Local url mapping with traefik or other?
* Set AZ subscription automatically

Global command ideas:
* Dockerify an umbraco project

## Install
User is hard-coded to "jr" in flake for all hosts.

1. Run installer iso
2. Exit installer into cmd
3. `git clone https://github.com/jrunestone/nixos-config.git`
4. `sudo su`
5. `nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /home/nixos/nixos-config/hosts/shared/disko-config.nix --arg disk '"/dev/<disk>"'`
6. `mkdir -p {/mnt/nix/persist/system/etc/nixos,/mnt/nix/persist/system/passwords}`
7. `mv nixos-config /mnt/nix/persist/system/etc/nixos`
8. `mkpasswd -m sha-512 "<password>" > /mnt/nix/persist/system/passwords/jr`
9. `nixos-generate-config --no-filesystems --root /mnt` and copy hardware-info.nix to repo/host if new host
10. `nixos-install --no-root-passwd --root /mnt --flake /mnt/nix/persist/system/etc/nixos/nixos-config#<host>`
11. `reboot`
12. Copy over ssh keys
