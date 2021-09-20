import 'package:flutter/material.dart';

///Widget that displays the dates in a left to right horizontal manner
class DateSlider extends StatefulWidget {
  ///
  DateSlider({required this.dateCallback, required this.numberOfDays, Key? key})
      : super(key: key);

  final int numberOfDays;

  DateCallback dateCallback;
  @override
  _DateSliderState createState() => _DateSliderState();
}

class _DateSliderState extends State<DateSlider> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    currentIndex = widget.numberOfDays - 1;
    _pageController =
        PageController(initialPage: currentIndex, viewportFraction: .25);
    super.initState();
  }

  List<Widget> dateWidgets = <Widget>[];
  @override
  Widget build(BuildContext context) {
    dateWidgets = List<Widget>.generate(widget.numberOfDays, (int index) {
      final DateTime todaysDate =
          DateTime(DateTime.now().year).add(Duration(days: index + 1));

      return Padding(
        padding: index == currentIndex ? EdgeInsets.all(4) : EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: (index == currentIndex)
                ? Colors.white
                : const Color.fromRGBO(144, 223, 43, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Center(
                    child: Text(
                  getMonth(todaysDate.month),
                  style: TextStyle(
                      color:
                          index == currentIndex ? Colors.black : Colors.white),
                )),
              ),
              Flexible(
                  child: Center(
                      child: Text(
                ' ${todaysDate.day}',
                style: TextStyle(
                    color: index == currentIndex ? Colors.black : Colors.white),
              ))),
            ],
          ),
        ),
      );
    });

    return PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
          widget.dateCallback(index);
        },
        children: dateWidgets);
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
