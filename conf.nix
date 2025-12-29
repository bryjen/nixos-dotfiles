{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # nvim declared in flake to get a more updated version
  environment.systemPackages = with pkgs; [
    git
    zellij
    tmux
    powershell
  ];

  users.defaultUserShell = pkgs.powershell;

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.kernelParams = [ "video=1440x1080" ];

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}

