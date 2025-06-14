#!/bin/bash

LOG_DIR="./compilation_logs"
mkdir -p $LOG_DIR

TYPST_LOG="${LOG_DIR}/typst.log"
LATEX_LOG="${LOG_DIR}/latex.log"

> $TYPST_LOG
> $LATEX_LOG

compile() {
  local compiler=$1
  local file=$2
  local logfile=$3

  echo "Compilando: " $file
  if $compiler $file >> $logfile 2>&1; then
    echo "✔ Compilado correctamente: " $file
  else
    echo "✖ Error compilando: " $file
  fi
}

find . -type f -name "*.typ" -print0 | while IFS= read -r -d '' file; do
  compile "typst compile" $file $TYPST_LOG
done

find . -type f -name "*.tex" -print0 | while IFS= read -r -d '' file; do
  compile "pdflatex -interaction=nonstopmode -halt-on-error" $file $LATEX_LOG
done

echo
echo "Compilación terminada."
echo "Logs disponibles en: ${LOG_DIR}"

DEST="./pdfs"

mkdir -p $DEST

find . -type f -name "*.pdf" -print0 | while IFS= read -r -d '' file; do
  filename=$(basename $file)
  destfile="${DEST}/${filename}"

  # Si ya existe un archivo con ese nombre, agregar sufijo para evitar sobrescritura
  if [ -e "${destfile}" ]; then
    count=1
    while [ -e "${DEST}/${filename%.pdf}_${count}.pdf" ]; do
      count=$((count + 1))
    done
    destfile="${DEST}/${filename%.pdf}_${count}.pdf"
  fi

  echo "Moviendo ${file} a ${destfile}"
  mv $file $destfile
done

echo "✅ Todos los PDFs movidos a ${DEST}"

