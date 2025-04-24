import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    double totalPrice = cart.items.fold(0.0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: BookStackHeader(),
      body: cart.items.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 16),
              ),
            )
          : Column(
              children: [
                // Cart List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(isMobile ? 8 : 16),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: isMobile ? 8 : 12),
                        child: Padding(
                          padding: EdgeInsets.all(isMobile ? 8 : 12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset(
                                  item.image,
                                  width: isMobile ? 60 : 80,
                                  height: isMobile ? 60 : 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: isMobile ? 12 : 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: isMobile ? 14 : 16,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: isMobile ? 4 : 6),
                                    Text(
                                      item.author,
                                      style: TextStyle(
                                        fontSize: isMobile ? 12 : 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: isMobile ? 12 : 16),
                              Text(
                                item.isFree ? "Free" : "₹${item.price}",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: isMobile ? 14 : 16,
                                ),
                              ),
                              if (!isMobile) const SizedBox(width: 16),
                              IconButton(
                                icon: Icon(Icons.delete_outline, 
                                  color: Colors.red,
                                  size: isMobile ? 20 : 24,
                                ),
                                onPressed: () {
                                  cart.removeFromCart(item);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('${item.title} removed from cart')),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Total Price and Buttons
                Container(
                  padding: EdgeInsets.all(isMobile ? 12 : 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Price:",
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "₹$totalPrice",
                            style: TextStyle(
                              fontSize: isMobile ? 16 : 18,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: isMobile ? 12 : 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                cart.clearCart();
                              },
                              icon: Icon(Icons.remove_shopping_cart,
                                size: isMobile ? 20 : 24,
                              ),
                              label: Text(
                                "Clear Cart",
                                style: TextStyle(
                                  fontSize: isMobile ? 14 : 16,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[400],
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  vertical: isMobile ? 12 : 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: isMobile ? 8 : 16),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Proceeding to Checkout")),
                                );
                              },
                              icon: Icon(Icons.shopping_cart_checkout,
                                size: isMobile ? 20 : 24,
                              ),
                              label: Text(
                                "Checkout",
                                style: TextStyle(
                                  fontSize: isMobile ? 14 : 16,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[800],
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  vertical: isMobile ? 12 : 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BookStackFooter(),
    );
  }
}
