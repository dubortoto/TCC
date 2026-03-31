#!/bin/bash
# Script para compilar o projeto LaTeX com output na pasta build
# Compativel com Linux e macOS
# Inclui suporte a biblatex com Biber

PROJECT_NAME="TCC_ Laboratorio de NIDS com IA"
BUILD_DIR="build"
TEX_FILE="$PROJECT_NAME.tex"
BIB_FILE="referencias.bib"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m'

build_latex() {
    echo -e "${GREEN}[COMPILANDO] Compilando projeto LaTeX...${NC}"
    mkdir -p "$BUILD_DIR"

    if [ -f "$BIB_FILE" ]; then
        cp "$BIB_FILE" "$BUILD_DIR/$BIB_FILE"
    fi

    echo -e "${GRAY}[PDFLATEX] Primeira passagem...${NC}"
    pdflatex -interaction=nonstopmode -output-directory="$BUILD_DIR" "$TEX_FILE" > /dev/null 2>&1

    echo -e "${GRAY}[BIBER] Processando referencias...${NC}"
    biber --input-directory "$BUILD_DIR" --output-directory "$BUILD_DIR" "$PROJECT_NAME" > /dev/null 2>&1

    echo -e "${GRAY}[PDFLATEX] Segunda passagem...${NC}"
    pdflatex -interaction=nonstopmode -output-directory="$BUILD_DIR" "$TEX_FILE" > /dev/null 2>&1

    echo -e "${GRAY}[PDFLATEX] Terceira passagem...${NC}"
    pdflatex -interaction=nonstopmode -output-directory="$BUILD_DIR" "$TEX_FILE" > /dev/null 2>&1

    if [ -f "$BUILD_DIR/$PROJECT_NAME.pdf" ]; then
        echo -e "${GREEN}[SUCESSO] Compilacao com bibliografia concluida!${NC}"
        echo -e "${CYAN}[OUTPUT] PDF gerado em: $BUILD_DIR/$PROJECT_NAME.pdf${NC}"
    else
        echo -e "${RED}[ERRO] Erro na compilacao!${NC}"
        exit 1
    fi
}

clean_latex() {
    echo -e "${YELLOW}[LIMPANDO] Limpando arquivos...${NC}"
    if [ -d "$BUILD_DIR" ]; then
        find "$BUILD_DIR" -type f ! -name "*.pdf" -delete 2>/dev/null
        echo -e "${GREEN}[SUCESSO] Limpo!${NC}"
    fi
}

case "${1:-build}" in
    build) build_latex ;;
    clean) clean_latex ;;
    *) echo "Uso: $0 {build|clean}" ;;
esac
