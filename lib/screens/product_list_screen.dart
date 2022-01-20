

import 'package:demo_blocpat/blocs/cart_bloc.dart';
import 'package:demo_blocpat/blocs/product_bloc.dart';
import 'package:demo_blocpat/models/cart.dart';
import 'package:demo_blocpat/models/product.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Alışveriş"),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: Icon(
                Icons.shopping_cart,
              ),
            ),
          ],
        ),
        body: buildProductList(),
      ),
    );
  }

  buildProductList() {
    return StreamBuilder(
      initialData: productBloc.getAll(),
      stream: productBloc.getStream,
      builder: (context, AsyncSnapshot snapshot) {
        
         if(snapshot.hasData)
         {return builProductListItem(snapshot);}
         return Center(child: CircularProgressIndicator(),);
        
      },
    );
  }

  builProductListItem(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final list = snapshot.data;
        return ListTile(
          title: Text(list[index].name),
          subtitle: Text(list[index].price.toString()),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {cartBloc.addToCart(Cart(list[index],1));},
          ),
        );
      },
    );
  }
}
