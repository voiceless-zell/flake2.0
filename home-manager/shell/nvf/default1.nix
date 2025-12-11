{... }:
{
  programs = {
    nvf = {
      enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "tokyonight";
          style = "night";
        };
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        filetree = {
          neo-tree.enable = true;
        };
         terminal.toggleterm = {
            enable = true;
            lazygit = {
            enable = true;
            };
          };

        languages = {
          enableLSP = true;
          enableTreesitter = true;


          nix.enable = true;
        };
        binds =  {
          whichKey = {
            enable = true;
               };

        };
      maps.normal= {
            "<leader>e" = {
      desc = "NeoTree";
      action = "<cmd>Neotree toggle reveal<CR>";
            };
            "<C>w" = {
              desc = "save";
              action = "<cmd>w<CR>";
              };
          };
      };
      };
    };
  };
}
