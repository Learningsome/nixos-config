_: {
  programs.foot = {
    enable = true;

    server = {
      enable = true;
      systemdTarget = "graphical-session.target";
    };

    settings = {
      main = {
        include = "~/.config/foot/themes/noctalia";
        font = "JetBrainsMono Nerd Font:size=14";
        selection-target = "clipboard";
        bold-text-in-bright = "palette-based";
        pad = "15x0 center-when-maximized-and-fullscreen";
        dpi-aware = "no";
        box-drawings-uses-font-glyphs = "no";
      };
      mouse = {
        hide-when-typing = "yes";
        alternate-scroll-mode = "yes";
      };
      scrollback = {
        indicator-position = "relative";
        indicator-format = "line";
      };
      colors-dark = {
        alpha = 0.85;
      };
      cursor = {
        style = "block";
        blink = "yes";
        blink-rate = 500;
        unfocused-style = "hollow";
      };
    };
  };
}
