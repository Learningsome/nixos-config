{ config, pkgs, ... }:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "main";
    hash = pkgs.lib.fakeHash;
  };
in
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

    plugins = {
      git = "${yazi-plugins}/git.yazi";
      chmod = "${yazi-plugins}/chmod.yazi";
      vcs-files = "${yazi-plugins}/vcs-files.yazi";
      full-border = "${yazi-plugins}/full-border.yazi";
      smart-enter = "${yazi-plugins}/smart-enter.yazi";
      toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
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
      require("smart-enter"):setup()
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
