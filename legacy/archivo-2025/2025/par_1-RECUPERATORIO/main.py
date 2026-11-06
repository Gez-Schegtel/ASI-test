import mammoth

archivo_docx = input("Ingrese la ruta del archivo DOCX: ")

with open(archivo_docx, "rb") as docx_file:
  result = mammoth.convert_to_markdown(docx_file)
  markdown_output = result.value  # El texto en Markdown
  with open("archivo.md", "w") as md_file:
      md_file.write(markdown_output)
  
