{ config, pkgs, ... }:

{
  users.users.bry = {
    isNormalUser = true;
    home = "/home/bry";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.powershell;
    hashedPassword = "$6$1l9sT8LtxNHUpaBa$vJvioCgrSwg2wYFlanBFEOZEIYmel.rpHV4ckCF4xyCPvlRvIMcs5YVvYEPsX9AXzyvhai9FCw8QJz2lokDS//";
  };
}
