{ inputs, pkgs, ...}:
{
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    plugins = {
      lsp-format = {
        enable = true;
        lspServersToEnable = [
          "all"
        ];
      };
      lsp = {
        enable = true;
      };
      treesitter = { 
        enable = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          markdown
          nix
          toml
          vim
          vimdoc
          xml
          yaml
        ];
      };
      web-devicons.enable = true;
      toggleterm = {
    enable = true;
    settings = {
      size = 20;
    };
  };
        cmp = {
            enable = true;
            autoEnableSources = true;
            autoLoad = true;
        };
        dashboard = {
            enable = true;
            autoLoad = true;
        };
        lazygit = {
  enable = true;
  settings.floating_window_border_chars = [
    "╭"
    "─"
    "╮"
    "│"
    "╯"
    "─"
    "╰"
    "│"
  ];
};
markdown-preview.enable = true;
mini = {
  enable = true;
  autoLoad = true;
};
neo-tree = {
    enable = true;
};
nix.enable = true;
telescope = {
    enable = true;
};
which-key = {
    enable = true;
    autoLoad = true;
};
    };
    colorschemes.tokyonight.enable = true;
    # keymaps = [
   # 
 #  ];

    
  };
}
