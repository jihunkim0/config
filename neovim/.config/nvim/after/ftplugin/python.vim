setlocal formatprg=black\ --quiet\ -
augroup black-fmt
    autocmd!
    autocmd BufWritePre <buffer> normal gggqG``
augroup END
