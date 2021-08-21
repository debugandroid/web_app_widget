import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

///
/// [WebAppDrawer] is drawer which will take list of children as input.
///    WebAppDrawer(
///             children: [
///               ListTile(
///                 title: Text('Home'),
///                 leading: Icon(Icons.home),
///               ),
///               ListTile(
///                 title: Text("DashBoard"),
///                 leading: Icon(Icons.apps),
///               )
///             ],
///           ),
///
/// [divider] is Optional parameter and if it is true then a divider will
/// be shown between menu item and close button.
///
class WebAppDrawer extends StatefulWidget {
  final List<Widget>? children;
  final Key? key;
  final bool divider;
  final double _elevation;

  WebAppDrawer({
    this.key,
    required this.children,
    this.divider = false,
    double? elevation,
  }) : _elevation = elevation ?? 16.0;

  @override
  _WebAppDrawerState createState() => _WebAppDrawerState();
}

class _WebAppDrawerState extends State<WebAppDrawer> {
  bool _isDrawerOpen = false;
  late AnimationController drawerAnimationController;
  late AnimationController menuAnimationController;
  @override
  Widget build(BuildContext context) {
    return Builder(
        key: widget.key,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Visibility(
                visible: !isDrawerOpen(),
                child: FadeInDown(
                  controller: (controller) {
                    menuAnimationController = controller;
                  },
                  child: IconButton(
                    onPressed: openDrawer,
                    icon: Icon(Icons.menu),
                  ),
                ),
              ),
              Visibility(
                visible: isDrawerOpen(),
                child: Flexible(
                  child: SlideInLeft(
                    controller: (controller) {
                      drawerAnimationController = controller;
                    },
                    child: Drawer(
                      elevation: widget._elevation,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: CloseButton(
                              onPressed: closeDrawer,
                            ),
                          ),
                          if (widget.divider) Divider(),
                        ]..addAll((widget.children != null)
                            ? widget.children!
                            : <Widget>[]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  ///
  /// [isDrawerOpen] will return ture if drawer is open and false
  /// in case it is closed.
  ///
  @protected
  bool isDrawerOpen() {
    return _isDrawerOpen;
  }

  ///
  /// Open the drawer and hide the menu button.
  ///
  @protected
  void openDrawer() {
    menuAnimationController.reverse();
    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        _isDrawerOpen = true;
      });
    });
  }

  ///
  /// Close the Drawer and animate back to normal
  ///
  @protected
  void closeDrawer() {
    drawerAnimationController.reverse();
    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        _isDrawerOpen = false;
      });
    });
  }
}
