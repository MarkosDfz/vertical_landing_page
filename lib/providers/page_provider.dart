
// import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider with ChangeNotifier {

  PageController scrollCtrl = new PageController();

  List<String> _pages = ['Home', 'About', 'Contact', 'Location', 'Pricing'];
  int _currentIndex = 0;

  createScrollCtrl( String routeName ) {
    this.scrollCtrl = new PageController( initialPage: getPageIndex(routeName) );

    html.document.title = _pages[ getPageIndex(routeName) ];

    this.scrollCtrl.addListener(() {
      final index = (this.scrollCtrl.page ?? 0).round();

      if ( index != _currentIndex ) {
        _currentIndex = index;
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        html.document.title = _pages[index];
      }
    });
  }

  getPageIndex( String routeName ) {
    return (_pages.indexOf(routeName) == -1) ? 0 : _pages.indexOf(routeName);
  }

  goTo( int index ) {

    html.window.history.pushState(null, 'none', '#/${_pages[index]}');

    scrollCtrl.animateToPage(
      index,
      duration: Duration( milliseconds: 300 ),
      curve: Curves.easeInOut
    );
  }

}