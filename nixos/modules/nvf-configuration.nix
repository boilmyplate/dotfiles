{
  config,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        binds.cheatsheet.enable = true;
        binds.whichKey.enable = true;

        options = {
          termguicolors = true;
          shiftwidth = 4;
          tabstop = 4;
        };

        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        dashboard.dashboard-nvim.enable = true;
        filetree.nvimTree.enable = true;
        filetree.nvimTree.mappings.toggle = "\\";
        tabline.nvimBufferline.enable = true;
        tabline.nvimBufferline.mappings = {
          closeCurrent = "<leader>bw";
        };
        tabline.nvimBufferline.setupOpts.options = {
          separator_style = "slant";
          indicator.style = "underline";
          indicator.icon = "  ";
          numbers = "none";
        };

        lazy.plugins = {
          vim-suda = {
            package = pkgs.vimPlugins.vim-suda;
          };
        };

        statusline.lualine.enable = true;
        autocomplete.nvim-cmp.enable = true;
        telescope.enable = true;

        syntaxHighlighting = true;

        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
          setupOpts.direction = "float";
        };

        languages = {
          enableLSP = true;
          enableFormat = true;
          enableTreesitter = true;

          nix.enable = true;
        };
      };
    };
  };
}
