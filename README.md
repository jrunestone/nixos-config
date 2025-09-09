## TODO
* stylix

## Known issues
* History scan up/down (history substring search) doesn't work with p10k
* Keyring doesn't unlock on boot
* fzf default command doesnt ignore git folder

## Aliases
* `$NIXCONFIG` or `nixdir`
* `nixedit`
* `nix-rebuild [switch|boot] $NIXCONFIG.#$HOSTNAME` or `nixbuild [switch|boot]`
* `nix flake update && nixupdates` to show what will be updated
* `nix flake update <input>` update a single input
* `nixversions` to show current versions
* `nixgenerations`

### devshells
* Uses devenvs with flakes and nix develop.
* Separate repo for project-specific devenv setups
* A devenv is a parent folder with meta files and then the project in a project dir gitignored
* Run `just develop` to init the devenv with the correct dirs, setup certs etc

## Install
NOTE: User is hard-coded to "jr" in flake for all hosts. 

NOTE: Secrets are fetched from a private git repo as a flake input.

TODO: do this with nixos-anywhere to transfer ssh keys etc

1. Run installer iso
2. Exit installer into cmd
3. `git clone https://github.com/jrunestone/nixos-config.git`
4. `sudo su`
5. `nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /home/nixos/nixos-config/hosts/shared/disko-config.nix --arg disk '"/dev/<disk>"'`
6. `mkdir -p {/mnt/nix/persist/system/etc/nixos,/mnt/nix/persist/system/passwords}`
7. `mv nixos-config /mnt/nix/persist/system/etc/nixos`
8. `mkpasswd -m sha-512 "<password>" > /mnt/nix/persist/system/passwords/jr`
9. `nixos-generate-config --no-filesystems --root /mnt` and copy hardware-info.nix to repo/host if new host
10. Copy over ssh keys to /etc/ssh chmod 0600 and add to ssh agent to be able to authenticate with GitHub
11. Clone nixos-secrets and generate certs for host
12. `nixos-install --no-root-passwd --root /mnt --flake /mnt/nix/persist/system/etc/nixos/nixos-config#<host>`
13. `reboot`
14. Make sure ssh keys are in the user folder
