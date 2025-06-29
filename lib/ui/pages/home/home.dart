import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:untitled/ui/components/forms/button_icon.dart';
import 'package:untitled/ui/components/menu/main_drawer_menu.dart';
import 'package:untitled/ui/pages/home/fragment_cart.dart';
import 'package:untitled/ui/pages/home/fragment_home.dart';
import 'package:untitled/ui/pages/home/fragment_notification.dart';
import 'package:untitled/ui/pages/home/fragment_profile.dart';

enum HomeStartPage { home, cart, profile, notification }

class Home extends StatefulWidget {
  HomeStartPage? startPage;

  Home({super.key, this.startPage});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;

  int _selectedPage = 0;
  String _title = 'Home';

  @override
  void initState() {
    switch (widget.startPage) {
      case HomeStartPage.cart:
        _selectedPage = 1;
        _title = 'Carrinho';
        break;
      case HomeStartPage.profile:
        _selectedPage = 2;
        _title = 'Conta';
        break;
      case HomeStartPage.notification:
        _selectedPage = 3;
        _title = 'Notificações';
        break;
      default:
        _selectedPage = 0;
        _title = 'Home';
    }
    _pageController = PageController(initialPage: _selectedPage);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _pageController.jumpToPage(_selectedPage);
    });
    super.initState();
  }

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
        controller: _pageController,
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
          _pageController.jumpToPage(index);
          _title = (pages[index].title as Text).data ?? "";
        });
      },
    );
  }
}
