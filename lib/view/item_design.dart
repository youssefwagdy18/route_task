// ignore_for_file: must_be_immutable, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:route_task/model/Response.dart';

class ItemDesign extends StatefulWidget {
  List<Products>? products;
  int index;
  ItemDesign({super.key, required this.products, required this.index});

  @override
  State<ItemDesign> createState() => _ItemDesignState();
}

class _ItemDesignState extends State<ItemDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: MediaQuery.of(context).size.width * 0.005,
            color: const Color(0xFF022C7E),
          )),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                    imageUrl: widget.products?[widget.index].thumbnail ?? '',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(const CircleBorder()),
                    padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    overlayColor: WidgetStateProperty.resolveWith<Color?>(
                      (states) {
                        if (states.contains(WidgetState.pressed)) {
                          return const Color(0xFF022C7E);
                        }
                        return null;
                      },
                    ),
                  ),
                  child: const Icon(Icons.favorite, color: Color(0xFF022C7E)),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.001,
            width: double.infinity,
            color: const Color(0xFF022C7E),
          ),
          Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.065,
                        padding:const EdgeInsets.only(left: 8, right: 8,top: 8),
                        child: Text(
                          '${widget.products![widget.index].title}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: const Color(0xFF022C7E),fontSize: 14),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          '${widget.products![widget.index].description!.substring(0, 20)}..',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: const Color(0xFF022C7E),fontSize: 14,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('EGP ${widget.products![widget.index].price!.toStringAsFixed(0)}',
                            style: Theme.of(context).textTheme.titleSmall!.
                            copyWith(color: const Color(0xFF022C7E),fontSize: 15)),
                            SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                            Text('EGP${(widget.products![widget.index].price!+(
                                widget.products![widget.index].price!*(
                                    widget.products![widget.index].discountPercentage!/100
                                ))).toStringAsFixed(0)}',
                            style: const TextStyle(decoration: TextDecoration.lineThrough
                                ,color: Colors.blue,fontSize: 12 )),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left:  8.0,
                        ),
                        child: Row(
                          children: [
                            Text('Review(${widget.products![widget.index].rating})',
                            style: const TextStyle(color: Color(0xFF022C7E),fontWeight: FontWeight.bold),),
                            const Icon(Icons.star,color: Colors.yellow,),
                          ],
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
                    shape: WidgetStateProperty.all(const CircleBorder()),
                      backgroundColor: WidgetStateProperty.all(const Color(0xFF022C7E)),
                  ),
                      child: const Icon(Icons.add,color: Colors.white,),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
