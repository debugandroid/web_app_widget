import 'package:flutter/material.dart';

class WebAppBar extends StatelessWidget {
  final double height;
  final Widget? leading;
  final Widget? title;
  final Widget? subTitle;
  final Widget? trailing;
  final Color? color;
  final double elevation;
  final bool _centreTitle;
  WebAppBar({
    double? height,
    Color? color,
    double? elevation,
    bool? centerTitle,
    Drawer? drawer,
    this.leading,
    this.title,
    this.subTitle,
    this.trailing,
  })  : height = height ?? 72.0,
        color = color,
        elevation = elevation ?? 8.0,
        _centreTitle = centerTitle ?? true;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height,
          maxHeight: height,
        ),
        child: Container(
          color: color ?? Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildLeading(leading),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildTitle(title),
                ),
              ),
              _buildTrailling(trailing)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeading(Widget? leading) {
    return leading ?? Container();
  }

  Widget _buildTitle(Widget? title) {
    return _centreTitle
        ? Center(
            child: title ?? Container(),
          )
        : title ?? Container();
  }

  Widget _buildTrailling(Widget? trailling) {
    return trailling ?? Container();
  }
}
