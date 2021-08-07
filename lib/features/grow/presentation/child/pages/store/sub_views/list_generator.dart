import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListGenerator extends StatelessWidget {
  ///
  const ListGenerator(
      {required Map<String, List<StoreItem>> items,
      double maxCrossAxisExtent = 300})
      : _items = items,
        _maxCrossAxisExtent = maxCrossAxisExtent,
        super(key: const Key('list-generator'));
  final Map<String, List<StoreItem>> _items;
  final double _maxCrossAxisExtent;
  @override
  Widget build(BuildContext context) {
    final List<String> itemNames = _items.keys.toList();
    final List<List<StoreItem>> widgets = _items.values.toList();
    return ListView.builder(
        itemCount: itemNames.length,
        itemBuilder: (BuildContext context, int nameIndex) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30 / 2),
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(41, 61, 55, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    itemNames[nameIndex],
                    style: Theme.of(context).primaryTextTheme.headline4,
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            GridView.builder(
                clipBehavior: Clip.none,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(30),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: _maxCrossAxisExtent,
                  crossAxisSpacing: 35,
                  mainAxisSpacing: 50,
                ),
                itemCount: widgets[nameIndex].length,
                itemBuilder: (BuildContext context, int index) {
                  return _getMedalStack(
                      context: context, item: widgets[nameIndex][index]);
                })
          ]);
        });
  }

  GestureDetector _getMedalStack(
      {required BuildContext context,
      required StoreItem item,
      bool showHero = false}) {
    return GestureDetector(
      onTap: () => !showHero ? _goToDetailsPage(context, item) : null,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).disabledColor.withOpacity(0.35),
                borderRadius: BorderRadius.circular(15)),
          ),
          Align(
              child: Hero(
            tag: item,
            transitionOnUserGestures: true,
            child: item.display,
          )),
          Visibility(
            visible: item.isLock,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(15)),
              child: const Icon(
                FontAwesomeIcons.lock,
                size: 50,
                color: Colors.black87,
              ),
            ),
          ),
          Visibility(
              visible: !showHero,
              child: Positioned(
                  bottom: -20,
                  left: -10,
                  right: -10,
                  child: MaterialButton(
                    onPressed: item.isLock ? () {} : () {},
                    color: item.isLock
                        ? Colors.black87
                        : Theme.of(context).primaryColor,
                    height: 45,
                    child: Text(
                      item.isLock
                          ? item.price == null
                              ? 'Free'
                              : '\$ ${item.price!.toStringAsFixed(2)}'
                          : 'Redeem',
                      style: item.isLock
                          ? Theme.of(context)
                              .primaryTextTheme
                              .headline6!
                              .copyWith(color: Colors.amber)
                          : Theme.of(context).primaryTextTheme.headline6,
                    ),
                  )))
        ],
      ),
    );
  }

  void _goToDetailsPage(BuildContext context, StoreItem item) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                icon: const Icon(
                  FontAwesomeIcons.arrowCircleLeft,
                  size: 35,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            centerTitle: true,
            title: Text(item.name),
          ),
          body: _getMedalStack(context: context, item: item, showHero: true));
    }));
  }
}

///
class StoreItem {
  ///
  const StoreItem(
      {required this.display,
      required this.isLock,
      required this.name,
      this.price});

  final double? price;
  final String name;
  final Widget display;
  final bool isLock;
}
