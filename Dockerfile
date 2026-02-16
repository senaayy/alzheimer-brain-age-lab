# Temel imaj olarak Python 3.9 kullanıyoruz
FROM python:3.9-slim

# Çalışma dizinini ayarla
WORKDIR /app

# Gerekli sistem araçlarını yükle
# DÜZELTME: 'libgl1-mesa-glx' yerine 'libgl1' kullanıyoruz
RUN apt-get update && apt-get install -y \
    build-essential \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Python kütüphanelerini kopyala ve yükle
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Portu dışarı aç (Jupyter için)
EXPOSE 8888

# Jupyter Lab'i başlat
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]