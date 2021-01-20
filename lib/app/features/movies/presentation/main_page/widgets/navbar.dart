import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prospera_exercise/app/features/movies/presentation/main_page/controller/index.dart';

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
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Saved'),
          ],
        );
      },
    );
  }
}
