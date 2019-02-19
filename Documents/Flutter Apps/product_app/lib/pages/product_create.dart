import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
final Function addProduct;

ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue;

  Widget _builtTitleTextField(){
     return TextField(
        decoration: InputDecoration(labelText: 'Product Title'),
        onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },);
  }

  Widget _buildDescriptionTextField(){
    return TextField(
        decoration: InputDecoration(labelText: 'Product Description'),
        maxLines: 4,
        onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },);
  }

Widget _buildPriceTextField() {
  return   TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Product Price'),
        onChanged: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
      );
}

void _submitForm(){
        final Map<String, dynamic> product = {
          'title': _titleValue,
          'description': _descriptionValue,
          'price': _priceValue,
          'imageUrl': 'assets/food.jpg'
        };
         widget.addProduct(product);
         Navigator.pushReplacementNamed(context, '/products');
}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
      children: <Widget>[
      _builtTitleTextField(),
      _buildDescriptionTextField(),
      _buildPriceTextField(),
      SizedBox(height: 10.0,),
      RaisedButton(
        child: Text('Save'),
        color: Theme.of(context).accentColor,
        textColor: Colors.white,
      onPressed: _submitForm,
      )
    ],
    ),);
  }
}