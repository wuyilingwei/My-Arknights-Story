@ECHO OFF
title 明日方舟剧情文件编写器 ver. A0.2
rem 初始化
mkdir Storylibrary

rem 判断是否有未保存的工作（未启用）

:mainmenu
rem 主页面菜单
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
if %errorlevel%==2 goto mainmenu
if %errorlevel%==3 notepad.exe setting.bat
if %errorlevel%==4 goto about
if %errorlevel%==5 exit
:write
cd "Storylibrary"
Dir
echo 请选择剧情文件
set /p "story=[剧情文本名称]
if exist %story%.txt goto enr
echo 未检测到已有文件，将创建新剧情文件
set /p ann=[关卡注释]
choice /C YN /M 该剧情是否允许跳过？
if %errorlevel%==1 (echo ^[HEADER^(key=^"title_test^", is_skippable=true, fit_mode=^"BLACK_MASK^"^)^] %ann%>>%story%.txt)
if %errorlevel%==2 (echo ^[HEADER^(key=^"title_test^", is_skippable=false, fit_mode=^"BLACK_MASK^"^)^] %ann%>>%story%.txt)
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
echo 5-动作

choice /C 12345
cls
if %errorlevel%==1 goto voi
if %errorlevel%==2 goto bac
if %errorlevel%==3 goto chr
if %errorlevel%==4 goto wri
if %errorlevel%==5 goto act

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
if %errorlevel%==4 goto soua
if %errorlevel%==5 goto voip

:musa
rem 添加音乐播放
set /p int=[intro前奏？]
set /p key=[key音乐]
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

:soua
rem 添加声音播放
set /p key=[key音乐]
set /p vol=[volume音量]
echo ^[PlaySound^(key=^"^$%key%^", volume=%vol%^)^]>>%story%.txt
cls
echo 已添加^[PlaySound^(key=^"^$%key%^", volume=%vol%^)^]
goto voi

:voip
rem 预设音乐组（未开发）
echo 功能暂未开发
goto voi


:chr
rem 角色设定主菜单
echo 当前菜单：角色设定
echo 1-返回
echo 2-设定场上角色（1）
echo 3-关闭音乐
echo 4-播放声音Sound
echo 5-应用预设-未启用
choice /C 1234

if %errorlevel%==1 goto enr
if %errorlevel%==2 goto musa
if %errorlevel%==3 goto muss
if %errorlevel%==4 goto soua
if %errorlevel%==5 goto voip





if %errorlevel%==1 
if %errorlevel%==2 
if %errorlevel%==3 
if %errorlevel%==4 
if %errorlevel%==5 