import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';
import '../providers/cart_provider.dart';
import '../providers/book_provider.dart';

class NonfictionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final bookProvider = Provider.of<BookProvider>(context);
    final books = bookProvider.nonFictionBooks;
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine grid cross axis count based on screen width
    int crossAxisCount;
    if (screenWidth < 600) {
      crossAxisCount = 1; // Mobile: 1x1
    } else if (screenWidth < 900) {
      crossAxisCount = 2; // Tablet: 2x2
    } else {
      crossAxisCount = 4; // Desktop: 4x4
    }

    return Scaffold(
      appBar: BookStackHeader(),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              itemCount: books.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 1.00,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final book = books[index];
                return Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Image.asset(
                        book.image,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          book.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(
                        book.author,
                        style: TextStyle(fontSize: 14),
                      ),
                      if (!book.isFree)
                        Text(
                          '₹${book.price}',
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      if (book.isFree)
                        Text(
                          'Free',
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            cart.addToCart(book);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${book.title} added to cart')),
                            );
                          },
                          icon: Icon(Icons.shopping_cart, color: Colors.white),
                          label: Text("Add To Cart", style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BookStackFooter(),
    );
  }
}
