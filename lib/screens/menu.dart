import 'package:flutter/material.dart';
import 'package:goal_strike/screens/productslist_form.dart';
import 'package:goal_strike/widgets/left_drawer.dart';
import 'package:goal_strike/widgets/products_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String nama = "Syakirah Zahra Dhawini"; // nama
  final String npm = "2406353950"; // npm
  final String kelas = "D"; // kelas

  final List<ItemHomepage> items = [
    ItemHomepage("All Product", Icons.menu_book, const Color.fromARGB(255, 0, 140, 255)),
    ItemHomepage("My Product", Icons.bookmark, const Color.fromARGB(255, 22, 140, 26)),
    ItemHomepage("Create Product", Icons.add, const Color.fromARGB(255, 217, 25, 12)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Goal Strike',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      drawer: LeftDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Info baris atas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: nama),
                  InfoCard(title: 'Class', content: kelas),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Selamat datang di Goal Strike!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),

              const SizedBox(height: 20),

              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true, // penting agar tinggi disesuaikan konten
                physics:
                    const NeverScrollableScrollPhysics(), // hilangkan scroll ganda
                padding: const EdgeInsets.all(10),
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color? color; //Menambahkan parameter warna

  ItemHomepage(this.name, this.icon, this.color);
}