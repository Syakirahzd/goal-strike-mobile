1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Dalam Flutter, semua tampilan dibangun dari widget. Widget dapat berupa komponen visual (Text, Icon, AppBar, Scaffold) atau struktur logis yang mengatur widget lain (Column,Row, MaterialApp). Widget-widget tersebut disusun dalam bentuk pohon (Widget Treee). Di mana, Parent (induk) adalah widget yang membungkus widget lain. Sedangkan Child (anak) adalah widget yang dutempatkan di dalam widget lain. 

Dalam Kode saya, Scaffold adalah induk dari AppBar dan Body. Di dalam Body, Column menjadi induk dari Text dan Icon. Jadi, struktur widget tree akan menentukan hierarki tampilan dan perilaku UI.


2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Mulau dari MaterialApp yang berfungsi sebagai kerangka utama aplikasi berbasis Material Design dan menyediakan pengaturan tema, navigasi, serta struktur dasar. Scaffold menyediakan struktur halaman utama seperti AppBar dan Body. AppBar digunakan untuk menampilkan bagian atas halaman dengan judul aplikasi. Text menampilkan tulisan pada layar. Row dan Column mengatur posisi widget secara horizontal dan vertikal. Card digunakan untuk menampilkan informasi dalam bentuk kartu dengan efek bayangan. Container membantu mengatur ukuran, padding, dan warna latar. Padding menambahkan jarak di sekitar widget. 

Selanjutnya, GridView.count menampilkan daftar widget dalam bentuk grid. Icon menampilkan ikon, sedangkan Material dan InkWell menambahkan efek visual dan interaksi sentuhan. Selain itu, SingleChildScrollView memungkinkan halaman untuk di-scroll, SizedBox memberikan jarak antar elemen, SnackBar menampilkan pesan singkat, ScaffoldMessenger mengelola tampilan SnackBar, dan MediaQuery digunakan untuk mendapatkan ukuran layar agar layout lebih responsif.


3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

Widget MaterialApp memiliki peran penting karena menjadi wadah utama (root widget) dari aplikasi berbasis Material Design. MaterialApp mengatur tema global aplikasi melalui ThemeData, menyediakan sistem navigasi antar halaman, serta mengatur elemen-elemen seperti bahasa dan tampilan keseluruhan. Tanpa MaterialApp, banyak widget Flutter seperti Scaffold atau AppBar tidak dapat berfungsi dengan benar karena mereka bergantung pada konteks Material Design yang disediakan olehnya. Oleh karena itu, widget ini hampir selalu digunakan sebagai root di setiap aplikasi Flutter.


4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Perbedaan antara StatelessWidget dan StatefulWidget terletak pada kemampuan keduanya dalam menangani perubahan data. StatelessWidget bersifat statis atau tidak memiliki state yang bisa berubah, sehingga cocok digunakan untuk tampilan yang tidak berubah-ubah seperti teks, ikon, atau tombol sederhana. Sementara itu, StatefulWidget memiliki state yang dapat diperbarui selama aplikasi berjalan, sehingga cocok digunakan untuk tampilan yang dinamis seperti form, animasi, atau penghitung angka. Dalam proyek ini, semua widget termasuk MyApp, MyHomePage, InfoCard, dan ItemCard merupakan StatelessWidget karena tampilannya tidak berubah setelah dibangun.


5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext adalah objek yang merepresentasikan posisi suatu widget di dalam widget tree. BuildContext digunakan untuk mengakses informasi dari parent widget, seperti tema aplikasi (Theme.of(context)), ukuran layar (MediaQuery.of(context)), atau untuk menampilkan pesan melalui ScaffoldMessenger.of(context). BuildContext sangat penting dalam metode build() karena memungkinkan widget mengetahui lingkungannya dan berinteraksi dengan widget lain di dalam tree.


6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Konsep hot reload di Flutter memungkinkan pengembang memperbarui tampilan aplikasi secara cepat tanpa kehilangan state yang sedang berjalan. Misalnya, jika warna atau teks diubah, hasilnya akan langsung terlihat tanpa perlu menjalankan ulang aplikasi. Sebaliknya, hot restart akan memulai ulang seluruh aplikasi dari awal dan menghapus semua state yang tersimpan, seperti mengatur ulang nilai variabel atau tampilan awal. Dengan kata lain, hot reload memperbarui kode di aplikasi yang sedang berjalan, sedangkan hot restart membangun ulang aplikasi dari nol.
