#!/bin/bash

# Bash скрипт для сборки резюме
set -e

echo "🔨 Начинаем сборку резюме..."

# Собираем PDF (дважды для корректных ссылок)
echo "📄 Компилируем LaTeX..."
pdflatex -interaction=nonstopmode resume.tex
pdflatex -interaction=nonstopmode resume.tex

# Проверяем что PDF создался
if [ -f resume.pdf ]; then
    echo "✅ Резюме успешно собрано: resume.pdf"
    ls -la resume.pdf
else
    echo "❌ Ошибка: PDF файл не был создан"
    exit 1
fi

# Подчищаем временные файлы
echo "🧹 Удаляем временные файлы..."
rm -f *.aux *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz

echo "🎉 Сборка завершена успешно!" 