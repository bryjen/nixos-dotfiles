{ pkgs, ... }:

{
  imports = [ ./shared-cli.nix ]; # Not ../root/

  home.stateVersion = "24.05";
}
