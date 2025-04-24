import 'package:bookstack/models/cart_item.dart';
import 'package:flutter/material.dart';
import '../data/book_repository.dart'; // Make sure this is where your books data is

class SearchProvider extends ChangeNotifier {
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  // Setter for search query
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // Get the filtered books based on the search query
  List<CartItem> get searchResults {
    if (_searchQuery.isEmpty) {
      return BookRepository.allBooks; // or return an empty list if no query
    }
    return BookRepository.allBooks
        .where((book) =>
            book.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            book.author.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }
}
