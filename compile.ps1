# Script para compilar o projeto LaTeX com output na pasta build
# Compativel com Windows (PowerShell)
# Inclui suporte a biblatex com Biber

param(
    [ValidateSet("build", "clean")]
    [string]$Action = "build"
)

$ProjectName = "TCC_ Laboratorio de NIDS com IA"
$BuildDir = "build"
$TexFile = "$ProjectName.tex"
$BibFile = "referencias.bib"

function Build-LaTeX {
    Write-Host "[COMPILANDO] Compilando projeto LaTeX..." -ForegroundColor Green
    
    # Criar pasta build se nao existir
    if (-not (Test-Path $BuildDir)) {
        New-Item -ItemType Directory -Path $BuildDir | Out-Null
        Write-Host "[CRIADO] Pasta build criada" -ForegroundColor Cyan
    }

    if (Test-Path $BibFile) {
        Copy-Item $BibFile -Destination "$BuildDir\$BibFile" -Force
    }
    
    # Primeira passagem de pdflatex
    Write-Host "[PDFLATEX] Primeira passagem..." -ForegroundColor Gray
    & pdflatex -interaction=nonstopmode -output-directory=$BuildDir $TexFile | Out-Null
    
    # Biber
    Write-Host "[BIBER] Processando referências..." -ForegroundColor Gray
    & biber --input-directory $BuildDir --output-directory $BuildDir $ProjectName | Out-Null
    
    # Segunda passagem de pdflatex
    Write-Host "[PDFLATEX] Segunda passagem..." -ForegroundColor Gray
    & pdflatex -interaction=nonstopmode -output-directory=$BuildDir $TexFile | Out-Null
    
    # Terceira passagem de pdflatex
    Write-Host "[PDFLATEX] Terceira passagem..." -ForegroundColor Gray
    & pdflatex -interaction=nonstopmode -output-directory=$BuildDir $TexFile | Out-Null
    
    if (Test-Path "$BuildDir\$ProjectName.pdf") {
        Write-Host "[SUCESSO] Compilacao com bibliografia concluida com sucesso!" -ForegroundColor Green
        Write-Host "[OUTPUT] PDF gerado em: $BuildDir\$ProjectName.pdf" -ForegroundColor Cyan
        exit 0
    } else {
        Write-Host "[ERRO] Erro na compilacao!" -ForegroundColor Red
        exit 1
    }
}

function Clean-LaTeX {
    Write-Host "[LIMPANDO] Limpando arquivos de compilacao..." -ForegroundColor Yellow
    
    if (Test-Path $BuildDir) {
        Get-ChildItem -Path $BuildDir -File | Where-Object { $_.Extension -ne ".pdf" } | Remove-Item -Force -ErrorAction SilentlyContinue
        Write-Host "[SUCESSO] Arquivos de compilacao removidos!" -ForegroundColor Green
    }
}

switch ($Action) {
    "build" {
        Build-LaTeX
    }
    "clean" {
        Clean-LaTeX
    }
}


