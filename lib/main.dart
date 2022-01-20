import 'package:demo_blocpat/screens/cart_screen.dart';
import 'package:demo_blocpat/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    routes: {
      "/":(BuildContext context)=>ProductListScreen(),
      "/cart":(BuildContext context) =>CartScreen(),
    },
    initialRoute: "/",
     
    );
  }
}

