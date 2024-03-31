@echo off
for /R %%f in (*.jfif) do (
    cwebp -q 80 "%%f" -o "%%~nf.webp" 
    del "%%f"
)
pause