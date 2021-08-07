import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../list_generator.dart';

///
class Backgrounds extends StatelessWidget {
  ///
  const Backgrounds() : super(key: const Key('child-store-background-page'));

  @override
  Widget build(BuildContext context) {
    final Map<String, List<StoreItem>> map = <String, List<StoreItem>>{
      'Famous Places': <StoreItem>[
        StoreItem(
          display: Image.asset('assets/avatar/male/male.png'),
          isLock: true,
          name: 'Jake From Da Faam',
        ),
        StoreItem(
            display: Image.asset('assets/avatar/female/female.png'),
            isLock: false,
            name: 'name',
            price: 9.00),
        StoreItem(
          display: Image.asset('assets/avatar/male/male.png'),
          isLock: false,
          name: 'name',
        ),
      ],
      'Theme Parks': <StoreItem>[
        StoreItem(
            display: Image.asset('assets/avatar/female/female.png'),
            isLock: true,
            name: 'name',
            price: 4.99),
        StoreItem(
          display: Image.asset('assets/avatar/male/male.png'),
          isLock: false,
          name: 'name',
        ),
        StoreItem(
            display: Image.asset('assets/avatar/female/female.png'),
            isLock: true,
            name: 'name',
            price: 5.00),
      ],
    };

    return ListGenerator(
      items: map,
      maxCrossAxisExtent: MediaQuery.of(context).size.width,
    );
  }
}
