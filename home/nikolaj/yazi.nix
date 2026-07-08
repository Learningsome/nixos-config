# home/nikolaj/yazi.nix

{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    settings = {
      mgr = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };

    plugins = with pkgs.yaziPlugins; {
      inherit
        git
        chmod
        vcs-files
        full-border
        smart-enter
        toggle-pane
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
