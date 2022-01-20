import 'dart:core';
import 'package:demo_blocpat/models/product.dart';

class ProductService{

static List<Product> products= [];

static ProductService _singleton =ProductService._internal();

factory ProductService(){
  return _singleton;
}


ProductService._internal();

static List<Product> getALL(){
products.add(Product(1,"Acer Laptop",6000));
products.add(Product(1,"Asus Laptop",7000));
products.add(Product(1,"Hp Laptop",8000));
return products;
}
  
  
  }