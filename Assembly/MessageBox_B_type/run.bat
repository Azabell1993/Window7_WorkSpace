nasm -f win64 T_MessageBox.asm -o MessageBox.obj
golink /entry:Start kernel32.dll user32.dll MessageBox.obj