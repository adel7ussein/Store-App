import 'package:store_app/helper/api.dart';
class AllCategroiesService
{
  Future<List<dynamic>> getAllCategroies() async
  {
  List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products/categories');
  return data;

  }
}