" https://github.com/davidhalter/jedi-vim/issues/179
if g:jedi#popup_select_first == 0
  inoremap <buffer> . .<C-R>=jedi#complete_opened() ? "" : "\<lt>C-X>\<lt>C-O>\<lt>C-P>"<CR>
endif
