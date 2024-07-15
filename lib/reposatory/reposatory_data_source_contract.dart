

import 'package:route_task/model/Response.dart';

abstract class ReposatoryDataSourceContract {
  Future<Response?>getProducts();
}
abstract class ProductsRemoteDataSource{
  Future<Response?>getProducts();
}