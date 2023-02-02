import 'package:flutter/material.dart';
import 'package:movie_app/src/constant/asset_list.dart';
import 'package:movie_app/src/constant/colors.dart';
import 'package:movie_app/src/screen/index/index_screen.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int currentPageIndex = 0;

  final Color _iconColor = Colors.grey.shade400;
  final Color _selectedIconColor = Colors.white;
  final Color _tintColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: primaryColor,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        surfaceTintColor: primaryColor,
        shadowColor: primaryColor,
        elevation: 0,
        height: 70,
        onDestinationSelected: (int index) {
          currentPageIndex = index;
          setState(() {});
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: customIcon(
                assetName: AssetList.navHome, iconColor: _selectedIconColor),
            icon:
                customIcon(assetName: AssetList.navHome, iconColor: _iconColor),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: customIcon(
                assetName: AssetList.navTicket, iconColor: _selectedIconColor),
            icon: customIcon(
                assetName: AssetList.navTicket, iconColor: _iconColor),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: customIcon(
                assetName: AssetList.navWallet, iconColor: _selectedIconColor),
            icon: customIcon(
                assetName: AssetList.navWallet, iconColor: _iconColor),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: customIcon(
                assetName: AssetList.navUser, iconColor: _selectedIconColor),
            icon:
                customIcon(assetName: AssetList.navUser, iconColor: _iconColor),
            label: '',
          ),
        ],
      ),
      body: <Widget>[
        const IndexScreen(),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
        Container(
          color: Colors.purple,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],
    );
  }
}

Widget customIcon({required String assetName, required Color iconColor}) {
  return Image.asset(
    assetName,
    width: 24.0,
    height: 24.0,
    color: iconColor,
  );
}
