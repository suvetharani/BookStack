import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/cart_page.dart';
import 'categories_page.dart';
import '../data/book_repository.dart'; 
import 'package:provider/provider.dart';
import '../providers/book_provider.dart';
import '../providers/cart_provider.dart'; // <-- Import your SearchProvider
import '../screens/contact_us.dart';

class BookStackHeader extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onCategoryTap;

  const BookStackHeader({super.key, this.onCategoryTap});

  @override
  _BookStackHeaderState createState() => _BookStackHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(140);
}

class _BookStackHeaderState extends State<BookStackHeader> {
  String selectedSort = 'Title';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 900;

    return SafeArea(
      child: Container(
        height: isMobile ? 140 : 80,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 16,
          vertical: isMobile ? 8 : 12,
        ),
        color: const Color(0xFFAFDDFF),
        child: isMobile
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Top row with logo and cart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo and App Name
                      Row(
                        children: const [
                          Icon(Icons.auto_stories, color: Color(0xFFFF9149), size: 24),
                          SizedBox(width: 8),
                          Text(
                            'BookStack',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF9149),
                            ),
                          ),
                        ],
                      ),
                      _navItem(context, 'Cart', icon: Icons.shopping_cart),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Search and Sort row
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 36,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: Colors.grey, size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: 'Search...',
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                                  ),
                                  onSubmitted: (query) => _handleSearch(context, query),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        height: 36,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedSort,
                            icon: const Icon(Icons.sort, color: Color(0xFFFF9149), size: 20),
                            isDense: true,
                            items: ['Title', 'Price', 'Author', 'Free Only']
                                .map((value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: const TextStyle(fontSize: 14)),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  selectedSort = value;
                                });
                                Provider.of<BookProvider>(context, listen: false)
                                    .sortBooks(value);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Navigation items
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _navItem(context, 'Home'),
                        _navItem(
                          context,
                          'Categories',
                          onTap: () => _showCategories(context),
                        ),
                        _navItem(context, 'Contact Us'),
                      ],
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo and App Name
                  Row(
                    children: const [
                      Icon(Icons.auto_stories, color: Color(0xFFFF9149), size: 28),
                      SizedBox(width: 8),
                      Text(
                        'BookStack',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF9149),
                        ),
                      ),
                    ],
                  ),

                  // Nav Items + Search + Sort
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (!isMediumScreen) ...[
                          _navItem(context, 'Home'),
                          _navItem(
                            context,
                            'Categories',
                            onTap: () => _showCategories(context),
                          ),
                          _navItem(context, 'Contact Us'),
                        ],
                        _navItem(context, 'Cart', icon: Icons.shopping_cart),
                        SizedBox(width: isMediumScreen ? 12 : 20),

                        // Search with logic
                        Container(
                          width: isMediumScreen ? 140 : 180,
                          height: 36,
                          padding: EdgeInsets.symmetric(horizontal: isMediumScreen ? 8 : 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey, size: isMediumScreen ? 20 : 24),
                              const SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: 'Search...',
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                  onSubmitted: (query) => _handleSearch(context, query),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: isMediumScreen ? 8 : 16),

                        // Dropdown button for sorting
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: isMediumScreen ? 8 : 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedSort,
                              icon: Icon(Icons.sort, 
                                color: Color(0xFFFF9149),
                                size: isMediumScreen ? 20 : 24
                              ),
                              isDense: true,
                              items: ['Title', 'Price', 'Author', 'Free Only']
                                  .map((value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            fontSize: isMediumScreen ? 13 : 14
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    selectedSort = value;
                                  });
                                  Provider.of<BookProvider>(context, listen: false)
                                      .sortBooks(value);
                                }
                              },
                            ),
                          ),
                        ),

                        if (isMediumScreen) ...[
                          const SizedBox(width: 8),
                          PopupMenuButton<String>(
                            icon: const Icon(Icons.menu),
                            onSelected: (value) {
                              switch (value) {
                                case 'home':
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (_) => HomeScreen()),
                                  );
                                  break;
                                case 'categories':
                                  _showCategories(context);
                                  break;
                                case 'contact':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => ContactUsPage()),
                                  );
                                  break;
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'home',
                                child: Text('Home'),
                              ),
                              const PopupMenuItem(
                                value: 'categories',
                                child: Text('Categories'),
                              ),
                              const PopupMenuItem(
                                value: 'contact',
                                child: Text('Contact Us'),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _showCategories(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Align(
        alignment: Alignment.centerLeft,
        child: Material(
          color: Colors.white,
          elevation: 4,
          child: Container(
            width: MediaQuery.of(context).size.width > 600 ? 300 : MediaQuery.of(context).size.width * 0.8,
            height: double.infinity,
            padding: const EdgeInsets.all(16),
            child: CategoriesPage(),
          ),
        ),
      ),
    );
  }

  void _handleSearch(BuildContext context, String query) {
    if (query.isEmpty) return;

    final results = BookRepository.allBooks.where((cartItem) =>
      cartItem.title.toLowerCase().contains(query.toLowerCase())
    ).toList();

    if (results.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 400,
                      width: MediaQuery.of(context).size.width > 600 ? 300 : MediaQuery.of(context).size.width * 0.8,
                      child: ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          final cartItem = results[index];
                          return Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(cartItem.image, height: 140, width: double.infinity, fit: BoxFit.cover),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(cartItem.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                  Text("by ${cartItem.author}", style: const TextStyle(color: Colors.grey)),
                                  const SizedBox(height: 4),
                                  Text(
                                    cartItem.isFree ? "Free" : "₹${cartItem.price}",
                                    style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        Provider.of<CartProvider>(context, listen: false).addToCart(cartItem);
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('${cartItem.title} added to cart')),
                                        );
                                      },
                                      icon: const Icon(Icons.shopping_cart),
                                      label: const Text('Add to Cart'),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue[800],
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Close Button
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.close, color: Colors.white, size: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No such book available'),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.close, color: Colors.white, size: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  static Widget _navItem(BuildContext context, String title,
      {IconData? icon, VoidCallback? onTap}) {
    return InkWell(
      onTap: () {
        if (title == 'Home') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          );
        } else if (title == 'Cart') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CartPage()),
          );
        } else if (title == 'Contact Us') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ContactUsPage()),
          );
        } else if (onTap != null) {
          onTap();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            if (icon != null) Icon(icon, size: 20, color: Color(0xFFFF9149)),
            if (icon != null) const SizedBox(width: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
