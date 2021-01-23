import 'package:flutter/material.dart';
import 'package:pr0gramm/widget/header_image/header_image.dart';
import 'package:pr0gramm/widget/image_subbar.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

class ItemPage extends StatelessWidget {
  final Item item;

  const ItemPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          HeaderImage(item: item),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ImageSubBar(item: item),
          ),
        ],
      ),
    );
  }
}
