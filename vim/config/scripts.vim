" Run rubocop through VtR
function! CallRubocopOnFile()
  let file = @%
  let string = "rubocop " . file
  let create_pane_if_needed = 1 " boolean argument for the function
  call VtrSendCommand(string, 1)
endfunction

" Run rubocop with bundle exec through VtR
function! CallBRubocopOnFile()
  let file = @%
  let string = "bundle exec rubocop " . file
  let create_pane_if_needed = 1 " boolean argument for the function
  call VtrSendCommand(string, 1)
endfunction

" Call test for current file in test/file
function! CallTestFileWithMiniTest()
  let file = expand('%:t:r')
  let string = "ruby ./test/" . file . "_test.rb"
  let create_pane_if_needed = 1 " boolean argument for the function
  call VtrSendCommand(string, 1)
endfunction


"----- Set up for Vim Tumx Runner
nnoremap<leader>htr :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>}
nnoremap<leader>vtr :VtrOpenRunner {'orientation': 'v', 'percentage': 20}<cr>}
nnoremap<leader>cop :call CallBRubocopOnFile()<cr>
nnoremap<leader>bcop :call CallBRubocopOnFile()<cr>
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
nnoremap <leader>rpry :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'pry'}<cr>
nnoremap <leader>rat :call CallTestFileWithMiniTest()<cr>
nnoremap <leader>run :VtrSendFile<cr>
nnoremap <leader>!run :VtrSendFile!<cr>
nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>atp :VtrAttachToPane<cr>
nnoremap <leader>sl :VtrSendLinesToRunner<cr>
vnoremap <leader>sl :VtrSendLinesToRunner<cr>
nnoremap <leader>flr :VtrFlushCommand<cr>
nnoremap <leader>reor :VtrReorientRunner<cr>
nnoremap <leader>rear :VtrReattachRunner<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>

let g:VtrPercentage = 50
let g:VtrOrientation = "h"
let g:VtrUseVtrMaps = 0
let g:VtrInitialCommand = ""

