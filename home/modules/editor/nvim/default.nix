{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      bufferline-nvim
      nvim-dap
      nvim-dap-ui
      rust-tools-nvim
      vim-nix
    ];
  };
}
