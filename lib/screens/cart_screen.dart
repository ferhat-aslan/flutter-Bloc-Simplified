import 'package:demo_blocpat/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
        ),
        body: StreamBuilder(
          stream: cartBloc.getStream,
          initialData: cartBloc.getCart(),
          builder: (context,snapshot){
            return buildCart(snapshot);
          },
        ),
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount:  snapshot.data.length!,
      itemBuilder: (BuildContext context,index){
        final cart=snapshot.data;
        return ListTile(
          title: Text(cart[index].product.name,),
          subtitle: Text(cart[index].product.price.toString(),),
          trailing: IconButton(
            icon: Icon(Icons.remove_shopping_cart),
            onPressed: (){
              cartBloc.removeFromCart(cart[index]);
            },
          ),
        );
      },
    );
  }
}
