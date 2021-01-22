import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/index.dart';

class NavBar extends StatelessWidget {
  final PageController pageController;
  const NavBar(this.pageController);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainViewController, MainState>(
      builder: (context, state) {
        return BottomNavigationBar(
          elevation: 15.0,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedFontSize: 14.0,
          type: BottomNavigationBarType.fixed,
          currentIndex: state.index,
          onTap: (index) {
            if (index != pageController.page.toInt()) {
              BlocProvider.of<MainViewController>(context).setPageIndex(index);
              pageController.jumpToPage(index);
            }
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.movie), label: 'Movie'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: state.index == 2
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border),
                label: 'Saved'),
            BottomNavigationBarItem(
                icon: state.index == 3
                    ? const Icon(Icons.cloud)
                    : const Icon(Icons.cloud_queue),
                label: 'Weather'),
          ],
        );
      },
    );
  }
}
