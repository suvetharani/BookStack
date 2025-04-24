import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class BookProvider with ChangeNotifier {
  List<CartItem> _fictionBooks = [
    CartItem(
      image: 'assets/images/fiction/book1.jpeg',
      title: 'The Night Circus',
      author: 'By Erin Morgenstern',
      price: 350,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/fiction/book2.jpg',
      title: 'The Goldfinch',
      author: 'By Donna Tartt',
      price: 500,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/fiction/book3.jpeg',
      title: 'Where the Crawdads Sing',
      author: 'By Delia Owens',
      price: 1549,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/fiction/book4.webp',
      title: 'Circe',
      author: 'By Madeline Miller',
      price: 200,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/fiction/book5.jpg',
      title: 'The Night Watchman',
      author: 'By Louise Erdrich',
      price: 1400,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/fiction/book6.jpg',
      title: 'The Invisible Life of Addie LaRue',
      author: 'By V.E. Schwab',
      price: 0,
      isFree: true,
    ),
    CartItem(
      image: 'assets/images/fiction/book7.jpeg',
      title: 'Big Little Lies',
      author: 'By Liane Moriarty',
      price: 359,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/fiction/book8.webp',
      title: 'The Midnight Library',
      author: 'By Matt Haig',
      price: 699,
      isFree: false,
    ),
  ];

  List<CartItem> _nonFictionBooks = [
    CartItem(
      image: 'assets/images/nonfiction/book1.webp',
      title: 'Educate',
      author: 'By Tara Westover',
      price: 350,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/nonfiction/book2.jpeg',
      title: 'Sapiens: A Brief History of Humankind',
      author: 'By Yuval Noah Harari',
      price: 500,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/nonfiction/book3.jpeg',
      title: 'The Body Keeps the Score',
      author: 'By Bessel van der Kolk',
      price: 1549,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/nonfiction/book4.png',
      title: 'Quiet',
      author: 'By Susan Cain',
      price: 200,
      isFree: false,
    ),
  ];

  List<CartItem> _biographyBooks = [
    CartItem(
      image: 'assets/images/biography/book1.webp',
      title: 'Steve Jobs',
      author: 'By Walter Isaacson',
      price: 350,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/biography/book2.jpeg',
      title: 'Long Walk to Freedom',
      author: 'By Nelson Mandela',
      price: 500,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/biography/book3.jpeg',
      title: 'The Diary of a Young Girl',
      author: 'By Delia Owens',
      price: 1549,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/biography/book4.jpeg',
      title: 'I Am Malala',
      author: 'By Malala Yousafzai',
      price: 200,
      isFree: false,
    ),
  ];

  List<CartItem> _mysteryBooks = [
    CartItem(
      image: 'assets/images/mystery/book1.jpeg',
      title: 'The Girl with the Dragon Tattoo',
      author: 'By Stieg Larsson',
      price: 350,
      isFree: false,
    ),
  ];

  List<CartItem> _sciFiBooks = [
    CartItem(
      image: 'assets/images/scifi/book1.jpeg',
      title: 'Dune',
      author: 'By Frank Herbert',
      price: 350,
      isFree: false,
    ),
  ];
  List<CartItem> _poetryBooks = [
    CartItem(
      image: 'assets/images/poetry/book1.jpeg',
      title: 'The Sun and Her Flowers',
      author: 'By Rupi Kaur',
      price: 350,
      isFree: false,
    ),
  ];
  List<CartItem> _educationalBooks = [
    CartItem(
      image: 'assets/images/educational/book1.jpeg',
      title: 'A Short History of Nearly Everything',
      author: 'By Bill Bryson',
      price: 350,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/educational/book2.jpg',
      title: 'Thinking, Fast and Slow',
      author: 'By Daniel Kahneman',
      price: 500,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/educational/book3.jpeg',
      title: 'How to Win Friends and Influence People',
      author: 'By Dale Carnegie',
      price: 200,
      isFree: false,
    ),
    CartItem(
      image: 'assets/images/educational/book4.jpg',
      title: 'The Elements of Style',
      author: 'By  William Strunk Jr. and E.B. White',
      price: 1400,
      isFree: false,
    ),
  ];

  String _sortBy = 'Title';

  // For Fiction Books
  List<CartItem> get fictionBooks {
    List<CartItem> sortedBooks = [..._fictionBooks];

    switch (_sortBy) {
      case 'Title':
        sortedBooks.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Author':
        sortedBooks.sort((a, b) => a.author.compareTo(b.author));
        break;
      case 'Price':
        sortedBooks.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Free Only':
        sortedBooks = sortedBooks.where((book) => book.isFree).toList();
        break;
    }

    return sortedBooks;
  }

  // For Non-Fiction Books
  List<CartItem> get nonFictionBooks {
    List<CartItem> sortedBooks = [..._nonFictionBooks];

    switch (_sortBy) {
      case 'Title':
        sortedBooks.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Author':
        sortedBooks.sort((a, b) => a.author.compareTo(b.author));
        break;
      case 'Price':
        sortedBooks.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Free Only':
        sortedBooks = sortedBooks.where((book) => book.isFree).toList();
        break;
    }

    return sortedBooks;
  }

  //for biography books
    List<CartItem> get biographyBooks {
    List<CartItem> sortedBooks = [..._biographyBooks];

    switch (_sortBy) {
      case 'Title':
        sortedBooks.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Author':
        sortedBooks.sort((a, b) => a.author.compareTo(b.author));
        break;
      case 'Price':
        sortedBooks.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Free Only':
        sortedBooks = sortedBooks.where((book) => book.isFree).toList();
        break;
    }

    return sortedBooks;
  }
  // For Mystery Books
  List<CartItem> get mysteryBooks {
    List<CartItem> sortedBooks = [..._mysteryBooks];

    switch (_sortBy) {
      case 'Title':
        sortedBooks.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Author':
        sortedBooks.sort((a, b) => a.author.compareTo(b.author));
        break;
      case 'Price':
        sortedBooks.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Free Only':
        sortedBooks = sortedBooks.where((book) => book.isFree).toList();
        break;
    }

    return sortedBooks;
  }
  // For scifi Books
  List<CartItem> get sciFiBooks {
    List<CartItem> sortedBooks = [..._sciFiBooks];

    switch (_sortBy) {
      case 'Title':
        sortedBooks.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Author':
        sortedBooks.sort((a, b) => a.author.compareTo(b.author));
        break;
      case 'Price':
        sortedBooks.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Free Only':
        sortedBooks = sortedBooks.where((book) => book.isFree).toList();
        break;
    }

    return sortedBooks;
  }
  // For peotry Books
  List<CartItem> get poetryBooks {
    List<CartItem> sortedBooks = [..._poetryBooks];

    switch (_sortBy) {
      case 'Title':
        sortedBooks.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Author':
        sortedBooks.sort((a, b) => a.author.compareTo(b.author));
        break;
      case 'Price':
        sortedBooks.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Free Only':
        sortedBooks = sortedBooks.where((book) => book.isFree).toList();
        break;
    }

    return sortedBooks;
  }
  // For educational Books
  List<CartItem> get educationalBooks {
    List<CartItem> sortedBooks = [..._educationalBooks];

    switch (_sortBy) {
      case 'Title':
        sortedBooks.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Author':
        sortedBooks.sort((a, b) => a.author.compareTo(b.author));
        break;
      case 'Price':
        sortedBooks.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Free Only':
        sortedBooks = sortedBooks.where((book) => book.isFree).toList();
        break;
    }

    return sortedBooks;
  }


  void sortBooks(String sortBy) {
    _sortBy = sortBy;
    notifyListeners();
  }

  String get currentSort => _sortBy;
}
