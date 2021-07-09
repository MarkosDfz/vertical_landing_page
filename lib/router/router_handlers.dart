
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';

import 'package:vertical_landing_page/ui/pages/home_page.dart';

final homeHandler = Handler(
  handlerFunc: ( context, params ) {

    final pageProvider = Provider.of<PageProvider>( context!, listen: false );

    final page = params['page']!.first;
    if( page != '/' ) {

      pageProvider.createScrollCtrl(page);
      return HomePage();

    }

  }
);