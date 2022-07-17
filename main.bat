@ECHO OFF
title 明日方舟剧情文件编写器 ver. A0.1
SETLOCAL ENABLEDELAYEDEXPANSION
rem 初始化
if %CMDEXTVERSION% LSS 2(
	echo ERROR
	echo 您使用的Windows Command版本过低，软件将在稍后自动退出
	echo 该软件仅支持Windows10及以上系统，由于使用了部分新指令，会直接在Windows7崩溃
	ping 127.0.0.1 >nul
	exit
	)
rem 软件支持检查
if not exist "%HOMEPATH%\AppData\Roaming\MyArkStory\license_true" (
	type 免责声明.txt
	choice /C YN /M 确认并接受该声明请按Y，不接受并退出请按N。
	if %errorlevel%==1 (
		mkdir "%HOMEPATH%\AppData\Roaming\MyArkStory\"
		fsutil file createnew "%HOMEPATH%\AppData\Roaming\MyArkStory\license_true"
	)
	if %errorlevel%==2 exit
)
rem 判断是否同意使用许可

rem 判断是否有未保存的工作（未启用）
:mainmenu
cls
echo ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
echo ┃ 〓菜单〓                         ┃
echo ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
echo ┃ 1.进入剧情编写模式               ┃
echo ┃ 2.进入文本转换模式(不可用)       ┃
echo ┃ 3.关于本软件                     ┃
echo ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
choice /C 12345
goto mainmenu