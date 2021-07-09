
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {

  bool isOpen = false;
  late AnimationController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = AnimationController(
      vsync: this,
      duration: Duration( milliseconds: 200 )
    );
  }

  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>( context, listen: false );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if ( isOpen ) {
            ctrl.reverse();
          } else {
            ctrl.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          width: 150,
          height: isOpen ? 308 : 50,
          padding: EdgeInsets.symmetric( horizontal: 10 ),
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, ctrl: ctrl),
              if( isOpen )
              ...[
                CustomMenuItem( delay: 0, text: 'Home', onPressed: () => pageProvider.goTo(0) ),
                CustomMenuItem( delay: 30, text: 'About', onPressed: () => pageProvider.goTo(1) ),
                CustomMenuItem( delay: 60, text: 'Contact', onPressed: () => pageProvider.goTo(2) ),
                CustomMenuItem( delay: 90, text: 'Location', onPressed: () => pageProvider.goTo(3) ),
                CustomMenuItem( delay: 120, text: 'Pricing', onPressed: () => pageProvider.goTo(4) ),
                SizedBox( height: 8 )
              ]
            ],
          ),
        ),
      ),
    );

  }
}

class _MenuTitle extends StatelessWidget {

  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.ctrl,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController ctrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration( milliseconds: 200 ),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text( 'Menú',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18
            )
          ),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: ctrl,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}