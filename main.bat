@ECHO OFF
title ���շ��۾����ļ���д�� ver. A0.1
SETLOCAL ENABLEDELAYEDEXPANSION
rem ��ʼ��
if %CMDEXTVERSION% LSS 2(
	echo ERROR
	echo ��ʹ�õ�Windows Command�汾���ͣ���������Ժ��Զ��˳�
	echo �������֧��Windows10������ϵͳ������ʹ���˲�����ָ���ֱ����Windows7����
	ping 127.0.0.1 >nul
	exit
	)
rem ���֧�ּ��
if not exist "%HOMEPATH%\AppData\Roaming\MyArkStory\license_true" (
	type ��������.txt
	choice /C YN /M ȷ�ϲ����ܸ������밴Y�������ܲ��˳��밴N��
	if %errorlevel%==1 (
		mkdir "%HOMEPATH%\AppData\Roaming\MyArkStory\"
		fsutil file createnew "%HOMEPATH%\AppData\Roaming\MyArkStory\license_true"
	)
	if %errorlevel%==2 exit
)
rem �ж��Ƿ�ͬ��ʹ�����

rem �ж��Ƿ���δ����Ĺ�����δ���ã�
:mainmenu
cls
echo ������������������������������������������������������������������������
echo �� ���˵���                         ��
echo �ǩ���������������������������������������������������������������������
echo �� 1.��������дģʽ               ��
echo �� 2.�����ı�ת��ģʽ(������)       ��
echo �� 3.���ڱ����                     ��
echo ������������������������������������������������������������������������
choice /C 12345
goto mainmenu