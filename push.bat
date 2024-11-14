"C:\Program Files\Git\git-bash.exe" -c "git add .; git commit -m \"Automated commit by bot: $(date)\"; git push origin master; sleep 10" 

./push.ph.page.bat

%USERPROFILE%\AppData\Local\anaconda3\python.exe indexNow.py
echo Running script...
pause