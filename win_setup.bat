REM a batch file to set up vimrc files on windows machines.
REM creates hard links in the home directory that will refer 
REM to the files in the cloned git repo in vimfiles
mklink /H %HOMEPATH%\_vimrc %HOMEPATH%\vimfiles\_vimrc
mklink /H %HOMEPATH%\_gvimrc %HOMEPATH%\vimfiles\_gvimrc

REM create the vim backups and swaps folders in the HOME path
if not exist %HOMEPATH%\_vim_backups mkdir %HOMEPATH%\_vim_backups
if not exist %HOMEPATH%\_vim_swaps mkdir %HOMEPATH%\_vim_swaps
