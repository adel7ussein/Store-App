import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService{
 Future<List<ProductModel>> getAllProducts() async
{
  List<dynamic> data  = await Api().get(url: 'https://fakestoreapi.com/products');
 // print(data[0]);
  //print('+++++++++++++++++++');
 // print(data[19]);
 //print(data.length);
  
  List<ProductModel> productsList = [];
  for(int i = 0; i < 4 ; i++)
  {
   productsList.add(ProductModel.fromJson(data[i]));
  }
  
  return productsList;



}


}