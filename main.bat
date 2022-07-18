@ECHO OFF
title ���շ��۾����ļ���д�� ver. B1.0
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
rem �༭���˵�
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


:bac
rem �����趨���˵�
echo ��ǰ�˵��������趨
echo 1-����
echo 2-�趨����
echo 3-���ú���
choice /C 123
if %errorlevel%==1 goto enr
if %errorlevel%==2 goto bacp
if %errorlevel%==3 goto bacb

:bacp
rem �趨����
set /p pna=[����ͼƬ����]
set /p tim=[����ʽ����ʱ��]
echo ^[Background^(image="%pna%", width=1, height=1, fadetime=%tim%^)^]>>%story%.txt
cls
echo �����^[Background^(image="%pna%", width=1, height=1, fadetime=%tim%^)^]
goto bac

:bacb
rem ��Ӻ���
set /p tim=[����ʱ���趨]
echo ^[Blocker^(a=1, initr=2,fadetime=%tim%, block=true^)^]>>%story%.txt
cls
echo �����^[Blocker^(a=1, initr=2,fadetime=%tim%, block=true^)^]
goto bac


:chr
rem ��ɫ�趨���˵�
echo ��ǰ�˵�����ɫ�趨
echo 1-����
echo 2-��ս�ɫ
echo 3-�趨���Ͻ�ɫ��1��
echo 4-�趨���Ͻ�ɫ��2��
choice /C 1234
if %errorlevel%==1 goto enr
if %errorlevel%==2 goto chrc
if %errorlevel%==3 goto chrs
if %errorlevel%==4 goto chrd

:chrc
rem ��ӿս�ɫ
echo ^[Character^]>>%story%.txt
set chan=0
cls
echo �����^[Character^]
goto chr

:chrs
rem ��ӵ���ɫ
set /p cha1=[��ɫ1]
echo ^[Character^(name="%cha1%"^)^]>>%story%.txt
set chan=1
cls
echo �����^[Character^(name="%cha1%"^)^]
goto chr

:chrd
rem ���˫��ɫ
set /p cha1=[��ɫ1]
set /p cha2=[��ɫ2]
set foc=0
echo ^[Character^(name="%cha1%",name2="%cha2%"^)^]>>%story%.txt
set chan=2
cls
echo �����^[Character^(name="%cha1%", name2="%cha2%"^)^]
goto chr


:wri
rem �Ի����˵�
echo ��ǰ�˵����Ի��趨
echo 1-����
echo 2-���ý����ɫ
echo 3-���÷���
echo 4-���ò���Ի���δ���ã�
choice /C 123
if %errorlevel%==1 goto enr
if %errorlevel%==2 goto wrif
if %errorlevel%==3 goto wris
if %errorlevel%==4 goto wrie

:wrif
rem ���ó��Ͻ����ɫ
if not %chan%==2 goto wrife
echo ��ǰ�������ɫΪ[%cha1%]���ҽ�ɫΪ[%cha2%]������Ϊ%foc%��
choice /C 12 /M 0-�޽��㣬1-��2-��
if %errorlevel%==1 (
    echo ^[Character^(name="%cha1%",name2="%cha2%"^)^]>>%story%.txt
    cls
    echo �����^[Character^(name="%cha1%", name2="%cha2%"^)^]
    goto wri
)
echo ^[Character^(name="%cha1%",name2="%cha2%"^)^]>>%story%.txt
cls
echo �����^[Character^(name="%cha1%", name2="%cha2%", focus=%errorlevel%^)^]
goto wri
:wrife
rem ������ʾ
echo ERROR:��ǰ���ϲ�û��˫��ɫ
echo ��������������ɫ
timeout /t 3>nul
goto wri

:wris
rem ���˵������
set /p namc=[˵��������]
set /p nams=[˵������]
echo ^[name="%namc%"^]   %nams%>>%story%.txt
cls
echo �����^[name="%namc%"^]   %nams%
goto wri

:wrie
rem ����˵�����ݣ�δ���ã�
