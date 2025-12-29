{ config, pkgs, ... }:

{
  home.stateVersion = "24.05";

  home.file.".config/nvim" = {
    source = ./nvim-config;
    recursive = true;
    force = true;  # force writes instead of symlinking
  };

  home.activation.nvimConfig = config.lib.dag.entryAfter ["writeBoundary"] ''
    rm -rf ~/.config/nvim
    cp -r ${./nvim-config} ~/.config/nvim
    chmod -R u+w ~/.config/nvim
  '';
}
