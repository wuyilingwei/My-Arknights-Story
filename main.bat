@ECHO on
title ���շ��۾����ļ���д�� ver. A0.1
rem ��ʼ��

rem �ж��Ƿ���δ����Ĺ�����δ���ã�
:mainmenu
cls
echo ������������������������������������������������������������������������
echo �� �� �˵� ��                       ��
echo �ǩ���������������������������������������������������������������������
echo �� 1.��������дģʽ               ��
echo �� 2.�����ı�ת��ģʽ(������)       ��
echo �� 3.���ã������ã�                 ��
echo �� 4.���ڱ����                     ��
echo �� 5.�˳�                           ��
echo ������������������������������������������������������������������������
choice /C 12345
cls
if %errorlevel%==1 goto write
if %errorlevel%==2 goto write
if %errorlevel%==3 (notepad.exe setting.bat)
if %errorlevel%==4 goto write
if %errorlevel%==5 exit
:write
cd "%Storylibrary"
Dir
echo ��ѡ������ļ�
set /p "story=[�����ı�����]
if exist %story%.txt goto enr
echo δ��⵽�����ļ����������¾����ļ�
choice /C YN /M �þ����Ƿ�����������
if %errorlevel%==1 (echo ^[HEADER^(key=^"title_test^", is_skippable=true, fit_mode=^"BLACK_MASK^"^)^]>>%story%.txt)
if %errorlevel%==2 (echo ^[HEADER^(key=^"title_test^", is_skippable=false, fit_mode=^"BLACK_MASK^"^)^]>>%story%.txt)
echo [stopmusic]>>%story%.txt
echo �ļ���ʼ�����
:enr
echo 1-�����趨
echo 2-�����趨
echo 3-��ɫ����
echo 4-����

choice /C 123456789
if %errorlevel%==1 (
	echo 1-����
	echo 2-��������
	echo 3-�ر�����
	echo 4-Ӧ��Ԥ�裨δ���ã�
	choice /C 1234
	if %errorlevel%==1 (
		goto enr)
	if %errorlevel%==2 (
	
	if %errorlevel%==3 
	if %errorlevel%==4 
)
if %errorlevel%==2 goto write
if %errorlevel%==3 (notepad.exe setting.bat)
if %errorlevel%==4 goto write
if %errorlevel%==5 exit


if %errorlevel%==1 
if %errorlevel%==2 
if %errorlevel%==3 
if %errorlevel%==4 
if %errorlevel%==5 