import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final style = theme.textTheme.displayMedium!.copyWith(
    //   color: theme.colorScheme.onPrimary,
    // );
    final style = theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500);
    var appState = context.watch<MyAppState>();
    appState.setPageControllerUsed(false);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Group:", style: style),
          SizedBox(height: 10,),
          DropdownButtonExample(),
        ],
      ),
    );
  }
}


class DropdownButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Padding(
      padding: const EdgeInsets.all(0),
      child: DropdownMenu<String>(
        initialSelection: appState.savedGroup,
        onSelected: (String? value) {
          appState.saveSettings(value!);
        },
        width: MediaQuery.of(context).size.width - 32,
        menuStyle: MenuStyle(
          alignment: Alignment.bottomLeft,
          maximumSize:
          WidgetStatePropertyAll(Size.fromHeight(MediaQuery.of(context).size.height / 2)),
        ),
        dropdownMenuEntries: allGroups.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}
