{ config, pkgs, lib, ... }:

# fndef that copies files from the source to the target directory
# preferred in some scenarios over `home.file` to allow for file modification, which is required by some apps (like nvim).
# additionally, it makes it easier to test and modify configs without dealing with nix symlinks
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
    nvimConfig = copyDotfiles ../../dotfiles/nvim ".config/nvim";
    pwshConfig = copyDotfiles ../../dotfiles/pwsh ".config/powershell";
  };
}
