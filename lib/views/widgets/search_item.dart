import 'package:flutter/material.dart';
import 'package:iti_project_movie_app/utils/app_colors.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(70)),
          border: Border.all(color: AppColors.primaryColor, width: 2.5),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: 15,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: AppColors.white,
              ),
              child: Center(
                child: TextField(
                  controller: controller,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 40,
                      top: 15,
                      right: 20,
                      bottom: 15,
                    ),
                    hintText: "Search movies...",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: AppColors.lightGrey1,
                    ),
                    prefixIcon: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search, color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
