* terminal bg (prompt..)
* just commands
* persist nugets
* slow bash/prompt in dir with many files


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
* dev-certs (just cmd?)
* structure for multiple envs
  * local urls, localhost:ports or nginx proxy?
  * multiple db servers, single db?
  * single db server, multiple dbs?
* just for podman commands such as log etc

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
    1. Gradience/theme

## Commands
`nix-rebuild [switch|boot] $NIXCONFIG.#$HOSTNAME` or `buildnix [switch|boot]`
`journalctl -u home-manager-jr.service`
`journalctl --identifier "hm-activate-$user"`
