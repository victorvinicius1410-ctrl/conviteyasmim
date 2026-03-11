# Inicia um servidor para ver o convite no Cursor
# Uso: clique com botão direito > "Executar com PowerShell" ou no terminal: .\iniciar-servidor.ps1

$porta = 3750
$url = "http://localhost:$porta"

Write-Host ""
Write-Host "  Convite da minha amada - Servidor local" -ForegroundColor Magenta
Write-Host "  ----------------------------------------" -ForegroundColor DarkGray
Write-Host ""

# Tenta Python primeiro (já vem em muitos PCs)
$python = Get-Command python -ErrorAction SilentlyContinue
if ($python) {
  Write-Host "  Iniciando com Python na porta $porta..." -ForegroundColor Green
  Write-Host ""
  Write-Host "  No Cursor:" -ForegroundColor Yellow
  Write-Host "  1. Ctrl+Shift+P -> Simple Browser: Show" -ForegroundColor White
  Write-Host "  2. Cole esta URL: $url" -ForegroundColor Cyan
  Write-Host ""
  Write-Host "  Pressione Ctrl+C para parar o servidor." -ForegroundColor DarkGray
  Write-Host ""
  Set-Location $PSScriptRoot
  python -m http.server $porta
  exit
}

# Tenta Node (npx serve)
$node = Get-Command node -ErrorAction SilentlyContinue
if ($node) {
  Write-Host "  Iniciando com Node na porta $porta..." -ForegroundColor Green
  Write-Host ""
  Write-Host "  No Cursor:" -ForegroundColor Yellow
  Write-Host "  1. Ctrl+Shift+P -> Simple Browser: Show" -ForegroundColor White
  Write-Host "  2. Cole esta URL: $url" -ForegroundColor Cyan
  Write-Host ""
  Write-Host "  Pressione Ctrl+C para parar o servidor." -ForegroundColor DarkGray
  Write-Host ""
  Set-Location $PSScriptRoot
  npx --yes serve . -p $porta
  exit
}

Write-Host "  Nenhum Python ou Node encontrado." -ForegroundColor Red
Write-Host "  Instale Node em https://nodejs.org ou use Python." -ForegroundColor Yellow
Write-Host "  Ou dê dois cliques no index.html para abrir no navegador." -ForegroundColor Gray
Write-Host ""
pause
