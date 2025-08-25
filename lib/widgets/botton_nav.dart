import 'package:flutter/material.dart';
import 'package:movie_app_fiap25/pages/home/home_page.dart';
import 'package:movie_app_fiap25/pages/top_rated/top_rated_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int paginaAtual = 0;
  PageController pc = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: (page) {
          setState(() {
            paginaAtual = page;
          });
        },
        children: const [HomePage(), TopRatedPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Top Rated',
          ),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
