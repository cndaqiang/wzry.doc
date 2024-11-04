@echo off
"C:\Program Files\Git\git-bash.exe" -c "git add .; git commit -m 'auto date: $(date)'; git push; sleep 100" > git_log.txt 2>&1
notepad git_log.txt
