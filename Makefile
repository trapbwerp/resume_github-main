.PHONY: build clean docker-build docker-run help

# Переменные
DOCKER_IMAGE = resume-builder
LATEX_FILE = resume.tex
PDF_FILE = resume.pdf

help: ## Показать справку
	@echo "Доступные команды:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-15s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Собрать резюме локально (требует установленного LaTeX)
	pdflatex $(LATEX_FILE)
	pdflatex $(LATEX_FILE)

docker-build: ## Собрать Docker образ
	docker build -t $(DOCKER_IMAGE) .

docker-run: docker-build ## Собрать резюме через Docker
	docker run --rm -v $(PWD):/workspace $(DOCKER_IMAGE)

clean: ## Удалить временные файлы
	rm -f *.aux *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz

clean-all: clean ## Удалить все файлы включая PDF
	rm -f $(PDF_FILE)

test: docker-run ## Протестировать сборку
	@if [ -f $(PDF_FILE) ]; then \
		echo "✅ PDF успешно создан!"; \
		ls -la $(PDF_FILE); \
	else \
		echo "❌ Ошибка создания PDF"; \
		exit 1; \
	fi 