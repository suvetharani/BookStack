import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';
import 'categories_page.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;

  const MainScaffold({required this.body, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: BookStackHeader(
        onCategoryTap: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      drawer: Drawer(
        child: CategoriesPage(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            body,
            BookStackFooter(),
          ],
        ),
      ),
    );
  }
}
