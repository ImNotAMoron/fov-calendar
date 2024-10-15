import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urnik/weekTools.dart';

import 'main.dart';

class DayPicker extends StatelessWidget {

  final PageController pageController;
  const DayPicker({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    if(!appState.isPageControllerUsed || !pageController.hasClients) return Text("Loading...");

    int currentPage = (pageController.page! - pageController.initialPage).toInt();
    final mondayDate = findMonday(appState.pickedDay);
    List<Widget> dayWidgets = [];
    final theme = Theme.of(context);
    for (int i = 0; i < 7; i++) {
      final currentDate = mondayDate.add(Duration(days: i));
      dayWidgets.add(CircularButton(
          isActive: i == appState.pickedDay.difference(mondayDate).inDays,
          dayNumber: currentDate.day,
          onPressed: () => {
            pageController.animateToPage((pageController.page! - appState.pickedDay.difference(currentDate).inDays).toInt(), duration: const Duration(milliseconds: 1), curve: Curves.easeInOut)
          }));
      // dayWidgets.add(Container(
      //   width: 45,
      //   height: 45,
      //   decoration: BoxDecoration(
      //     color: Colors.red.withOpacity(i == appState.currentDay ? 0.5 : 0.25),
      //     // border color
      //     shape: BoxShape.circle,
      //   ),
      //   // child: TextButton(
      //   //   style: ElevatedButton.styleFrom(
      //   //     minimumSize: Size(10, 10), // width, height
      //   //   ),
      //   //   onPressed: () {
      //   //     appState.setCurrentDay(i);
      //   //   },
      //   //   child: Text("${currentDate.day}"),
      //   // ),
      //   child: CircularButton(),
      // ));
      if (i != 6) dayWidgets.add(SizedBox(width: 10));
    }
    // final style = theme
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dayWidgets,
    );
  }
}

class CircularButton extends StatelessWidget {
  final bool isActive;
  final int dayNumber;
  final VoidCallback onPressed;

  const CircularButton(
      {super.key,
      required this.isActive,
      required this.dayNumber,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle =
        theme.textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold);

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onPressed,
      child: Container(
        width: 35, // Set the width of the button
        height: 35, // Set the height of the button
        decoration: BoxDecoration(
          color: isActive ? theme.colorScheme.secondaryContainer : null,
          shape: BoxShape.circle,
          border: Border.all(
            color: theme.colorScheme.primary,
            // Change the color to your preference
            width: 2.0, // Set the width of the border
          ),
        ),
          child: Center(
            child: FittedBox(
              // This ensures the text scales within the button
              child: Text(
                "$dayNumber",
                style: textStyle,
              ),
            ),
        ),
      ),
    );
  }
}
