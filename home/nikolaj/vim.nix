# home/nikolaj/vim.nix
{
  config,
  pkgs,
  ...
}: {
  programs.vim = {
    enable = false;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      fzf-vim
      lightline-vim
      # onedark-vim
    ];

    settings = {
      # Отображение
      number = true;
      relativenumber = true;
      background = "dark";

      # Отступы
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      copyindent = true;

      # Поиск
      ignorecase = true;
      smartcase = true;

      # Мышь
      mouse = "a";
      mousefocus = false;
      mousehide = true;
      mousemodel = "extend";
    };

    extraConfig = ''
      " Общие настройки
      syntax on                 " включить подсветку синтаксиса
      filetype plugin indent on " включить плагины и отступы по типу файла
      set clipboard=unnamedplus " использовать системный буфер обмена
      set cursorline            " подсветка текущей строки
      set showcmd               " показывать вводимые команды
      set showmatch             " подсветка парных скобок
      set hlsearch              " подсветка результатов поиска
      set incsearch             " интерактивный поиск при вводе

      " Настройки темы
      " colorscheme onedark
      " let g:lightline = { 'colorscheme': 'onedark', }
    '';
  };
}
