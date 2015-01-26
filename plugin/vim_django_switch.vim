python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))
python project_dir = ""

"Functions
"
"
function! Open_settings_folder_file(filename)
let filename= a:filename
python << endOfPython
from vim_django_switch import open_settings_folder_file, open_app_file
filename = vim.eval("a:filename")
global project_dir
project_dir = open_settings_folder_file(current_file_filename = vim.current.buffer.name, filename = filename, project_dir = project_dir)
endOfPython
endfunction

function! Open_app_file(filename)
let filename= a:filename
python << endOfPython
from vim_django_switch import open_app_file
filename = vim.eval("a:filename")
global project_dir
project_dir = open_app_file(current_file_filename = vim.current.buffer.name, filename = filename, project_dir = project_dir)
endOfPython
endfunction

function! CleanProjectDir()
python << endOfPython
global project_dir
project_dir = ""
endOfPython
endfunction

command! -nargs=* Djc call CleanProjectDir()
command! -nargs=* Djs call Open_settings_folder_file("settings.py")
command! -nargs=* Dju call Open_settings_folder_file("urls.py")
command! -nargs=* Djv call Open_app_file("views.py")
command! -nargs=* Djm call Open_app_file("models.py")
command! -nargs=* Djf call Open_app_file("forms.py")
command! -nargs=* Dja call Open_app_file("admin.py")
command! -nargs=* Djr call Open_app_file("api/resources.py")
