# Probabilidad y Estadística

Repositorio de TPs, resumenes clave y ejercicios

## Compilación

### Compilar un archivo individual

Para compilar un archivo Typst específico a PDF:

```bash
typst compile <nombre_archivo.typ>
```

Por ejemplo:

```bash
typst compile VariablesAleatorias/tp4_vac.typ
```

### Compilar todo el proyecto

El script `builder.sh` compila automáticamente todos los archivos `.typ` y `.tex` del proyecto:

```bash
./builder.sh
```

Este script:
- Compila todos los archivos Typst y LaTeX encontrados en el proyecto
- Genera logs de compilación en `compilation_logs/`
- Mueve todos los PDFs generados al directorio `pdfs/`
- Previene sobrescritura agregando sufijos numéricos cuando es necesario

## Requisitos

- [Typst](https://github.com/typst/typst) - LaTeX mejorado
- pdflatex (opcional, para archivos `.tex`)

Para instalar Typst:

```bash
# macOS
brew install typst

# Linux
cargo install --git https://github.com/typst/typst

# Windows
winget install --id Typst.Typst
```

## Logs de Compilación

Los logs de compilación se guardan en:
- `compilation_logs/typst.log` - Errores de compilación de Typst
- `compilation_logs/latex.log` - Errores de compilación de LaTeX
