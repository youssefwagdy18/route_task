import 'package:flutter/material.dart';
import 'package:route_task/view/items_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: MediaQuery.of(context).size.width * 0,
        title: Image.asset(
          'assets/images/route blue.png',
          color: const Color(0xFF022C7E),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              const Expanded(
                flex: 7,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SearchBar(
                      leading: Icon(
                        Icons.search,
                        size: 35,
                        color: Color(0xFF022C7E),
                      ),
                      hintText: 'What do you search for',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.shopping_bag_sharp,
                    size: 35,
                    color: Color(0xFF022C7E),
                  ),
                ),
              )
            ],
          ),
          const ItemsFragment()
        ],
      ),
    );
  }
}
