import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notifications = false;

  void _onNotificationsChange(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: _notifications,
            onChanged: _onNotificationsChange,
            title: const Text(
              'Enable notifications',
            ),
          ),
          CheckboxListTile(
            value: _notifications,
            onChanged: _onNotificationsChange,
            title: const Text(
              'Enable notifications',
            ),
          ),
          ListTile(
            onTap: () => showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1999),
              lastDate: DateTime(2030),
            ),
            title: const Text('What is your birthday?'),
          ),
          ListTile(
            title: Text(
              'Log out(iOS)',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text(
                    'Are you sure?',
                  ),
                  content: const Text(
                    'Plx dont go',
                  ),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('No'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    CupertinoDialogAction(
                      child: const Text('Yes'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Log out(Android)',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text(
                    'Are you sure?',
                  ),
                  content: const Text(
                    'Plx dont go',
                  ),
                  actions: [
                    IconButton(
                      icon: const Text('No'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: const Text('Yes'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
