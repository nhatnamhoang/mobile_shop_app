import 'package:flutter/material.dart';
import 'package:mobile_shop_app/@share/utils/util.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/images.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';

class BottomNavigationViewPager extends StatefulWidget {
  final Function(int)? onTapTab;
  final int? index;
  final int? countMessage;

  BottomNavigationViewPager({
    this.index,
    this.onTapTab,
    this.countMessage,
  });

  @override
  _BottomNavigationViewPagerState createState() =>
      _BottomNavigationViewPagerState();
}

class _BottomNavigationViewPagerState extends State<BottomNavigationViewPager> {
  var _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return itemBottomBar(widget.index!, widget.onTapTab);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget itemBottomBar(int index, Function(int)? action) =>
      ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: index,
          backgroundColor: AppColors.white,
          elevation: 0,
          onTap: (tab) {
            action!(tab);
          },
          type: BottomNavigationBarType.fixed,
          iconSize: 15,
          selectedFontSize: 15,
          unselectedFontSize: 15,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.greyIcon,
          items: [
            _itemBottomNavigation(
                icon: AppImages.icHome,
                label: ''),
            _itemBottomNavigation(
                icon: AppImages.icDiscovery,
                label: ''),
          ],
        ),
      );

  BottomNavigationBarItem _itemBottomNavigation(
          {required String icon, String? label}) =>
      BottomNavigationBarItem(
          icon: Column(
            children: [
              Container(
                child: Image.asset(
                  icon,
                  fit: BoxFit.contain,
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          activeIcon: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackOpacity,
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.asset(
                  icon,
                  fit: BoxFit.contain,
                  width: 24,
                  height: 24,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          label: label);
}
