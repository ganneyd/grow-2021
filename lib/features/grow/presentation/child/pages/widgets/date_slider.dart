import 'package:flutter/material.dart';

///Widget that displays the dates in a left to right horizontal manner
class DateSlider extends StatefulWidget {
  ///
  DateSlider({required this.dateCallback, Key? key}) : super(key: key);

  DateCallback dateCallback;
  @override
  _DateSliderState createState() => _DateSliderState();
}

class _DateSliderState extends State<DateSlider> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  int numberOfDays() =>
      (DateTime.now()
          .difference(DateTime(
            DateTime.now().year,
          ))
          .inDays) +
      (7 - DateTime.now().weekday);

  List<Widget> dateWidgets = <Widget>[];
  @override
  Widget build(BuildContext context) {
    dateWidgets = List<Widget>.generate(numberOfDays(), (int index) {
      DateTime todaysDate =
          DateTime(DateTime.now().year).add(Duration(days: index));
      return Container(
        decoration: BoxDecoration(
            color: todaysDate == DateTime.now()
                ? Theme.of(context).primaryColor
                : Theme.of(context).cardColor),
        child: Column(
          children: [
            Text(getMonth(todaysDate.month)),
            Text(' ${todaysDate.day}'),
          ],
        ),
      );
    });
    return SliverAnimatedList(
        initialItemCount: dateWidgets.length,
        itemBuilder: (context, index, animation) {
          return dateWidgets[index];
        });
  }

  String getMonth(month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return ' ';
    }
  }
}

typedef DateCallback = void Function(int index);
