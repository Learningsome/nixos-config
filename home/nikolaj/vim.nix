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
      vim-nix
      fzf-vim
      vim-lsp
      lightline-vim
      asyncomplete-vim
      asyncomplete-lsp-vim
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

      " Настройки lsp nix
      if executable('nil')
          au User lsp_setup call lsp#register_server({
              \ 'name': 'nil',
              \ 'cmd': {server_info->['nil']},
              \ 'allowlist': ['nix'],
              \ })
      endif

      function! s:on_lsp_buffer_enabled() abort
          setlocal omnifunc=lsp#complete
          setlocal signcolumn=yes
          if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
          nmap <buffer> gd <plug>(lsp-definition)
          nmap <buffer> gs <plug>(lsp-document-symbol-search)
          nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
          nmap <buffer> gr <plug>(lsp-references)
          nmap <buffer> gi <plug>(lsp-implementation)
          nmap <buffer> gt <plug>(lsp-type-definition)
          nmap <buffer> <leader>rn <plug>(lsp-rename)
          nmap <buffer> [g <plug>(lsp-previous-diagnostic)
          nmap <buffer> ]g <plug>(lsp-next-diagnostic)
          nmap <buffer> K <plug>(lsp-hover)
          nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
          nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

          let g:lsp_format_sync_timeout = 1000
          " autocmd! BufWritePre *.nix call execute('LspDocumentFormatSync')
          autocmd! BufWritePre *.nix silent! execute '%!alejandra -qq'

          " refer to doc to add more commands
      endfunction

      augroup lsp_install
          au!
          " call s:on_lsp_buffer_enabled only for languages that has the server registered.
          autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
      augroup END

      " Пробуем фолдинг
      set foldmethod=expr
        \ foldexpr=lsp#ui#vim#folding#foldexpr()
        \ foldtext=lsp#ui#vim#folding#foldtext()

      " Пробуем семантическую подсветку
      let g:lsp_semantic_enabled = 1
    '';
  };
}
