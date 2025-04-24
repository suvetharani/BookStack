import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/cart_page.dart';
import 'providers/cart_provider.dart';
import 'providers/book_provider.dart';  // <-- Add this import for book provider
import 'providers/search_provider.dart'; // <-- Add this import for search provider

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),  // Cart Provider
        ChangeNotifierProvider(create: (_) => BookProvider()),  // Book Provider
        ChangeNotifierProvider(create: (_) => SearchProvider()),  // Search Provider
      ],
      child: MaterialApp(
        title: 'BookStack',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF60B5FF),
            brightness: Brightness.light,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          '/cart': (context) => CartPage(),
        },
      ),
    );
  }
}
