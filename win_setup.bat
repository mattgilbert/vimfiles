REM a batch file to set up vimrc files on windows machines.
REM creates hard links in the home directory that will refer 
REM to the files in the cloned git repo in vimfiles
mklink /H %HOME%\_vimrc %HOME%\vimfiles\_vimrc
mklink /H %HOME%\_gvimrc %HOME%\vimfiles\_gvimrc

REM create the vim backups and swaps folders in the HOME path
if not exist %HOME%\_vim_backups mkdir %HOME%\_vim_backups
if not exist %HOME%\_vim_swaps mkdir %HOME%\_vim_swaps
