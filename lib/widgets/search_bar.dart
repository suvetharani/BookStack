import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart'; // Ensure this is correctly imported

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        autofocus: true,
        onChanged: (query) {
          searchProvider.setSearchQuery(query);
        },
        decoration: InputDecoration(
          hintText: 'Search books...',
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              searchProvider.setSearchQuery('');
            },
          ),
        ),
      ),
    );
  }
}
