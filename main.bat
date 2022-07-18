@ECHO OFF
title 明日方舟剧情文件编写器 ver. B1.0
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
rem 编辑主菜单
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


:bac
rem 背景设定主菜单
echo 当前菜单：背景设定
echo 1-返回
echo 2-设定背景
echo 3-设置黑屏
choice /C 123
if %errorlevel%==1 goto enr
if %errorlevel%==2 goto bacp
if %errorlevel%==3 goto bacb

:bacp
rem 设定背景
set /p pna=[背景图片名称]
set /p tim=[渐进式进入时间]
echo ^[Background^(image="%pna%", width=1, height=1, fadetime=%tim%^)^]>>%story%.txt
cls
echo 已添加^[Background^(image="%pna%", width=1, height=1, fadetime=%tim%^)^]
goto bac

:bacb
rem 添加黑屏
set /p tim=[黑屏时间设定]
echo ^[Blocker^(a=1, initr=2,fadetime=%tim%, block=true^)^]>>%story%.txt
cls
echo 已添加^[Blocker^(a=1, initr=2,fadetime=%tim%, block=true^)^]
goto bac


:chr
rem 角色设定主菜单
echo 当前菜单：角色设定
echo 1-返回
echo 2-清空角色
echo 3-设定场上角色（1）
echo 4-设定场上角色（2）
choice /C 1234
if %errorlevel%==1 goto enr
if %errorlevel%==2 goto chrc
if %errorlevel%==3 goto chrs
if %errorlevel%==4 goto chrd

:chrc
rem 添加空角色
echo ^[Character^]>>%story%.txt
set chan=0
cls
echo 已添加^[Character^]
goto chr

:chrs
rem 添加单角色
set /p cha1=[角色1]
echo ^[Character^(name="%cha1%"^)^]>>%story%.txt
set chan=1
cls
echo 已添加^[Character^(name="%cha1%"^)^]
goto chr

:chrd
rem 添加双角色
set /p cha1=[角色1]
set /p cha2=[角色2]
set foc=0
echo ^[Character^(name="%cha1%",name2="%cha2%"^)^]>>%story%.txt
set chan=2
cls
echo 已添加^[Character^(name="%cha1%", name2="%cha2%"^)^]
goto chr


:wri
rem 对话主菜单
echo 当前菜单：对话设定
echo 1-返回
echo 2-设置焦点角色
echo 3-设置发言
echo 4-设置插入对话（未启用）
choice /C 123
if %errorlevel%==1 goto enr
if %errorlevel%==2 goto wrif
if %errorlevel%==3 goto wris
if %errorlevel%==4 goto wrie

:wrif
rem 设置场上焦点角色
if not %chan%==2 goto wrife
echo 当前场上左角色为[%cha1%]，右角色为[%cha2%]，焦点为%foc%。
choice /C 12 /M 0-无焦点，1-左，2-右
if %errorlevel%==1 (
    echo ^[Character^(name="%cha1%",name2="%cha2%"^)^]>>%story%.txt
    cls
    echo 已添加^[Character^(name="%cha1%", name2="%cha2%"^)^]
    goto wri
)
echo ^[Character^(name="%cha1%",name2="%cha2%"^)^]>>%story%.txt
cls
echo 已添加^[Character^(name="%cha1%", name2="%cha2%", focus=%errorlevel%^)^]
goto wri
:wrife
rem 错误提示
echo ERROR:当前场上并没有双角色
echo 请先设置两个角色
timeout /t 3>nul
goto wri

:wris
rem 添加说话内容
set /p namc=[说话者名称]
set /p nams=[说话内容]
echo ^[name="%namc%"^]   %nams%>>%story%.txt
cls
echo 已添加^[name="%namc%"^]   %nams%
goto wri

:wrie
rem 插入说话内容（未启用）
