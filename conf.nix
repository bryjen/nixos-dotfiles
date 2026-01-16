{ config, lib, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # nvim declared in flake to get a more updated version
  environment.systemPackages = with pkgs; [
    clang
    cargo
    unzip
    neofetch
    git
    zellij
    tmux
    powershell
  ];

  users.defaultUserShell = pkgs.powershell;

  boot.loader.grub.enable = false;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}

