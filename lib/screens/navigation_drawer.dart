import 'package:flutter/material.dart';
import 'package:tinggit/screens/people.dart';
import 'package:tinggit/screens/root_page.dart';
import 'custom_navigation_drawer_l.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white30,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0), // Adjusted padding
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 10), // Reduced space
              DrawerItem(
                name: 'Profile',
                icon: Icons.account_box_rounded,
                onPressed: () => onItemPressed(context, index: 1),
              ),
              DrawerItem(
                name: 'My Favourites',
                icon: Icons.favorite_outline,
                onPressed: () => onItemPressed(context, index: 3),
              ),
              const SizedBox(height: 10), // Adjusted space
              const Divider(thickness: 1, height: 1, color: Colors.grey), // Adjusted divider height
              DrawerItem(
                name: 'Settings',
                icon: Icons.settings,
                onPressed: () => onItemPressed(context, index: 4),
              ),
              DrawerItem(
                name: 'Log out',
                icon: Icons.logout,
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
      default:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget() {
    const url = 'https://www.istockphoto.com/vector/grand-canyon-national-park-poster-with-canyon-walls-and-colorado-river-vector-gm1857065894-552298436';
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/images/avatar1.png"),
        ),
        const SizedBox(width: 10), // Reduced space
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Person name',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 1), // Reduced space
            Text(
              'person@email.com',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
