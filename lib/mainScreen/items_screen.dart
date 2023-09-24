import 'package:flutter/material.dart';
import 'package:seller_app/uploadScreens/items_upload_screen.dart';
import 'package:seller_app/widgets/app_drawer.dart';
import 'package:seller_app/widgets/text_widget_header.dart';

import '../global/global.dart';
import '../model/menus.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key, required this.model});

  final Menus? model;

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.cyan,
              Colors.amber,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          )),
        ),
        title: Text(
          sharedPreferences!.getString("name")!,
          style: const TextStyle(fontSize: 30, fontFamily: "Lobster"),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.post_add,
              color: Colors.cyan,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const ItemsUploadScreen()));
              print(widget.model!.menuID);
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate:
                TextWidgetHeader(title: "My ${widget.model!.menuTitle} item"),
          ),
        ],
      ),
    );
  }
}
