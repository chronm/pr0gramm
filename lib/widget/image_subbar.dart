import 'package:flutter/material.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

import 'benis_button/benis_button.dart';
import 'collection_button/collection_button.dart';
import 'stelz_button/stelz_button.dart';

class ImageSubBar extends StatelessWidget {
  final Item item;

  const ImageSubBar({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              BenisButton.up(
                onTap: () {},
                target: VoteTarget.ITEM,
                id: item.id,
              ),
              BenisButton.down(
                onTap: () {},
                target: VoteTarget.ITEM,
                id: item.id,
              ),
              CollectionButton(
                onTap: () {},
                id: item.id,
              ),
            ],
          ),
        ),
        Container(
          color: Theme.of(context).textTheme.bodyText1.color,
          height: 20,
          width: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          item.user,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: colorForUserMark[item.mark],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${item.up - item.down} Benis",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: StelzButton(
            id: item.id,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
