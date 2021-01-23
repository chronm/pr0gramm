import 'package:flutter/material.dart';
import 'package:pr0gramm/widget/item_grid/item_grid.dart';

import 'widget/pr0gramm_drawer.dart';

class ItemsPage extends StatefulWidget {
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pr0gramm'),
      ),
      drawer: Pr0grammDrawer(),
      body: ItemGrid(),
    );
  }
}
