@ECHO OFF
title ���շ��۾����ļ���д�� ver. A0.2
rem ��ʼ��
mkdir Storylibrary

rem �ж��Ƿ���δ����Ĺ�����δ���ã�

:mainmenu
rem ��ҳ��˵�
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
if %errorlevel%==2 goto mainmenu
if %errorlevel%==3 notepad.exe setting.bat
if %errorlevel%==4 goto about
if %errorlevel%==5 exit
:write
cd "Storylibrary"
Dir
echo ��ѡ������ļ�
set /p "story=[�����ı�����]
if exist %story%.txt goto enr
echo δ��⵽�����ļ����������¾����ļ�
set /p ann=[�ؿ�ע��]
choice /C YN /M �þ����Ƿ�����������
if %errorlevel%==1 (echo ^[HEADER^(key=^"title_test^", is_skippable=true, fit_mode=^"BLACK_MASK^"^)^] %ann%>>%story%.txt)
if %errorlevel%==2 (echo ^[HEADER^(key=^"title_test^", is_skippable=false, fit_mode=^"BLACK_MASK^"^)^] %ann%>>%story%.txt)
echo [stopmusic]>>%story%.txt
echo �ļ���ʼ�����
echo.
timeout /t 1>nul
:enr
cls
echo ��ǰ�ļ���[%story%]
echo 1-�����趨
echo 2-�����趨
echo 3-��ɫ����
echo 4-����
echo 5-����

choice /C 12345
cls
if %errorlevel%==1 goto voi
if %errorlevel%==2 goto bac
if %errorlevel%==3 goto chr
if %errorlevel%==4 goto wri
if %errorlevel%==5 goto act

:voi
rem �����趨���˵�
echo ��ǰ�˵��������趨
echo 1-����
echo 2-��������Music
echo 3-�ر�����
echo 4-��������Sound
echo 5-Ӧ��Ԥ��-δ����
choice /C 1234
if %errorlevel%==1 goto enr
if %errorlevel%==2 goto musa
if %errorlevel%==3 goto muss
if %errorlevel%==4 goto soua
if %errorlevel%==5 goto voip

:musa
rem ������ֲ���
set /p int=[introǰ�ࣿ]
set /p key=[key����]
set /p vol=[volume����]
echo ^[playMusic(intro=^"^$%int%^", key=^"^$%key%^", volume=%vol%)^]>>%story%.txt
cls
echo �����^[playMusic(intro=^"^$%int%^", key=^"^$%key%^", volume=%vol%)^]
goto voi

:muss
rem �ر�����
echo [stopmusic]>>%story%.txt
cls
echo �����[stopmusic]
goto voi

:soua
rem �����������
set /p key=[key����]
set /p vol=[volume����]
echo ^[PlaySound^(key=^"^$%key%^", volume=%vol%^)^]>>%story%.txt
cls
echo �����^[PlaySound^(key=^"^$%key%^", volume=%vol%^)^]
goto voi

:voip
rem Ԥ�������飨δ������
echo ������δ����
goto voi


:chr
rem ��ɫ�趨���˵�
echo ��ǰ�˵�����ɫ�趨
echo 1-����
echo 2-�趨���Ͻ�ɫ��1��
echo 3-�ر�����
echo 4-��������Sound
echo 5-Ӧ��Ԥ��-δ����
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