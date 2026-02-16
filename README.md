🧠 Alzheimer Detection & XAI Lab
Bu proje, derin öğrenme (CNN) kullanarak MR görüntülerinden Alzheimer evrelerini teşhis eden ve kararlarını Grad-CAM (Explainable AI) ile görselleştiren bir laboratuvar ortamıdır. Model, sadece tahmin yapmakla kalmaz; teşhis koyarken beynin hangi bölgelerine odaklandığını "ısı haritası" ile kanıtlar.

🚀 Öne Çıkan Özellikler
Yüksek Doğruluk: 4 farklı Alzheimer evresinde (Non, Very Mild, Mild, Moderate) %96+ doğrulama başarısı.

Açıklanabilir Yapay Zeka (XAI): Klinik güven ve şeffaflık için Grad-CAM entegrasyonu.

Dockerize Edilmiş Altyapı: Jupyter Lab ortamı, tüm bağımlılıklarıyla birlikte Docker üzerinden saniyeler içinde ayağa kalkar.

Tıbbi Görselleştirme: OpenCV ve Matplotlib ile ham MRI verilerinin analiz edilmesi.

🛠️ Kurulum ve Çalıştırma
Proje tamamen Docker üzerinde koşturulacak şekilde tasarlanmıştır.

Depoyu Klonlayın:

```bash
git clone https://github.com/kullanici-adin/alzheimer-brain-lab.git
cd alzheimer-brain-lab
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

Karar Mekanizması: Flatten ve Dropout ile desteklenmiş Dense katmanları.

Optimizasyon: Adam Optimizer ve Sparse Categorical Crossentropy.

🔍 XAI: Model Nereye Bakıyor? (Grad-CAM)
Yapay zekanın "kara kutu" (black box) problemini çözmek için projeye Grad-CAM algoritması eklenmiştir. Bu teknik, modelin son evrişim katmanındaki gradyan akışını kullanarak beynin hangi anatomik bölgelerinin teşhiste belirleyici olduğunu gösterir.

Klinik Not: Isı haritasında kırmızı görünen bölgeler, modelin teşhis koyarken en çok güvendiği piksellerdir. Bu, doktorların modelin kararına güven duymasını sağlar.

📈 Sonuçlar
Validation Accuracy: ~%96.6

Loss: ~0.10

XAI Kanıtı: Modelin teşhis koyarken beynin temporal lob ve ventrikül bölgelerindeki doku değişimlerine odaklandığı doğrulanmıştır.

🎓 Akademik Referans
Bu çalışma, derin öğrenmenin nörodejeneratif hastalıkların erken teşhisindeki potansiyelini ve açıklanabilir modellerin klinik karar destek sistemlerindeki önemini vurgulamak amacıyla geliştirilmiştir.

💡 Daha Fazlası İçin
Bu projeyi beğendiyseniz yıldız (⭐) vermeyi unutmayın! Geliştirmek için her türlü PR ve geri bildirime açığım.
