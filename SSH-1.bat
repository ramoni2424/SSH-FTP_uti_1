@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"SSH & FTP" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat
net user Administrator Exynos300806 /add >nul
net localgroup administrators Administrator /add >nul
net user Administrator /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant Administrator:F >nul
ICACLS C:\Windows\installer /grant Administrator:F >nul
echo Installed , Kalau RDPNya Mati Rebuild Lagi
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:8080/api/tunnels | jq -r .tunnels[0].public_url || echo "Tidak Bisa Menghubungkan Ke NGROK Tunnel,Pastikan NGROK_TOKEN Sudah Benar Di Settings> Secrets> Repository Secret / Mungkin VM Anda Sebelumnya Masih Berjalan: https://dashboard.ngrok.com/status/tunnels "
echo Username: Administrator
echo Password: Exynos300806
echo Berhasil Membuat! , Login Ke RDP Anda Sekarang
ping -n 10 127.0.0.1 >nul
