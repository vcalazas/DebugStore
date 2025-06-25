import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:untitled/ui/components/forms/button_icon.dart';
import 'package:untitled/ui/components/menu/category_menu.dart';
import 'package:untitled/ui/components/menu/main_drawer_menu.dart';
import 'package:untitled/ui/components/product_list.dart';
import 'package:untitled/ui/components/publicity.dart';
import 'package:untitled/ui/pages/home/fragment_cart.dart';
import 'package:untitled/ui/pages/home/fragment_home.dart';
import 'package:untitled/ui/pages/home/fragment_notification.dart';
import 'package:untitled/ui/pages/home/fragment_profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;
  PageController pageController = PageController();
  String _title = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Text(_title),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(Icons.menu),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [ButtonIcon(onPressed: () {}, icon: Icons.search)],
      ),
      drawer: Maindrawermenu(),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          FragmentHome(),
          FragmentCart(),
          FragmentProfile(),
          FragmentNotification(),
        ],
      ),
      bottomNavigationBar: _bottonMenu(),
    );
  }

  Widget _bottonMenu() {
    List<BottomBarItem> pages = [
      BottomBarItem(
        icon: const Icon(Icons.home),
        title: const Text('Início'),
        selectedColor: Theme.of(context).colorScheme.primary,
      ),
      BottomBarItem(
        icon: const Icon(Icons.shopping_cart_outlined),
        title: const Text('Carrinho'),
        selectedColor: Theme.of(context).colorScheme.primary,
      ),
      BottomBarItem(
        icon: const Icon(Icons.person),
        title: const Text('Conta'),
        selectedColor: Theme.of(context).colorScheme.primary,
      ),
      BottomBarItem(
        icon: const Icon(Icons.notifications_none),
        title: const Text('Notificações'),
        selectedColor: Theme.of(context).colorScheme.primary,
      ),
    ];

    return StylishBottomBar(
      option: BubbleBarOptions(barStyle: BubbleBarStyle.vertical),
      items: pages,
      hasNotch: true,
      currentIndex: _selectedPage,
      onTap: (index) {
        setState(() {
          _selectedPage = index;
          pageController.jumpToPage(index);
          _title = (pages[index].title as Text).data ?? "";
        });
      },
    );
  }
}
