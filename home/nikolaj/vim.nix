# home/nikolaj/vim.nix
{
  config,
  pkgs,
  ...
}: {
  programs.vim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      ale
      vim-nix
      fzf-vim
      lightline-vim
      lightline-ale
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

      " === ale основные настройки ===
      let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'nix': ['alejandra'],
      \   'terraform': ['terraform'],
      \}
      let g:ale_fix_on_save = 1
      let g:ale_linters = {
      \   'nix': ['nix', 'statix', 'deadnix'],
      \   'terraform': ['terraform', 'terraformls', 'tfsec'],
      \}
      let g:ale_lint_on_save = 1
      let g:ale_lint_on_insert_leave = 0
      let g:ale_lint_on_enter = 1
      let g:ale_lint_on_text_changed = 'never'
      let g:ale_completion_enabled = 1
      let g:ale_sign_column_always = 1

      " === lightline-ale ===
      let g:lightline = {}
      let g:lightline.component_expand = {
            \ 'linter_checking': 'lightline#ale#checking',
            \ 'linter_infos': 'lightline#ale#infos',
            \ 'linter_warnings': 'lightline#ale#warnings',
            \ 'linter_errors': 'lightline#ale#errors',
            \ 'linter_ok': 'lightline#ale#ok',
            \ }
      let g:lightline.component_type = {
            \ 'linter_checking': 'right',
            \ 'linter_infos': 'right',
            \ 'linter_warnings': 'warning',
            \ 'linter_errors': 'error',
            \ 'linter_ok': 'right',
            \ }
      let g:lightline.active = {
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
            \ [ 'lineinfo' ],
          \ [ 'percent' ],
          \ [ 'fileformat', 'fileencoding', 'filetype'] ] }
    '';
  };
}
