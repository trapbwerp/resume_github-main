# Резюме на LaTeX

**ФИО:** Беляев Даниил Андреевич  
**Группа:** 242

## Описание

Репозиторий содержит резюме, написанное на LaTeX, с автоматической сборкой через Docker и CI/CD.

## Структура проекта

```
├── choose_system.py         # Скрипт определения системы для Docker
├── Dockerfile              # Контейнер для сборки LaTeX (fedora:31)
├── build.sh                # Bash скрипт сборки резюме
├── resume.tex              # Основной файл резюме
├── .github/workflows/      # GitHub Actions для CI/CD
│   └── build-resume.yml
├── .gitignore              # Игнорируемые файлы
├── Makefile               # Команды для локальной сборки
└── README.md              # Этот файл
```

## Автоматическая сборка

Каждый push в репозиторий автоматически запускает сборку резюме через GitHub Actions.
Готовый PDF можно скачать из артефактов сборки в разделе Actions.

## Система сборки

Система для Docker определяется автоматически через `choose_system.py`:
```bash
python3 choose_system.py
# Результат: fedora:31
```

## Требования к заданию

✅ Резюме написано на LaTeX  
✅ Настроена сборка через Dockerfile на fedora:31  
✅ Настроен CI/CD через GitHub Actions  
✅ Приватный репозиторий  
✅ Bash скрипт для сборки с очисткой логов  
✅ Файл choose_system.py в репозитории

## Локальная сборка

```bash
# Сборка через Docker
docker build -t resume-builder .
docker run --rm -v $(pwd):/workspace resume-builder

# Через Makefile
make docker-run
```

## Технические детали

- **Docker base image:** fedora:31
- **LaTeX engine:** pdflatex
- **Пакеты:** texlive-collection-* (latexrecommended, fontsrecommended, pictures, science, langcyrillic)
- **Сборка:** Двойная компиляция для корректных ссылок
- **Очистка:** Автоматическое удаление временных файлов

## Редактирование резюме

Основной файл для редактирования: `resume.tex`

### Основные секции для заполнения:

1. **Личная информация** (строки 15-21):
   - Имя и фамилия
   - Должность
   - Контактные данные
   - Ссылки на профили

2. **О себе** (строка 26):
   - Краткое описание профессиональных качеств

3. **Опыт работы** (строки 32-36):
   - Компании, должности, обязанности

4. **Проекты** (строки 42-43):
   - Описание ключевых проектов

### Полезные команды LaTeX:

- `\cventry{даты}{должность}{компания}{город}{}{описание}` - опыт работы
- `\cvitem{навык}{описание}` - навыки и достижения
- `\cvdoubleitem{тема1}{описание1}{тема2}{описание2}` - навыки в две колонки

## Полезные ссылки

- [ModernCV Documentation](https://ctan.org/pkg/moderncv)
- [LaTeX Resume Examples](https://www.overleaf.com/gallery/tagged/cv)
- [GitHub Actions Documentation](https://docs.github.com/en/actions) 