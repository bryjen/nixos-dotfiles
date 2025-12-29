{ config, pkgs, lib, ... }:

let
  copyDotfiles = source: target: config.lib.dag.entryAfter [ "writeBoundary" ] ''
    rm -rf ~/${target}
    cp -r ${source} ~/${target}
    chmod -R u+w ~/${target}
  '';
in
{
  home.stateVersion = "24.05";

  home.activation = {
    nvimConfig = copyDotfiles ./dotfiles/nvim ".config/nvim";
    pwshConfig = copyDotfiles ./dotfiles/pwsh ".config/powershell";
  };
}
