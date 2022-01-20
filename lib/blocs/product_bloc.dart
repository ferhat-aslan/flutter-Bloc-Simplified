import 'dart:async';

import 'package:demo_blocpat/data/product_service.dart';
import 'package:demo_blocpat/models/product.dart';

class ProductBloc{

final productStreamController =StreamController.broadcast();
Stream get getStream =>productStreamController.stream;


List<Product> getAll(){
  return ProductService.getALL();
}



}
final productBloc= ProductBloc();