@echo off
setlocal enabledelayedexpansion

set /p POST_TITLE="Digite o título do post: "
set /p POST_AUTHOR="Digite o autor do post: "
set /p POST_CATEGORIES="Digite as categorias do post (separadas por vírgula): "
set /p POST_TAGS="Digite as tags do post (separadas por vírgula): "

rem Convertendo espaço em hífen
set "FORMATTED_TITLE=%POST_TITLE: =-%"

rem Obtendo a data atual no formato AAAA-MM-DD
for /f "tokens=2 delims==" %%i in ('wmic os get localdatetime /value') do set datetime=%%i
set "POST_DATE=!datetime:~0,4!-!datetime:~4,2!-!datetime:~6,2!"

rem Definindo o diretório e o nome do arquivo
set "POST_DIR=_posts"
set "FILE_NAME=!POST_DIR!\!POST_DATE!-!FORMATTED_TITLE!.md"

rem Criando o arquivo com o front matter personalizado
(
echo ---
echo title: "!POST_TITLE!"
echo author: !POST_AUTHOR!
echo date: !POST_DATE! 04:51 -0300
echo categories: [!POST_CATEGORIES!]
echo tags: [!POST_TAGS!]
echo ---
) > "!FILE_NAME!"

echo Post criado: "!FILE_NAME!"
pause
