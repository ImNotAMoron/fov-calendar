import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:urnik/weekTools.dart';

import 'main.dart';

DateTime findSundayOfTheWeek(DateTime currentDate) {
  // Calculate the difference in days from Monday (Monday is considered as 1)
  int daysToSubtract = DateTime.sunday - currentDate.weekday;

  // Subtract the days to get the Monday of the current week
  return currentDate.add(Duration(days: daysToSubtract));
}

class WeekPicker extends StatelessWidget {
  final DateFormat formatter = DateFormat('MMM dd');
  final leftIcon = Icons.arrow_left;
  final rightIcon = Icons.arrow_right;
  final PageController pageController;

  WeekPicker({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();

    Future<void> openDatePicker() async {
      final picked = await showDatePicker(
          context: context,
          initialDate: appState.pickedDay,
          firstDate: DateTime(0),
          lastDate: appState.pickedDay.add(const Duration(days: 365)));
      if (picked != null && picked != appState.pickedDay) {
        pageController.jumpToPage(pageController.page!.toInt() + picked.difference(appState.pickedDay).inDays + 1);
      }
    }

    if (!appState.isPageControllerUsed || !pageController.hasClients)
      return const Text("Loading...");
    final theme = Theme.of(context);
    final style =
        theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold);
    appState.currentMonday = findMonday(appState.currentMonday);
    final yearStyle = theme.textTheme.labelSmall;

    final currentMonday = findMonday(appState.pickedDay);
    final currentSunday = currentMonday.add(const Duration(days: 6));

    void addWeek() {
      pageController.animateToPage((pageController.page! + 7).toInt(),
          duration: const Duration(microseconds: 1), curve: Curves.linear);
    }

    void subtractWeek() {
      pageController.animateToPage((pageController.page! - 7).toInt(),
          duration: const Duration(microseconds: 1), curve: Curves.linear);
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton.filledTonal(onPressed: subtractWeek, icon: Icon(leftIcon)),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
            child: Container(
              alignment: Alignment.center,
              width: 150,
              child: InkWell(
                onTap: () {
                  openDatePicker();
                },
                child: Column(
                  children: [
                    Text(
                      currentMonday.year == currentSunday.year
                          ? "${currentMonday.year}"
                          : "${currentMonday.year} - ${currentSunday.year}",
                      style: yearStyle,
                    ),
                    Text(
                      "${formatter.format(currentMonday)} - ${formatter.format(findSundayOfTheWeek(currentSunday))}",
                      style: style,
                    ),
                    const SizedBox(height: 10)
                    // Text("${appState.today.isAfter(currentMonday) && appState.today.isBefore(currentSunday) ? "This i"}", style: yearStyle,),
                  ],
                ),
              ),
            ),
          ),
          IconButton.filledTonal(onPressed: addWeek, icon: Icon(rightIcon)),
        ],
      ),
    );
  }
}
