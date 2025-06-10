# Используем систему определенную choose_system.py
FROM fedora:31

# Устанавливаем рабочую директорию
WORKDIR /workspace

# Обновляем систему и устанавливаем необходимые пакеты для LaTeX (согласно заданию)
RUN yum update -y && \
    yum install -y \
    texlive-collection-latexrecommended \
    texlive-collection-fontsrecommended \
    texlive-collection-pictures \
    texlive-collection-science \
    texlive-collection-langcyrillic \
    texlive-moderncv \
    && yum clean all

# Копируем LaTeX файлы
COPY *.tex ./
COPY build.sh ./

# Делаем скрипт исполняемым
RUN chmod +x build.sh

# Команда для сборки резюме
ENTRYPOINT ["./build.sh"] 