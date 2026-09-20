{
  pkgs,
  config,
  ...
}: let
  nvimLuaPath = "${config.home.homeDirectory}/nixos-config/home/nikolaj/nvim/config/lua";
  nvimConfig = "${nvimLuaPath}/config";
  nvimPlugins = "${nvimLuaPath}/plugins";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = false;

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
    "nvim/lua/config/" = {
      source = config.lib.file.mkOutOfStoreSymlink nvimConfig;
      recursive = true;
    };
    "nvim/lua/plugins/" = {
      source = config.lib.file.mkOutOfStoreSymlink nvimPlugins;
      recursive = true;
    };
    "nvim/.neoconf.json".source = ./config/.neoconf.json;
    "nvim/stylua.toml".source = ./config/stylua.toml;
  };
}
