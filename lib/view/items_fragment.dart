import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/view/item_design.dart';
import 'package:route_task/view_model/bloc/product_view_model.dart';
import 'package:route_task/view_model/bloc/states.dart';

class ItemsFragment extends StatefulWidget {
  const ItemsFragment({super.key});

  @override
  State<ItemsFragment> createState() => _ItemsFragmentState();
}

class _ItemsFragmentState extends State<ItemsFragment> {
  ProductViewModel viewModel =ProductViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<ProductViewModel , ProductStates>(
      bloc: viewModel,
      builder: (context , state){
        if(state is LoadingProductState){
          return const Center(child: CircularProgressIndicator(),);
        }else if(state is SuccessProductState){
          return Expanded(
            child: GridView.builder(
            scrollDirection: Axis.vertical,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              childAspectRatio: 0.7),
              itemCount: state.productList!.length,
              itemBuilder: (context , index){
                return ItemDesign(products:state.productList ,index: index,);
              }),
          );
        }else if(state is OnErrorProductState){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.errorMessage??'',style: Theme.of(context).textTheme.titleLarge,),
              ElevatedButton(onPressed: (){
                viewModel.getProducts();
              }, child: const Text('try again'))
            ],
          );
        }
        return Container(color: Colors.black,);
      },
    );
  }
}
