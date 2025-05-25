# Imagem base com Python
FROM python:3.10-slim

# Instala dependências do sistema, incluindo poppler
RUN apt-get update && \
    apt-get install -y poppler-utils gcc libglib2.0-0 libsm6 libxext6 libxrender-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define diretório de trabalho
WORKDIR /app

# Copia os arquivos para dentro do container
COPY . .

# Instala bibliotecas Python
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expõe a porta do Flask
EXPOSE 10000

# Inicia o servidor com gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:10000", "app:app"]
