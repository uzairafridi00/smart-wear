import '../../widgets/app_bar/bottom_navbar.dart';
import 'widget/favorites_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/presentation/contact_support_page/contact_support_page.dart';

import 'package:smart_wear/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        backgroundColor: ColorConstant.whiteA700,
        body: Text('Favorites'),
      ),
    );
  }
}
