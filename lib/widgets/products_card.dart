import 'package:flutter/material.dart';
import 'package:goal_strike/screens/menu.dart';
import 'package:goal_strike/screens/products_entry_list.dart';
import 'package:goal_strike/screens/productslist_form.dart';
import 'package:goal_strike/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async{
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
            );

            if(item.name == "Create Product"){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductFormPage(),
                ),
              );  
            }
            else if (item.name == "All Product") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProductEntryListPage()
                  ),
              );
          }
          else if (item.name == "My Product") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductEntryListPage(
                filterUserProductsOnly: true,
              ),
            ),
          );
        }
                  
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const SizedBox(height: 5),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
