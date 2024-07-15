import 'package:route_task/model/Response.dart';
import 'package:route_task/reposatory/reposatory_data_source_contract.dart';

class ProductsReposatoryImpl implements ReposatoryDataSourceContract{
  ProductsRemoteDataSource productsRemoteDataSource;
  ProductsReposatoryImpl({required this.productsRemoteDataSource});
  @override
  Future<Response?> getProducts() async{
   return productsRemoteDataSource.getProducts();
  }

}