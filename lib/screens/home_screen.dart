import 'package:flutter/material.dart';
import '../widgets/main_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final bannerHeight = isMobile ? screenWidth * 0.5 : 400.0;

    return MainScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              width: double.infinity,
              height: bannerHeight,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/bookbanner2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 3-Step Section
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 16.0 : 20.0,
                horizontal: isMobile ? 16.0 : 0,
              ),
              child: Column(
                children: [
                  SizedBox(height: isMobile ? 12 : 20),
                  isMobile
                      ? Column(
                          children: [
                            buildStepBox(
                              context,
                              "Step 1",
                              Icons.search,
                              "Select the books you want",
                              "Search from over hundreds of books listed on BookStack.",
                            ),
                            SizedBox(height: 16),
                            buildStepBox(
                              context,
                              "Step 2",
                              Icons.shopping_cart_checkout,
                              "Place the order by adding it to the cart",
                              "Then simply place the order by clicking on 'checkout' button.",
                            ),
                            SizedBox(height: 16),
                            buildStepBox(
                              context,
                              "Step 3",
                              Icons.local_shipping,
                              "Get the books delivered at your doorstep",
                              "The books will be delivered to you at your doorstep!",
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildStepBox(
                              context,
                              "Step 1",
                              Icons.search,
                              "Select the books you want",
                              "Search from over hundreds of books listed on BookStack.",
                            ),
                            buildStepBox(
                              context,
                              "Step 2",
                              Icons.shopping_cart_checkout,
                              "Place the order by adding it to the cart",
                              "Then simply place the order by clicking on 'checkout' button.",
                            ),
                            buildStepBox(
                              context,
                              "Step 3",
                              Icons.local_shipping,
                              "Get the books delivered at your doorstep",
                              "The books will be delivered to you at your doorstep!",
                            ),
                          ],
                        ),
                ],
              ),
            ),
            
            // Content Section
            Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Popular Categories", style: headingStyle),
                  SizedBox(height: 4),
                  Text(
                    "Fiction, Non-Fiction, Biographies, Self-Help, Children's Books, Educational Books, Mystery & Thrillers, Romance, "
                    "Science Fiction & Fantasy, Historical Novels, Comics & Graphic Novels, Poetry, Religion & Spirituality, "
                    "Business & Economics, Travel Guides.",
                    style: bodyStyle,
                  ),
                  SizedBox(height: 16),
                  Text("Cities We Deliver To", style: headingStyle),
                  SizedBox(height: 4),
                  Text(
                    "Arakkonam, Coimbatore, Cuddalore, Dharmapuri, Dindigul, Erode, Kanchipuram, Karur, "
                    "Madurai, Nagercoil, Namakkal, Pudukkottai, Rameswaram, Salem, Thanjavur, Theni, Tirunelveli, "
                    "Tiruppur, Tiruvallur, Trichy, Vellore, Villupuram, Virudhunagar",
                    style: bodyStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStepBox(BuildContext context, String step, IconData icon, String title, String subtitle) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      width: isMobile ? double.infinity : 170,
      padding: EdgeInsets.all(isMobile ? 16 : 12),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              CircleAvatar(
                radius: isMobile ? 32 : 28,
                backgroundColor: Colors.white,
                child: Icon(icon, size: isMobile ? 34 : 30, color: Colors.blueGrey),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(step, style: TextStyle(color: Colors.white, fontSize: isMobile ? 12 : 10)),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 20 : 15),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 15 : 13,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 8 : 6),
          Text(
            subtitle,
            style: TextStyle(fontSize: isMobile ? 13 : 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  TextStyle get headingStyle => TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle get bodyStyle => TextStyle(fontSize: 14);
}
