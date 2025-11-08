1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Navigator.push() digunakan untuk menambahkan halaman baru di atas halaman yang sedang aktif, sehingga pengguna bisa kembali ke halaman sebelumnya dengan menekan tombol back. Sementara itu, Navigator.pushReplacement() akan mengganti halaman saat ini dengan halaman baru, sehingga pengguna tidak bisa kembali ke halaman sebelumnya. Dalam aplikasi Football Shop, Navigator.push() cocok digunakan saat pengguna ingin membuka halaman detail produk dari daftar produk (karena pengguna mungkin ingin kembali melihat daftar sebelumnya). Sedangkan Navigator.pushReplacement() lebih cocok digunakan setelah pengguna melakukan aksi tertentu yang bersifat final, seperti setelah login berhasil atau setelah menyimpan data produk baru, agar pengguna tidak bisa kembali ke halaman form yang lama. Saya menggunakan menggunakan pushReplacement() agar halaman saat ini digantikan oleh halaman tujuan (misalnya MyHomePage() atau ProductFormPage()). Menurut saya metode ini tepat digunakan untuk menu navigasi utama seperti Drawer, karena ketika pengguna berpindah antarhalaman utama (misalnya dari “Home” ke “Create Product”), mereka tidak perlu kembali ke halaman sebelumnya.


2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Ketiga widget ini membantu menjaga struktur dan tampilan halaman agar konsisten di seluruh aplikasi. Scaffold berfungsi sebagai kerangka utama setiap halaman, yang menyediakan area untuk elemen-elemen penting seperti app bar, drawer, dan body. AppBar digunakan untuk menampilkan judul halaman atau tombol navigasi di bagian atas, sementara Drawer berfungsi sebagai menu samping yang memudahkan pengguna berpindah antarhalaman dengan tampilan yang sama di setiap halaman. Dengan memanfaatkan ketiganya, setiap halaman dalam aplikasi Goal Strike seperti halaman produk, form tambah produk, dan halaman utama akan memiliki tata letak dan navigasi yang seragam, membuat pengalaman pengguna terasa lebih rapi dan konsisten.


3.  Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Ketiga widget ini sangat penting dalam membangun tampilan form yang rapi dan responsif. Padding digunakan untuk memberikan jarak antar elemen agar tidak terlalu menempel dan terlihat lebih nyaman di mata. SingleChildScrollView berguna agar seluruh isi form bisa di-scroll saat tampilan melebihi ukuran layar, sehingga pengguna tetap bisa mengisi semua data tanpa kesulitan. ListView digunakan untuk menampilkan daftar elemen yang bisa digulir, seperti daftar produk di aplikasi Goal Strike. Sebagai contoh, di halaman form tambah produk (create product), saya menggunakan Padding di setiap TextFormField agar tampilan lebih rapi, dan membungkus seluruh form dengan SingleChildScrollView supaya form tetap bisa diakses meskipun panjang.


4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Dalam aplikasi Goal Strike, penyesuaian warna tema dilakukan agar seluruh tampilan aplikasi memiliki identitas visual yang konsisten dengan brand toko. Tema warna utama yang digunakan adalah biru dan biru terang (cyan), karena kombinasi warna tersebut mencerminkan semangat, profesionalitas, dan energi yang identik dengan dunia olahraga, khususnya sepak bola. Pengaturan tema ini diterapkan secara global di file main.dart menggunakan properti ThemeData, dengan konfigurasi colorScheme sebagai berikut:

```dart
colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
  .copyWith(secondary: const Color.fromARGB(255, 0, 140, 255)),
```

Kode ini memastikan bahwa warna biru digunakan sebagai warna utama (primary color) dan biru muda sebagai warna sekunder (secondary color), sehingga seluruh komponen seperti AppBar, tombol, dan ikon menggunakan warna yang senada. Selain itu, komponen seperti AppBar dan tombol di halaman Form Create Product juga menerapkan secondaryColor agar konsisten dengan tema utama.

Untuk menjaga keselarasan, warna pada LeftDrawer juga disesuaikan dengan tema aplikasi menggunakan Theme.of(context).colorScheme.primary dan colorScheme.secondary, menggantikan warna yang sebelumnya ditulis secara manual (Colors.blue). Dengan penerapan ini, seluruh bagian aplikasi mulai dari navigasi, form, hingga elemen interaktif menampilkan warna yang seragam dan harmonis (khusus untuk warna tombol biru, hijau, dan merah masih mengikuti perintah di tugas sebelumnya karena belum ada perinta untuk mengganti warna tombol tersebut).


Terima kasih.
