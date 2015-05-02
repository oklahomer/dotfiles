" As of 2015-05-01, with the latest version of jedi-vim,
" this workaround seems no longer required.
" https://github.com/davidhalter/jedi-vim/issues/399

"" https://github.com/davidhalter/jedi-vim/issues/179
" if g:jedi#popup_select_first == 0
"   inoremap <buffer> . .<C-R>=jedi#complete_opened() ? "" : "\<lt>C-X>\<lt>C-O>\<lt>C-P>"<CR>
" endif
