{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    initLua = ''
      -- bootstrap lazy.nvim, LazyVim and your plugins
      require("config.lazy")
    '';
  };

  # Lazyvim dependencies
  home.packages = with pkgs; [
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
  ];
}
