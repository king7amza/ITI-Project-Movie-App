import 'package:flutter/material.dart';
import 'package:iti_project_movie_app/utils/app_colors.dart';
import 'package:iti_project_movie_app/views/pages/book_mark_page.dart';
import 'package:iti_project_movie_app/views/pages/search_page.dart';
import 'package:iti_project_movie_app/views/pages/profile_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      stateManagement: false,
      backgroundColor: AppColors.darkGrey2,
      tabs: [
        PersistentTabConfig(
          screen: SearchPage(),
          item: ItemConfig(
            icon: Icon(Icons.search),
            title: "Search",
            activeForegroundColor: AppColors.primaryColor,
            textStyle: TextStyle(fontSize: 15),
          ),
        ),
        PersistentTabConfig(
          screen: BookMarkPage(),
          item: ItemConfig(
            icon: Icon(Icons.bookmark),
            title: "BookMark",
            activeForegroundColor: AppColors.primaryColor,
            textStyle: TextStyle(fontSize: 15),
          ),
        ),
        PersistentTabConfig(
          screen: ProfilePage(),
          item: ItemConfig(
            icon: Icon(Icons.person),
            title: "Profile",
            activeForegroundColor: AppColors.primaryColor,
            textStyle: TextStyle(fontSize: 15),
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: AppColors.lightBlack,
        ),
      ),
    );
  }
}
