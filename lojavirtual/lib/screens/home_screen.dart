import 'package:flutter/material.dart';
import 'package:lojavirtual/tabs/categories_tab.dart';
import 'package:lojavirtual/tabs/home_tab.dart' ;
import 'package:lojavirtual/widgets/cart_button.dart';
import 'package:lojavirtual/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: CategoriesTab(),
          floatingActionButton: CartButton(),
        ),
        Container(color: Colors.green),
        Container(color: Colors.grey),
      ],
    );
  }
}
