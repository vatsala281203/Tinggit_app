import 'package:flutter/material.dart';
import 'package:tinggit/screens/events_page.dart';
import 'package:tinggit/screens/jobreffrals.dart';
import 'package:tinggit/screens/morepage.dart';
import 'package:tinggit/screens/people.dart';
import 'package:tinggit/screens/leader_speak.dart';
import 'package:tinggit/screens/root_page.dart'; // Import the LeaderSpeak page

class CustomNavigationDrawerl extends StatelessWidget {
  const CustomNavigationDrawerl({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 24.0, 0), // Adjusted padding
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 4), // Reduced space
              DrawerItem(
                name: 'Feeds',
                icon: Icons.edit_document,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              DrawerItem(
                name: 'Leader Speak',
                icon: Icons.account_box_rounded,
                onPressed: () => onItemPressed(context, index: 1),
              ),
              DrawerItem(
                name: 'Company with a Heart',
                icon: Icons.favorite,
                onPressed: () => onItemPressed(context, index: 2),
              ),
              DrawerItem(
                name: 'Events',
                icon: Icons.calendar_month,
                onPressed: () => onItemPressed(context, index: 4),
              ),
              const SizedBox(height: 440),
              DrawerItem(
                name: 'More',
                icon: Icons.more,
                onPressed: () => onItemPressed(context, index: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LeaderSpeak()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EventsPage()));
        break;
      case 5:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Morepage()));
        break;
    // Add more cases as needed
      default:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget() {
    const url = 'https://www.istockphoto.com/vector/grand-canyon-national-park-poster-with-canyon-walls-and-colorado-river-vector-gm1857065894-552298436';
    return Row(
      children: [
        const SizedBox(width: 10), // Reduced space
      ],
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onPressed;

  const DrawerItem({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black,
        ),
      ),
      onTap: onPressed,
    );
  }
}
