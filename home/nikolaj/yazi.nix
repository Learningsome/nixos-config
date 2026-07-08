# home/nikolaj/yazi.nix

{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    settings = {
      # Works but i don't want to
      # theme = {
      #   light = "noctalia";
      #   dark = "noctalia";
      # };
      mgr = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };

      plugin.prepend_fetchers = [
        {
          url = "*";
          run = "git";
          group = "git";
        }
        {
          url = "*/";
          run = "git";
          group = "git";
        }
      ];
    };

    plugins = with pkgs.yaziPlugins; {
      inherit
        git
        chmod
        vcs-files
        full-border
        smart-enter
        toggle-pane
        starship
        ;
    };

    initLua = ''
      require("git"):setup {
      	-- Order of status signs showing in the linemode
      	order = 1500,
      }
      require("full-border"):setup {
      	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
      	type = ui.Border.ROUNDED,
      }
      require("starship"):setup()
    '';

    keymap = {
      mgr.prepend_keymap = [
        {
          on = [
            "c"
            "m"
          ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
        {
          on = [
            "g"
            "c"
          ];
          run = "plugin vcs-files";
          desc = "Show Git file changes";
        }
        {
          on = "l";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }
      ];
    };
  };
}
