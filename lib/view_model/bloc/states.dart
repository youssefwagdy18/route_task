import 'package:route_task/model/Response.dart';

abstract class ProductStates{}
class LoadingProductState extends ProductStates{}
class OnErrorProductState extends ProductStates{
  String? errorMessage;
  OnErrorProductState({required this.errorMessage});
}
class SuccessProductState extends ProductStates{
  List<Products>? productList;
  SuccessProductState({required this.productList});
}