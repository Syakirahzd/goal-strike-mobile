import 'package:flutter/material.dart';
import 'package:goal_strike/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:goal_strike/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "jersey";
  String _thumbnail = "";
  bool _isFeatured = false;

  final Map<String, String> _categories = {
    'jersey': 'Jersey',
    'balls': 'Balls',
    'socks': 'Socks',
    'gloves': 'Gloves',
    'backpacks': 'Backpacks',
    'soccer cleats': 'Soccer Cleats',
  };

  bool _isValidUrl(String value) {
    final uri = Uri.tryParse(value);
    if (uri == null) return false;
    return uri.isAbsolute && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Create Product',
          ),
        ),
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
      ),
      drawer: LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === Name ===
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name tidak boleh kosong!';
                  }
                  return null;
                },
              ),
            ),

            // === Price ===
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Price',
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _price = int.tryParse(value) ?? 0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harga tidak boleh kosong!';
                  }
                  final int? price = int.tryParse(value);
                  if (price == null) return 'Harga harus berupa angka!';
                  if (price <= 0) return 'Harga harus lebih dari 0!';
                  return null;
                },
              ),
            ),

            // === Description ===
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _description = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong!";
                  }
                  if (value.length < 10) {
                    return "Deskripsi minimal 10 karakter!";
                  }
                  if (value.length > 300) {
                    return "Deskripsi maksimal 300 karakter!";
                  }
                  return null;
                },
              ),
            ),

            // === Category ===
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                value: _category,
                items: _categories.entries
                    .map(
                      (entry) => DropdownMenuItem(
                        value: entry.key,
                        child: Text(entry.value),
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    _category = newValue!;
                  });
                },
              ),
            ),

            // === Thumbnail URL ===
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "URL Thumbnail",
                    labelText: "URL Thumbnail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _thumbnail = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'URL thumbnail tidak boleh kosong!';
                    }
                    if (!_isValidUrl(value)) {
                      return 'Masukkan URL valid (http/https)!';
                    }
                    return null;
                  }),
            ),

            // === Is Featured ===
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SwitchListTile(
                title: const Text("Tandai sebagai Product Unggulan"),
                value: _isFeatured,
                activeColor: secondaryColor,
                onChanged: (value) {
                  setState(() {
                    _isFeatured = value;
                  });
                },
              ),
            ),

            // === Submit Button ===
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(secondaryColor),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Tampilkan dialog konfirmasi
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Produk berhasil tersimpan'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name: $_name'),
                                  Text('Price: Rp $_price'),
                                  Text('Description: $_description'),
                                  Text('Category: ${_categories[_category]}'),
                                  Text('Thumbnail: $_thumbnail'),
                                  Text('Unggulan: ${_isFeatured ? "Ya" : "Tidak"}'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  
                                  // Kirim data ke server
                                  final response = await request.postJson(
                                    "http://localhost:8000/create-flutter/",
                                    jsonEncode({
                                      "name": _name,
                                      "price": _price,
                                      "description": _description,
                                      "thumbnail": _thumbnail,
                                      "category": _category,
                                      "is_featured": _isFeatured,
                                    }),
                                  );

                                  if (context.mounted) {
                                    if (response['status'] == 'success') {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Product successfully saved to server!")),
                                      );
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage()),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "Something went wrong, please try again."),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}