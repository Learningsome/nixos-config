{
  pkgs,
  config,
  ...
}: let
  nvimConfig = "${config.home.homeDirectory}/nixos-config/home/nikolaj/nvim/config/lua";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      git
      curl
      ripgrep
      fd
      fzf
      gcc
      tree-sitter
      lazygit
      luarocks
      lua-language-server
      stylua
      luaPackages.luacheck
      nixd
      alejandra
    ];

    initLua = ''
      -- bootstrap lazy.nvim, LazyVim and your plugins
      require("config.lazy")
    '';
  };

  # Линкуем конфиг lazyvim
  xdg.configFile = {
    "nvim/lua" = {
      source = config.lib.file.mkOutOfStoreSymlink nvimConfig;
      recursive = true;
    };
    "nvim/.neoconf.json".source = ./config/.neoconf.json;
    "nvim/stylua.toml".source = ./config/stylua.toml;
  };
}
