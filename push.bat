%USERPROFILE%\AppData\Local\anaconda3\python.exe  -m mkdocs build --clean

%USERPROFILE%\AppData\Local\anaconda3\python.exe -m mkdocs gh-deploy

%USERPROFILE%\AppData\Local\anaconda3\python.exe indexNow.py

"C:\Program Files\Git\git-bash.exe" -c "git add .; git commit -m \"Automated commit by bot: $(date)\"; git push origin master; sleep 10" 
