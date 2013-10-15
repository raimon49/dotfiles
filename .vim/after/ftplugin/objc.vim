if !exists('g:clang_auto_user_options')
let g:clang_auto_user_options = 'path, .clang_complete, ios'
call altr#remove_all()
call altr#define('%.h', '%.m')
endif
