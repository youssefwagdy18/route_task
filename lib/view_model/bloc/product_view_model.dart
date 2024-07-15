// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:route_task/reposatory/products_data_source/products_data_source_impl.dart';
import 'package:route_task/reposatory/products_reposatory/products_reposatory_impl.dart';
import 'package:route_task/reposatory/reposatory_data_source_contract.dart';
import 'package:route_task/view_model/bloc/states.dart';

class ProductViewModel extends Cubit<ProductStates>{
  late ReposatoryDataSourceContract reposatoryDataSourceContract;
  late ProductsRemoteDataSource productsRemoteDataSource;
  ProductViewModel() : super(LoadingProductState()){
    productsRemoteDataSource = ProductsDataSourceImpl();
    reposatoryDataSourceContract =ProductsReposatoryImpl(productsRemoteDataSource: productsRemoteDataSource);
  }
  void getProducts()async{
    try{
      emit(LoadingProductState());
      var response = await reposatoryDataSourceContract.getProducts();
      print(response?.products);
      // if(response?.skip == 0){
      //   emit(OnErrorProductState(errorMessage: 'There is an error occurred'));
      // }
      // else {
        emit(SuccessProductState(productList:response!.products));
      // }
    }catch(e){
      print(e);
      emit(OnErrorProductState(errorMessage: e.toString()));
    }
  }

}