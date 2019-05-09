echo 开始提交代码到本地仓库
echo 当前目录是：%cd%


git add -A .
echo 执行结束！


set /p declation=输入修改:
git commit -m "%declation%"


git pull

git push

pause