* terminal bg (prompt..)
* persist nugets and dotnet tools


* Steam
* PWA
    * Outlook/other?
    * Teams
    * Protonpass

### devshells
nix-direnv + flakes
* docker-compose for (redis, sql)
* flake for pkgs (dotnet, node, az)
* template flakes in nix-config repo
* keep stuff in a user-specific gitignored folder in the project
  * env/jr
  * contains flake.*, .env, .az, docker-compose, just cmds, dev-certs etc
  * run just dev to load .env file and run nix develop
  * run (global) just init-dev to symlink the env/jr dir from another repo
  * have a global just cmd or alias to point to ./env/jr/justfile or a root justfile that imports it
* dev-certs (just cmd?)
* structure for multiple envs
  * local urls, localhost:ports or nginx proxy?
  * multiple db servers, single db?
  * single db server, multiple dbs?
* set az config dir to project dir
  * atm with DEVDIR=$(pwd) nix develop, just cmd? just cmd can check if in the same dir as flake
  * use nixdirenv to load .env with AZURE_CONFIG_DIR= and also az subscription=xx probably?
* set insomnia to project dir?

## Notes
* Obisidan marks unsafe electron as allowed until updated
* Should modularize monitors.xml
* Should look into replacing podman with oci-containers or apptainer
* Should define a std for nix develop flakes and where to store them etc

## Install
User is hard-coded to "jr" in flake for all hosts.

1. Run installer iso
2. Exit installer into cmd
3. `git clone https://github.com/jrunestone/nixos-config.git`
4. `sudo su`
5. `nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /home/nixos/nixos-config/disko-config.nix --arg disk '"/dev/<disk>"'`
6. `mkdir -p {/mnt/nix/persist/system/etc/nixos,/mnt/nix/persist/system/passwords}`
7. `mv nixos-config /mnt/nix/persist/system/etc/nixos`
8. `mkpasswd -m sha-512 "<password>" > /mnt/nix/persist/system/passwords/jr`
9. `nixos-generate-config --no-filesystems --root /mnt` and copy hardware-info.nix to repo/host if new host
10. `nixos-install --no-root-passwd --root /mnt --flake /mnt/nix/persist/system/etc/nixos/nixos-config#<host>`
11. `reboot`
12. Copy over ssh keys
13. Configure initial settings (these are then persisted):
    1. PWA:s

## Commands
* `$NIXCONFIG`
* `editnix`
* `nix-rebuild [switch|boot] $NIXCONFIG.#$HOSTNAME` or `buildnix [switch|boot]`
* `journalctl -b -u home-manager-jr.service`
* `journalctl -b --identifier "hm-activate-$user"`
