import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled =true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
 List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product){
            setState(() {
                _products.add(product);             
                });
  } 

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  } 
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple
      ),
      // home: AuthPage(),
      routes: {
        '/':  (BuildContext context) => AuthPage(),
        '/products':  (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ProductAdminPage(_addProduct, _deleteProduct),
      },
      onGenerateRoute: (RouteSettings settings) {
       final List<String> pathElements = settings.name.split('/');
       if(pathElements[0] != '') {
         return null;
       }
       if(pathElements[1] == 'product') {
         final int index = int.parse(pathElements[2]);
                return  MaterialPageRoute<bool>(
                    builder: (BuildContext context) => ProductPage(
                      _products[index]['title'], 
                      _products[index]['imageUrl'],
                      _products[index]['price'],
                      _products[index]['description']
                       ),
                      );
       }
          return null;
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (BuildContext context) => ProductsPage(_products),);
      },
      );
  }
} 