import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:urnik/dayPicker.dart';
import 'package:urnik/eventList.dart';
import 'package:urnik/news.dart';
import 'package:urnik/parser.dart';
import 'package:urnik/settings.dart';
import 'package:urnik/weekPicker.dart';
import 'package:flutter/material.dart';
import 'package:localstore/localstore.dart';

final PageController pageController = PageController(initialPage: 4000);

const List<String> allGroups = <String>[
  "01---1-letnik-VS-Informacijski-sistemi-Redni",
  "02---1-letnik-VS-Informacijski-sistemi-Izredni",
  "03---1-letnik-VS-Kadrovsko-izobrazevalni-sistemi-Redni",
  "04---1-letnik-VS-Kadrovsko-izobrazevalni-sistemi-Izredni",
  "05---1-letnik-VS-Inzenirnig-poslovnih-sistemov-Redni",
  "06---1-letnik-VS-Inzenirnig-poslovnih-sistemov-Izredni",
  "07---1-letnik-VS-Krizni-management-Izredni",
  "07---1-letnik-VS-Management-v-sportu-Izredni",
  "07---2-letnik-VS-Informacijski-sistemi-Redni",
  "08---2-letnik-VS-Informacijski-sistemi-Izredni",
  "09---2-letnik-VS-Kadrovsko-izobrazevalni-sistemi-Redni",
  "10---2-letnik-VS-Kadrovsko-izobrazevalni-sistemi-Izredni",
  "11---2-letnik-VS-Inzenirnig-poslovnih-sistemov-Redni",
  "12---2-letnik-VS-Inzenirnig-poslovnih-sistemov-Izredni",
  "13---2-letnik-VS-Krizni-management-Izredni",
  "13---2-letnik-VS-Management-v-sportu-Izredni",
  "13---3-letnik-VS-Informacijski-sistemi-Redni",
  "14---3-letnik-VS-Informacijski-sistemi-Izredni",
  "15---3-letnik-VS-Kadrovsko-izobrazevalni-sistemi-Redni",
  "16---3-letnik-VS-Kadrovsko-izobrazevalni-sistemi-Izredni",
  "17---3-letnik-VS-Inzenirnig-poslovnih-sistemov-Redni",
  "18---2-letnik-VS-Management-v-sportu-Izredni",
  "18---3-letnik-VS-Inzenirnig-poslovnih-sistemov-Izredni",
  "18---3-letnik-VS-Krizni-management-Izredni",
  "18---3-letnik-VS-Management-v-sportu-Izredni",
  "19---1-letnik-UNI-Informacijski-sistemi-Redni",
  "20---1-letnik-UNI-Informacijski-sistemi-Izredni",
  "21---1-letnik-UNI-Kadrovsko-izobrazevalni-sistemi-Redni",
  "22---1-letnik-UNI-Kadrovsko-izobrazevalni-sistemi-Izredni",
  "23---1-letnik-UNI-Inzenirnig-poslovnih-sistemov-Redni",
  "24---1-letnik-UNI-Inzenirnig-poslovnih-sistemov-Izredni",
  "25---2-letnik-UNI-Informacijski-sistemi-Redni",
  "26---2-letnik-UNI-Informacijski-sistemi-Izredni",
  "27---2-letnik-UNI-Kadrovsko-izobrazevalni-sistemi-Redni",
  "28---2-letnik-UNI-Kadrovsko-izobrazevalni-sistemi-Izredni",
  "29---2-letnik-UNI-Inzenirnig-poslovnih-sistemov-Redni",
  "30---2-letnik-UNI-Inzenirnig-poslovnih-sistemov-Izredni",
  "31---3-letnik-UNI-Informacijski-sistemi-Redni",
  "---3-letnik-UNI-Informacijski-sistemi-Izredni",
  "33---3-letnik-UNI-Kadrovsko-izobrazevalni-sistemi-Redni",
  "34---3-letnik-UNI-Kadrovsko-izobrazevalni-sistemi-Izredni",
  "35---3-letnik-UNI-Inzenirnig-poslovnih-sistemov-Redni",
  "36---3-letnik-UNI-Inzenirnig-poslovnih-sistemov-Izredni",
  "37---1-letnik-MAG-Informacijski-sistemi-Redni",
  "38---1-letnik-MAG-Informacijski-sistemi-Izredni",
  "39---1-letnik-MAG-Kadrovsko-izobrazevalni-sistemi-Redni",
  "40---1-letnik-MAG-Kadrovsko-izobrazevalni-sistemi-Izredni",
  "41---1-letnik-MAG-Managament-zdravstva-socialno-varstvo-Redni",
  "42---1-letnik-MAG-Managament-zdravstva-socialno-varstvo-Izredni",
  "43---1-letnik-MAG-Inzenirnig-poslovnih-sistemov-Redni",
  "44---1-letnik-MAG-Inzenirnig-poslovnih-sistemov-Izredni",
  "45---2-letnik-MAG-Informacijski-sistemi-Redni",
  "46---2-letnik-MAG-Informacijski-sistemi-Izredni",
  "47---2-letnik-MAG-Kadrovsko-izobrazevalni-sistemi-Redni",
  "48---2-letnik-MAG-Kadrovsko-izobrazevalni-sistemi-Izredni",
  "49---2-letnik-MAG-Managament-zdravstva-socialno-varstvo-Redni",
  "50---2-letnik-MAG-Managament-zdravstva-socialno-varstvo-Izredni",
  "51---2-letnik-MAG-Inzenirnig-poslovnih-sistemov-Redni",
  "52---2-letnik-MAG-Inzenirnig-poslovnih-sistemov-Izredni",
  "53---1-letnik-DR-Poslovno-delovni-sistemi-Izredni",
  "54---1-letnik-DR-Kadrovsko-izobrazevalni-sistemi-Izredni",
  "55---1-letnik-DR-Informacijski-sistemi-Izredni",
  "56---2-letnik-DR-Poslovno-delovni-sistemi-Izredni",
  "57---2-letnik-DR-Kadrovsko-izobrazevalni-sistemi-Izredni",
  "58---2-letnik-DR-Informacijski-sistemi-Izredni"
];

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    News(),
    MyHomePage(
      title: 'kjhlkjsdf',
      pageController: pageController,
    ),
    Settings()
  ];
  final areEventsLoaded = false;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyAppState extends ChangeNotifier {
  DateTime today = DateTime.now();
  DateTime pickedDay = DateTime.now();
  DateTime currentMonday = DateTime.now();
  var currentNavigationIndex = 0;
  var currentGroup = allGroups[0];
  var currentDay = 0;
  var isPageControllerUsed = false;
  var isEventsReady = false;

  void setEventsReady(bool isER) {
    isEventsReady = isER;
    notifyListeners();
  }

  List<Event> events = [];
  List<Event> currentEvents = [];
  final db = Localstore.instance;

  String savedGroup = "";
  List<Event> savedEvents = [];
  bool showInitText = false;

  bool areSettingsReady = false;


  Future<void> saveSettings(String group) async {
    final fetchedLines = await fetchEventLines(group);
    await db.collection('settings').doc("settings").set({
      'group': group,
      'event-lines': fetchedLines
    });

    savedGroup = group;

    showInitText = false;
    areSettingsReady = false;
    setEventsReady(false);

    notifyListeners();
  }

  Future<void> getSettings() async {
    if(areSettingsReady) return;
    areSettingsReady = true;
    final data = await db.collection('settings').doc("settings").get();
    if (data == null || data["group"] == null || data["group"] == null) {
      setShowInitText(true);
      return;
    }
    // TODO: Fix data["group"]
    List<String> eventLines = List<String>.from(data["event-lines"] as List);
    final newEvents = await parseEvents(eventLines);
    savedGroup = data["group"];
    setEvents(newEvents);
    setEventsReady(true);
    notifyListeners();
  }


  void setShowInitText(bool show) {
    showInitText = show;
  }

  void setPageControllerUsed(bool state) {
    isPageControllerUsed = state;
    notifyListeners();
  }

  void setPickedDay(DateTime day) {
    pickedDay = day;
    notifyListeners();
  }



  void setCurrentMonday(DateTime dt) {
    currentMonday = dt;
    notifyListeners();
  }

  void setCurrentDay(int day) {
    currentDay = day;
    notifyListeners();
  }

  void setEvents(List<Event> newEvents) {
    events = newEvents;
    currentEvents = newEvents;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Center(child: Text("FOV Calendar")),
            ),
            bottomNavigationBar: Obx(
              () => NavigationBar(
                onDestinationSelected: (index) {
                  controller.selectedIndex.value = index;
                },
                selectedIndex: controller.selectedIndex.value,
                destinations: const [
                  NavigationDestination(
                      icon: Icon(Icons.newspaper), label: "News"),
                  NavigationDestination(
                      icon: Icon(Icons.calendar_month), label: "Calendar"),
                  NavigationDestination(
                      icon: Icon(Icons.settings), label: "Settings"),
                ],
              ),
            ),
            body:
                // Obx(() => controller.screens[controller.selectedIndex.value])),
            Obx(() => IndexedStack(
              index: controller.selectedIndex.value,
              children: controller.screens,
            ))),

      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title, required this.pageController});

  final String title;
  final PageController pageController;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DateTime _date = DateTime.now();
  DateTime _firstDate = DateTime(0);
  DateTime _secondDate = DateTime(0);
  List<Event> _events = [];

  List<Event> getCurrentEvents() {
    List<Event> result = [];
    for (final event in _events) {
      if (event.dt.month == _date.month &&
          event.dt.day == _date.day &&
          event.dt.year == _date.year) result.add(event);
    }
    return result;
  }


  void _setDate(DateTime newDate) {
    setState(() {
      _date = newDate;
      List<Widget> eventWidgets = [];
      for (final event in getCurrentEvents()) {
        eventWidgets.add(Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(event.summary),
                Text(event.dt.toString()),
              ],
            ),
          ),
        ));
      }
    });
  }

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if(!appState.isEventsReady) appState.getSettings();

    _setDate(_date);
    Future<void> OpenDatePicker() async {
      final picked = await showDatePicker(
          context: context,
          initialDate: _date,
          firstDate: _firstDate,
          lastDate: _secondDate);
      if (picked != null && picked != _date) {
        _setDate(picked);
      }
    }

    if (appState.showInitText) {
      return Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Please choose ur group"),
            DropdownButtonExample()
          ],
        )),
      );
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          WeekPicker(pageController: pageController),
          DayPicker(pageController: pageController),
          EventList(pageController: pageController)
        ],
      ),
    );
  }
}

/*

 ElevatedButton(
              onPressed: OpenDatePicker,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(formatter.format(_date)),
              ),
            ),
            Column(
              children: _eventWidgets,
            )

 */
