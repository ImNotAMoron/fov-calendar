import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:urnik/main.dart';
import 'package:urnik/parser.dart';
import 'package:urnik/weekTools.dart';

class EventList extends StatelessWidget {
  const EventList({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final DateFormat formatter = DateFormat('HH:mm');

    var appState = context.watch<MyAppState>();
    List<Widget> widgets = [];
    final current =
        appState.currentMonday.add(Duration(days: appState.currentDay));
    for (final event in appState.currentEvents) {
      if (current.month == event.dt.month &&
          current.day == event.dt.day &&
          current.year == event.dt.year) {
        widgets.add(EventCard(event: event, formatter: formatter));
      }
    }


    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (pageController.hasClients != appState.isPageControllerUsed) {
        print("HasClients: ${pageController.hasClients}");
        print("isPageControllerUsed: ${appState.isPageControllerUsed}");

        // final curPage = pageController.page! - pageController.initialPage;
        // final pageDay = appState.today.add(Duration(days: curPage.toInt()));
        // final dif = curPage.toInt() + appState.pickedDay.difference(pageDay).inDays;
        // pageController.jumpToPage(pageController.page!.toInt() + dif);

        appState.setPageControllerUsed(pageController.hasClients);
      }
    });

    return Expanded(
      child: PageView.builder(
        onPageChanged: (index) {
          final days = (index - pageController.initialPage).toInt();
          appState.setPickedDay(appState.today.add(Duration(days: days)));
        },
        controller: pageController,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                      hasScrollBody: false,
                      child: EventPage(
                          currentDate: appState.today.add(Duration(
                              days: index - pageController.initialPage)),
                          pageController: pageController))
                ],
              ));
        },
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
    required this.formatter,
  });

  final Event event;
  final DateFormat formatter;

  @override
  Widget build(BuildContext context) {
    print("Rebuilding eventList");
    final theme = Theme.of(context);
    final summaryStyle = theme.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSecondaryContainer);
    final infoStyle = theme.textTheme.bodyMedium!.copyWith();
    return Card(
        color: theme.colorScheme.secondaryContainer,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.summary, style: summaryStyle),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(TextSpan(
                  style: infoStyle,
                  children: [
                    const WidgetSpan(child: Icon(Icons.access_time_filled, size: 18,)),
                    const WidgetSpan(child: SizedBox(width: 5)),
                    TextSpan(text: formatter.format(event.dt))
                  ],
                )),
                const SizedBox(
                  height: 5,
                ),
                Text.rich(TextSpan(
                  style: infoStyle,
                  children: [
                    const WidgetSpan(child: Icon(Icons.location_on, size: 18,)),
                    const WidgetSpan(child: SizedBox(width: 5)),
                    TextSpan(text: event.location)
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}

/*
    final current = appState.currentMonday.add(
        Duration(days: appState.currentDay));
 */

class EventPage extends StatelessWidget {
  const EventPage(
      {super.key, required this.currentDate, required this.pageController});

  final DateTime currentDate;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final nctStyle =
        theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold);
    final partyStyle = theme.textTheme.displayMedium!.copyWith();

    var appState = context.watch<MyAppState>();

    List<Widget> widgets = [];
    final DateFormat formatter = DateFormat('HH:mm');
    DateTime prevTime = DateTime(0);
    for (final event in appState.currentEvents) {

      if (currentDate.month == event.dt.month &&
          currentDate.day == event.dt.day &&
          currentDate.year == event.dt.year) {
        if(prevTime.year != 0) {
          final minutesDifference = event.dt.difference(prevTime).inMinutes - 150;
          widgets.add(Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
            child: Text(generateBreakText(minutesDifference), style: TextStyle(color: theme.colorScheme.secondary),),
          ));
        }
        widgets.add(EventCard(event: event, formatter: formatter));
        prevTime = event.dt;
      }
    }
    final int dayDifference =
        (appState.today.difference(appState.pickedDay)).inDays;
    if (dayDifference != 0 && widgets.isNotEmpty) {
      widgets.add(Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
          child: ElevatedButton(
              onPressed: () => {
                    pageController
                        .jumpToPage(pageController.page!.toInt() + dayDifference)
                  },
              child: const Text("Jump back to today")),
        ),
      ));
    }
    if (widgets.isNotEmpty) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
    }

    final ends = dayDifference == 0
        ? const Text("")
        : ElevatedButton(
            onPressed: () => {
                  pageController
                      .jumpToPage(pageController.page!.toInt() + dayDifference)
                },
            child: const Text("Jump back to today"));

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "No class today",
        style: nctStyle,
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        "🎉",
        style: partyStyle,
      ),
      const SizedBox(
        height: 20,
      ),
      ends
    ]);
  }
}
