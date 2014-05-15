if exists(":UndoTreeToggle")
    let vimcachedir = "$XDG_CACHE_HOME/vim"
    let &runtimepath.=',',vimcachedir

    if has('persistent_undo')
        let MyUndoDir = expand(vimcahedir . '/undodir')
        call system('mkdir ' . MyUndoDir)
        let &undodir = MyUndoDir
        set undofile
    endif
    nnoremap <Leader>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1
endif
