#!/bin/bash

# Script de build para produção
echo "🚀 Iniciando build para produção..."

# Limpar build anterior
echo "🧹 Limpando build anterior..."
rm -rf dist/
mkdir -p dist/assets/images

# Copiar arquivos principais
echo "📁 Copiando arquivos principais..."
cp index.html dist/
cp -r assets/* dist/assets/

# Copiar configurações Netlify
echo "⚙️ Configurando Netlify..."
cp netlify.toml dist/_redirects 2>/dev/null || echo "# Netlify redirects" > dist/_redirects

# Verificar estrutura
echo "📋 Verificando estrutura do build..."
ls -la dist/

# Verificar tamanho final
echo "📊 Tamanho do build:"
du -sh dist/

echo "✅ Build concluído!"
echo ""
echo "📂 Para fazer deploy no Netlify:"
echo "1. Arraste a pasta dist/ para netlify.com"
echo "2. Ou use: netlify deploy --dir=dist"
echo "3. URL sugerida: https://drmarcusvinicius.netlify.app"
