import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/store/cubit/store_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/store/cubit/store_state.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/store/sub_views/sub_views_bucket.dart';

///Displays the store
class StorePage extends StatefulWidget {
  ///Constructor
  const StorePage() : super(key: const Key('child-store-page'));

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoreCubit>(
        create: (_) => StoreCubit(),
        child: BlocConsumer<StoreCubit, StoreState>(
          listener: (BuildContext context, StoreState state) {},
          builder: (BuildContext context, StoreState state) {
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
                  title: const Text('Store'),
                  centerTitle: true,
                ),
                body: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      CupertinoSlidingSegmentedControl<int>(
                          padding: EdgeInsets.zero,
                          thumbColor: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor,
                          groupValue: currentIndex,
                          children: <int, Widget>{
                            0: _getSegmentedControlText(
                                title: 'Backgrounds',
                                index: 0,
                                color: Theme.of(context).primaryColor),
                            1: _getSegmentedControlText(
                                title: 'Accessories',
                                index: 1,
                                color: Theme.of(context).primaryColor),
                          },
                          onValueChanged: (int? index) {
                            setState(() {
                              _pageController.animateToPage(index ?? 0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            });
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: PageView(
                          onPageChanged: (int index) =>
                              setState(() => currentIndex = index),
                          controller: _pageController,
                          children: const <Widget>[
                            Backgrounds(),
                            Clothing(),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          },
        ));
  }

  Text _getSegmentedControlText(
      {required String title, required int index, required Color color}) {
    return Text(title,
        style: TextStyle(color: currentIndex == index ? color : Colors.white));
  }
}
