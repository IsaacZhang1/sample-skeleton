import 'package:flutter/material.dart';
import 'package:lark_skeleton/screens/history_screen.dart';
import 'package:lark_skeleton/screens/shopping_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  String _appBarTitle() {
    if (_selectedIndex == 0) {
      return 'Shopping List';
    } else if (_selectedIndex == 1) {
      return 'History';
    } else {
      return 'Default Title';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle()),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            ShoppingListScreen(),
            HistoryScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'List'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
