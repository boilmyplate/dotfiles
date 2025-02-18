{ config, pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        theme = {
	  enable = true;
	  name = "gruvbox";
	  style = "dark";
	}; 

        lazy.plugins = {
          "vim-suda" = {
            package = pkgs.vimPlugins.vim-suda;
          };
        };

        statusline.lualine.enable = true;
	autocomplete.nvim-cmp.enable = true;
	telescope.enable = true;

        languages = {
	  enableLSP = true;
	  enableTreesitter = true;

	  nix.enable = true;
	};
      };
      
    };
  };

}
