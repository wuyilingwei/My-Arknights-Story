@ECHO OFF
title 明日方舟剧情文件编写器 ver. A0.1
rem 初始化

rem 判断是否有未保存的工作（未启用）
:mainmenu
cls
echo ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
echo ┃ 〓 菜单 〓                       ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
echo ┃ 1.进入剧情编写模式               ┃
echo ┃ 2.进入文本转换模式(不可用)       ┃
echo ┃ 3.设置（不可用）                 ┃
echo ┃ 4.关于本软件                     ┃
echo ┃ 5.退出                           ┃
echo ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
choice /C 12345
cls
if %errorlevel%==1 goto write
if %errorlevel%==2 goto write
if %errorlevel%==3 notepad.exe setting.bat
if %errorlevel%==4 goto write
if %errorlevel%==5 exit
:write
cd "%Storylibrary"
Dir
echo 请选择剧情文件
set /p "story=[剧情文本名称]
if exist %story%.txt goto enr
echo 未检测到已有文件，将创建新剧情文件
choice /C YN /M 该剧情是否允许跳过？
if %errorlevel%==1 (echo ^[HEADER^(key=^"title_test^", is_skippable=true, fit_mode=^"BLACK_MASK^"^)^]>>%story%.txt)
if %errorlevel%==2 (echo ^[HEADER^(key=^"title_test^", is_skippable=false, fit_mode=^"BLACK_MASK^"^)^]>>%story%.txt)
echo [stopmusic]>>%story%.txt
echo 文件初始化完毕
echo.
timeout /t 1>nul
:enr
cls
echo 当前文件名[%story%]
echo 1-音乐设定
echo 2-背景设定
echo 3-角色定义
echo 4-发言

choice /C 123456789
cls
if %errorlevel%==1 goto voi
if %errorlevel%==2 goto write
if %errorlevel%==3 (notepad.exe setting.bat)
if %errorlevel%==4 goto write
if %errorlevel%==5 exit

:voi
rem 音乐设定主菜单
echo 当前菜单：音乐设定
echo 1-返回
echo 2-开启音乐Music
echo 3-关闭音乐
echo 4-播放声音Sound
echo 5-应用预设-未启用
choice /C 1234
if %errorlevel%==1 goto enr
if %errorlevel%==2 goto musa
if %errorlevel%==3 goto muss
if %errorlevel%==4 
if %errorlevel%==5 

:musa
rem 添加音乐播放
set /p int=[intro前奏]
set /p key=[key音调]
set /p vol=[volume音量]
echo ^[playMusic(intro=^"^$%int%^", key=^"^$%key%^", volume=%vol%)^]>>%story%.txt
cls
echo 已添加^[playMusic(intro=^"^$%int%^", key=^"^$%key%^", volume=%vol%)^]
goto voi

:muss
rem 关闭音乐
echo [stopmusic]>>%story%.txt
cls
echo 已添加[stopmusic]
goto voi

if %errorlevel%==1 
if %errorlevel%==2 
if %errorlevel%==3 
if %errorlevel%==4 
if %errorlevel%==5 