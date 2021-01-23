import 'package:flutter/material.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

class HeaderImage extends StatelessWidget {
  final Item item;

  const HeaderImage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: item.width > MediaQuery.of(context).size.width ? null : item.height.floorToDouble(),
      width: item.width < MediaQuery.of(context).size.width ? null : MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Image.network(
              item.image,
            ),
          ),
        ],
      ),
    );
  }
}
