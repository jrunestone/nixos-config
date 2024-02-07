{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "grub2-themes";
  version = "2022-10-30";

  src = fetchFromGitHub ({
    owner = "vinceliuice";
    repo = "grub2-themes";
    rev = "000171da277b8d0219f90782708d42c700081a44";
    hash = "sha256-KYwOOYAWsFNM5EGdauew5HOVj9HdWWGcjGy7mLX+V6w=";
  });

  installPhase = ''
    runHook preInstall
    ./install.sh -b -t tela -s 4k
    runHook postInstall
  '';

  meta = {
    description = "Modern Design theme for Grub2";
    homepage = "https://github.com/vinceliuice/grub2-themes";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ ];
  };
}