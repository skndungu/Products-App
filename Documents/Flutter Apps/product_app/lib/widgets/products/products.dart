import 'package:flutter/material.dart';

import './products_card.dart';

class Products extends StatelessWidget{
final List<Map<String, dynamic>> products;


Products(this.products); 


Widget _buildProductList() {
  Widget productCards;
   if(products.length > 0) {
productCards = ListView.builder(
          itemBuilder: (BuildContext context, int index) => 
          ProductCard(products[index], index),
          itemCount: products.length,
          );
   } 
   else { 
     productCards =  Center(child: Text('No Products found Please add some !!'),);
   }
   return productCards;
}
@override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}