import 'package:flutter/material.dart';
import 'package:rakta_blood_donation/notification/acceptedNotification.dart';
import 'package:rakta_blood_donation/notification/notification_list.dart';

class NotificationMain extends StatefulWidget {
  const NotificationMain({Key? key}) : super(key: key);

  @override
  State<NotificationMain> createState() => _NotificationMainState();
}

class _NotificationMainState extends State<NotificationMain> {
  // for switching
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    NotificationList(),
    AcceptedNotifcations(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Blood Requests',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_task_rounded),
              label: 'Accepeted Requests'
            ),
          ],
        ),
      ),
    );
  }
}