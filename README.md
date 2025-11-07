# 💊 WarasIn – Biar Hidup Makin Waras

Aplikasi mobile pengingat obat dan pencatatan kesehatan harian yang **ramah untuk semua usia**, terutama lansia.  
Dibangun menggunakan **Flutter** dengan **Supabase** sebagai backend dan **SQLite** untuk mode offline.

---

## 🧠 Latar Belakang
Masalah lupa minum obat dan kurangnya pencatatan kesehatan masih umum di Indonesia.  
Penelitian menunjukkan hanya sekitar **45–48% pasien kronis** yang rutin minum obat.  
WarasIn hadir sebagai solusi **pengingat obat dan pencatat kesehatan harian** yang sederhana, praktis, dan mudah digunakan oleh lansia.

---

## 🚨 Permasalahan
1. Lupa jadwal minum obat → dosis sering terlewat.  
2. Tidak ada catatan kesehatan harian → sulit memantau pola kesehatan.  
3. Aplikasi yang ada terlalu rumit dan tidak ramah lansia.

---

## 💡 Solusi
WarasIn adalah aplikasi Flutter dengan integrasi Supabase yang:
- Mengatur jadwal minum obat dan mengirimkan **push notification** otomatis.  
- Menyediakan fitur **catatan kesehatan harian**.  
- Menggunakan desain **minimalis, clean, dan mudah digunakan**.

---

## 📱 Deskripsi Aplikasi
Aplikasi **WarasIn** membantu pengguna menjaga keteraturan minum obat dan memantau kondisi kesehatannya melalui sistem pengingat dan pencatatan.  
Data tersimpan secara **sinkronisasi cloud (Supabase)** dan **lokal (SQLite)** agar tetap bisa digunakan meski tanpa koneksi internet.

---

## ⚙️ Fitur Inti
1. **Manajemen Obat** – Tambah, edit, dan hapus obat.  
2. **Manajemen Jadwal** – Atur jadwal minum obat harian.  
3. **Pengingat Otomatis** – Push notification sesuai waktu minum obat.  
4. **Catatan Kesehatan Harian** – Input tekanan darah, gula darah, dan catatan umum.  
5. **Autentikasi Pengguna** – Register & login dengan Supabase Auth.  

---

## 🌟 Keunikan
- Desain **ramah lansia** (teks besar, kontras warna lembut).  
- Aplikasi **ringan dan cepat** dengan arsitektur feature-first.  
- Mendukung **sinkronisasi multi-device**.

---

## 🛠️ Teknologi yang Digunakan

| Komponen | Teknologi |
|-----------|------------|
| Frontend (Mobile) | Flutter |
| Backend (Server) | Supabase |
| Database Server | PostgreSQL |
| Database Lokal | SQLite |
| Notifikasi | Flutter Local Notifications + Supabase Push |
| Deployment | Google Play Store |

---

## 🧩 Struktur Folder (Feature-First Architecture)
```
lib/
├── core/
│ ├── constants/
│ ├── utils/
│ ├── theme/
│ └── services/
│
├── features/
│ ├── auth/
│ │ ├── data/
│ │ ├── domain/
│ │ └── presentation/
│ │
│ ├── medicine/
│ ├── schedule/
│ ├── health_record/
│ └── profile/
│
└── main.dart
```

---

## 🗃️ Skema Database (Supabase PostgreSQL)
```sql
-- Tabel Medicines
CREATE TABLE medicines (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  name VARCHAR(255) NOT NULL,
  dosage VARCHAR(100),
  notes TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Tabel Schedules
CREATE TABLE schedules (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  medicine_id UUID REFERENCES medicines(id) ON DELETE CASCADE,
  time TIME NOT NULL,
  days VARCHAR[] NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Tabel Health Records
CREATE TABLE health_records (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  date DATE NOT NULL,
  blood_pressure VARCHAR(20),
  blood_sugar DECIMAL,
  notes TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);
```

---

## 🧱 Persiapan & Instalasi Proyek

### 1️⃣ Prasyarat
Pastikan perangkat Anda telah terpasang:
- Flutter SDK
- Android Studio atau VS Code
- Supabase Account
- Emulator Android / Perangkat fisik

### 2️⃣ Clone Repository
```bash
git clone https://github.com/username/warasin.git
cd warasin
```

### 3️⃣ Install Dependencies
```bash
flutter pub get
```

### 4️⃣ Setup Supabase
1. Masuk ke Supabase Dashboard.
2. Buat Project Baru.
3. Catat:
   - SUPABASE_URL
   - SUPABASE_ANON_KEY
4. Buat tabel sesuai skema SQL di atas.
5. Aktifkan Supabase Authentication (email/password).
6. Buat file .env di root proyek:

```env
SUPABASE_URL=https://your-project-url.supabase.co
SUPABASE_ANON_KEY=your-anon-key
```

### 5️⃣ Konfigurasi Notifikasi
Tambahkan permission di AndroidManifest.xml:
```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />
```

Kemudian inisialisasi notifikasi lokal:
```dart
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
```

### 6️⃣ Jalankan Proyek
Untuk mode debug:
```bash
flutter run
```

Untuk mode release (build APK):
```bash
flutter build apk --release
```

Output file akan berada di:
```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 🧪 Testing
Gunakan perintah berikut untuk menjalankan unit test:
```bash
flutter test
```

---

## 👨‍💻 Tim Pengembang
| Nama | NIM |
|------|-----|
| Muhammad Zaki Dzulfikar | H1D023065 |
| Rizki Arif Saifudin | H1D023067 |
| Nabila Rizki Banati | H1D023086 |
| Elsa Meilia Pusparani | H1D023092 |

---

"WarasIn – Biar hidup makin waras."  
Sebuah karya kecil untuk hidup yang lebih sehat ❤️