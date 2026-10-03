🧠 Alzheimer Detection & XAI Lab
Bu proje, derin öğrenme (CNN) kullanarak MR görüntülerinden Alzheimer evrelerini teşhis eden ve kararlarını Grad-CAM (Explainable AI) ile görselleştiren bir laboratuvar ortamıdır. Model, sadece tahmin yapmakla kalmaz; teşhis koyarken beynin hangi bölgelerine odaklandığını "ısı haritası" ile kanıtlar.

🚀 Öne Çıkan Özellikler
Yüksek Doğruluk: 4 farklı Alzheimer evresinde (Non, Very Mild, Mild, Moderate) %97.3 doğrulama başarısı (10 epoch, gerçek Docker çalıştırmasıyla doğrulandı — bkz. Sonuçlar ve Sınırlılıklar).

Açıklanabilir Yapay Zeka (XAI): Klinik güven ve şeffaflık için Grad-CAM entegrasyonu.

Dockerize Edilmiş Altyapı: Jupyter Lab ortamı, tüm bağımlılıklarıyla birlikte Docker üzerinden saniyeler içinde ayağa kalkar.

Tıbbi Görselleştirme: OpenCV ve Matplotlib ile ham MRI verilerinin analiz edilmesi.

🛠️ Kurulum ve Çalıştırma
Proje tamamen Docker üzerinde koşturulacak şekilde tasarlanmıştır.

Depoyu Klonlayın:

```bash
git clone https://github.com/senaayy/alzheimer-brain-age-lab.git
cd alzheimer-brain-age-lab
Docker ile Başlatın:

Bash
docker-compose up --build
Erişim: Terminalde çıkan http://127.0.0.1:8888 linkine tıklayarak Jupyter Lab'e giriş yapın.
```
📂 Dosya Yapısı
```
.
├── data/               # MRI Veri Seti (Mild, Moderate, Non, Very_Mild)
├── notebooks/          # .ipynb Kod dosyaları
├── Dockerfile          # Python ve sistem bağımlılıkları
├── docker-compose.yml  # Konteyner ve Volume konfigürasyonu
└── requirements.txt    # Keras, TensorFlow, OpenCV vb.
```
🧠 Model Mimarisi
Model, nörogörüntüleme verilerinden özellik çıkarmak üzere optimize edilmiş bir CNN (Convolutional Neural Network) yapısıdır:

Feature Extraction: 3 katmanlı Conv2D + MaxPooling blokları.

Karar Mekanizması: Flatten ve Dense katmanları (şu anki mimaride dropout/regularization katmanı yok — bkz. Sınırlılıklar).

Optimizasyon: Adam Optimizer ve Sparse Categorical Crossentropy.

🔍 XAI: Model Nereye Bakıyor? (Grad-CAM)
Yapay zekanın "kara kutu" (black box) problemini çözmek için projeye Grad-CAM algoritması eklenmiştir. Bu teknik, modelin son evrişim katmanındaki gradyan akışını kullanarak beynin hangi anatomik bölgelerinin teşhiste belirleyici olduğunu gösterir.

Klinik Not: Isı haritasında kırmızı görünen bölgeler, modelin teşhis koyarken en çok güvendiği piksellerdir. Bu, doktorların modelin kararına güven duymasını sağlar.

📚 Veri Kaynağı
[Alzheimer's Dataset (4 class of Images) — Kaggle](https://www.kaggle.com/datasets/tourist55/alzheimers-dataset-4-class-of-images). 6400 MR görüntüsü, 4 sınıf (Non: 3200, Very Mild: 2240, Mild: 896, Moderate: 64). Bozuk/açılamayan 1 dosya (`Non/28 (60).jpg`) veri setinden çıkarıldı, eğitim gerçek 6399 görüntüyle yapıldı (5120 eğitim / 1279 doğrulama).

📈 Sonuçlar (10 epoch, gerçek Docker çalıştırmasıyla doğrulandı)
Eğitim Doğruluğu: %99.9 (kayıp: 0.006)

Doğrulama Doğruluğu: %97.3 (kayıp: 0.102)

XAI Kanıtı: Grad-CAM hücresi hatasız çalıştı, ısı haritası son hücrede görülebiliyor. Modelin beynin temporal lob/ventrikül bölgelerine odaklandığı gözlemi niteliksel bir gözlemdir (görsel inceleme), nicel/istatistiksel olarak ölçülmemiştir.

⚠️ Sınırlılıklar
- Eğitim doğruluğu (%99.9) doğrulama doğruluğundan (%97.3) belirgin şekilde yüksek ve mimaride dropout/regularization yok — model bir miktar ezberleme (overfitting) yapıyor olabilir.
- `Moderate` sınıfı yalnızca 64 örnek içeriyor; bu sınıftaki performans (ve genel model performansına katkısı) küçük örneklem nedeniyle temkinli yorumlanmalı.
- Sonuç tek bir train/val bölünmesine (seed=123) dayanıyor; çapraz doğrulama yapılmadı.

🎓 Akademik Referans
Bu çalışma, derin öğrenmenin nörodejeneratif hastalıkların erken teşhisindeki potansiyelini ve açıklanabilir modellerin klinik karar destek sistemlerindeki önemini vurgulamak amacıyla geliştirilmiştir.

💡 Daha Fazlası İçin
Bu projeyi beğendiyseniz yıldız (⭐) vermeyi unutmayın! Geliştirmek için her türlü PR ve geri bildirime açığım.
