@echo off
"C:\Program Files\Git\git-bash.exe" -c "git add . && git commit -m 'auto date: $(date)' && git push"
pause
