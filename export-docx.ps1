param(
    [string]$InputTex = "TCC_ Laboratorio de NIDS com IA.tex",
    [string]$OutputDocx = "build\TCC_ Laboratorio de NIDS com IA - pandoc-rich.docx",
    [string]$ReferenceDoc = "TCC_ Laboratório de NIDS com IA.docx"
)

pandoc $InputTex `
  -o $OutputDocx `
  --from=latex `
  --to=docx `
  --reference-doc=$ReferenceDoc `
  --standalone `
  --toc `
  --toc-depth=3 `
  --number-sections `
  --citeproc `
  --bibliography=referencias.bib `
  --metadata=nocite=@* `
  --metadata="title:Desenvolvimento de um Laboratório de Detecção de Intrusão: Comparando Machine Learning e Deep Learning na Identificação de Ameaças em Redes" `
  --metadata="author:EDUARDO DE MATTOS BORTOTO" `
  --metadata="date:2026"

if ($LASTEXITCODE -ne 0) {
    Write-Host "Falha ao gerar DOCX." -ForegroundColor Red
    exit 1
}

Write-Host "DOCX gerado com sucesso em: $OutputDocx" -ForegroundColor Green
