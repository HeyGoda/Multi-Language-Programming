::原字符串和要替换的字符串
set SrcString=L57_C9_ROOT%
set DstString=L57_C9_ROOT_R99%

::检查原文件是否存在
set SrcFileSet=%1
if not exist %SrcFileSet% (
    exit 1
)
echo %SrcFileSet%
@echo off

::检查备份文件是否存在
if exist %SrcFileSet%~ del %SrcFileSet%~
set BakFile=%SrcFileSet%~

::替换文件中的字符串
setlocal EnableDelayedExpansion
for /f "delims=" %%a in (%SrcFileSet%) do (
    set b=%%a
    set c=!b:%SrcString%=%DstString%!
    echo !c! >> %BakFile%
)
copy %BakFile% %SrcFileSet%
