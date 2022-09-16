import "../autoload/popup-buffer.vim"
au BufEnter * call Showbf(3000)
au BufWritePost * call Showbf(3000)
