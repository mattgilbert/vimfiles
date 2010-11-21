syn match topic '^\w\+.*$'
syn match noteheader  '^\s\+\w.*$'
syn match note  '^\s\+- .*$'
syn match noteDone '^\s\+x .*$'
syn match importantNote '^\s\+!.*$'

syn region topicBlock start='^\w\+.*\n\_^\(\s\+\|\n\).*$' end='\n\n\_^\w\+.*$\|\%$' fold transparent


let b:current_syntax = "todolist"

hi def link topic         Title
hi def link note          String
hi def link noteDone      Comment
hi def link noteheader    PreProc
hi def link importantNote WarningMsg


set foldmethod=syntax
set foldtext=TodoFoldText()

function! TodoFoldText()
    let doneCount = 0
    let notDoneCount = 0
    let warningCount = 0
    let linenum = v:foldstart

    while linenum <= v:foldend
        let line = getline(linenum)
        if match(line, '^\s\+- .*$') == 0
            let notDoneCount = notDoneCount + 1 
        elseif match(line, '^\s\+x .*$') == 0
            let doneCount = doneCount + 1
        elseif match(line, '^\s\+! .*$') == 0
            let warningCount = warningCount + 1 
        endif
        let linenum = linenum + 1
    endwhile
    let warnText = ""
    if warningCount > 0 
        let warnText = warningCount . " WARNINGS!  "
    endif
    return ">> " . getline(v:foldstart) . "  " . warnText . " (" . doneCount . "/" . (notDoneCount + doneCount)  .")"
endfunction

function! ToggleNote()
    let lineNum = line(".")
    let line = getline(lineNum)

    if match(line, '^\s\+- .*$') == 0
        exe 's/^\s\+\zs- /x /'    
    elseif match(line, '^\s\+! .*$') == 0
        exe 's/^\s\+\zs! /x /'    
    else
        exe 's/^\s\+\zsx /- /'    
    endif
endfunction

function! ToggleWarning()
    let lineNum = line(".")
    let line = getline(lineNum)

    if match(line, '^\s\+- .*$') == 0
        exe 's/^\s\+\zs- /! /'    
    elseif match(line, '^\s\+! .*$') == 0
        exe 's/^\s\+\zs! /x /'    
    else
        exe 's/^\s\+\zsx /! /'    
    endif
endfunction

function! DetermineNewLine()
    let lineNum = line(".")
    if lineNum == 0 
        return ""
    endif

    let prev = getline(lineNum)
    if match(prev, '^\s\+\(-\|x\|!\) $') == 0
        return "\<C-O>" . "S" . "\<CR>" . "\<C-O>" . "S" . "\<C-O>" . "2<<"
    elseif match(prev, '^\s\+\(-\|x\|!\) .\+$') == 0
        return "\<CR>" . "- "
    else
        return "\<CR>"
        "return "\<CR>" . prev
    endif
endfunction

nmap <silent> <leader>x :call ToggleNote()<CR>
nmap <silent> <leader>w :call ToggleWarning()<CR>

inoremap <expr> <CR> DetermineNewLine()
nmap o A<CR>
nmap O kA<CR>

