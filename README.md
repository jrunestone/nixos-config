* material shell extensions
* login screen theme
* quiet boot?
* terminal bg (prompt..)
* never turn off screen
* gradience
* tray?

* dev-certs
* Steam
* docker/podman (dev-env)
* Protonpass pwa
* 1Pass (dev-env?)
* PWA (dev-envs?)
    * Outlook
    * Teams

### devshells
nix-direnv + flakes
* dotnet

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
    1. Resolution/rate
    2. Sound output device
    3. Gradience/theme

## Commands
`nix-rebuild [switch|boot] $NIXCONFIG.#$HOSTNAME` or `buildnix [switch|boot]`
`journalctl -u home-manager-jr.service`
`journalctl --identifier "hm-activate-$user"`
