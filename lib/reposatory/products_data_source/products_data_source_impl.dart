import 'dart:convert';
import 'package:route_task/model/Response.dart';
import 'package:route_task/reposatory/reposatory_data_source_contract.dart';
import 'package:http/http.dart'as http;
import '../../model/api_constants.dart';

 class ProductsDataSourceImpl implements ProductsRemoteDataSource{
  @override
   Future<Response?> getProducts()async {
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.path);
      var response = await http.get(url);
      var jason = jsonDecode(response.body);
      return Response.fromJson(jason);
  }
}