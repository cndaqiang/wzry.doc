@echo off
"C:\Program Files\Git\git-bash.exe" -c "git add .; git commit -m \"auto update: $(date)\"; git push origin master; sleep 10" 