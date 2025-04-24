import 'package:flutter/material.dart';
import '/screens/fiction_page.dart';
import '/screens/nonfiction_page.dart';
import '/screens/biographies_page.dart';
import '/screens/mystery_page.dart';
import '/screens/scifi_page.dart';
import '/screens/poetry_page.dart';
import '/screens/educational_page.dart';

class CategoriesPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'emoji': '📚', 'name': 'Fiction', 'page': FictionPage()},
    {'emoji': '📖', 'name': 'Non-Fiction', 'page': NonfictionPage()},
    {'emoji': '👤', 'name': 'Biographies', 'page': BiographyPage()},
    {'emoji': '🕵️‍♂️', 'name': 'Mystery & Thrillers', 'page': MysteryPage()},
    {'emoji': '👽', 'name': 'Science Fiction', 'page': SciFiPage()},
    {'emoji': '📝', 'name': 'Poetry', 'page': PoetryPage()},
    {'emoji': '🎓', 'name': 'Educational', 'page': EducationalPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.white), // 👈 Text color set to white
        ),
        backgroundColor: Colors.brown[800],
        iconTheme: const IconThemeData(color: Colors.white), // Optional: back icon color
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...categories.map((cat) {
            return ListTile(
              leading: Text(cat['emoji'], style: const TextStyle(fontSize: 20)),
              title: Text(
                cat['name'],
                style: const TextStyle(color: Colors.brown),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.brown),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cat['page']),
                );
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
