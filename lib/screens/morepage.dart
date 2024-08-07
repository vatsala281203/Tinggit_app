import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tinggit/screens/birth_announcements.dart';
import 'package:tinggit/screens/jobreffrals.dart';
import 'custom_navigation_drawer_l.dart';
import '../models/model.dart' as custom_model;
import '../models/model.dart';
import 'navigation_drawer.dart';
import 'package:http/http.dart' as http;// Import the NavigationDrawer

class SamplePost extends StatelessWidget {
  final ImageProvider profileImage;
  final String username;
  final ImageProvider postImage;
  final String caption;

  final List<String> items1 = [
    'Job Referral',
    'Find Associates',
    'Organization Tree',
    'Support Directory',
    'Internal Jobs',
    'Important Links',
  ];

  final List<String> items2 = [
    'Associate Spotlight',
    'Stories',
    'Announcements',
    'New Joiners',
  ];

  final List<String> items3 = [
    'Awards',
    'Accolades',
    'Promotions',
  ];

  final List<String> items4 = [
    'Birth Announcements',
    'Birthday',
    'Work Anniversary',
  ];

  final List<IconData> icons1 = [
    Icons.work,
    Icons.group,
    Icons.work,
    Icons.support,
    Icons.link,
    Icons.info,
  ];

  final List<IconData> icons2 = [
    Icons.star,
    Icons.book,
    Icons.announcement,
    Icons.group_add,
  ];

  final List<IconData> icons3 = [
    Icons.thumb_up,
    Icons.thumb_up,
    Icons.celebration,
  ];

  final List<IconData> icons4 = [
    Icons.cake,
    Icons.card_giftcard,
    Icons.calendar_today,
  ];

  SamplePost({
    super.key,
    required this.profileImage,
    required this.username,
    required this.postImage,
    required this.caption,
  });

  Widget buildGrid(List<String> items, List<IconData> icons) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Padding around the GridView
      child: Container(
        color: Colors.grey[200], // Color of the main container
        padding: const EdgeInsets.all(8.0), // Padding inside the main container
        child: GridView.builder(
          shrinkWrap: true, // Use this to avoid unbounded height error
          physics: const NeverScrollableScrollPhysics(), // To disable GridView scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16.0, // Space between columns
            mainAxisSpacing: 16.0, // Space between rows
            childAspectRatio: 1.0, // Aspect ratio to control box size
          ),
          itemCount: items.length, // Number of squares
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle navigation based on item
                if (items[index] == 'Job Referral') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JobReferral(),
                    ),
                  );
                }
                if (items[index] == 'Birth Announcements') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BirthAnnouncements(),
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 5), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // Padding inside each grid item
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        size: 40,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 8),
                      Text(
                        items[index], // Display the item
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Productivity',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        buildGrid(items1, icons1),
        SizedBox(height: 20),
        Text(
          'Our People',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        buildGrid(items2, icons2),
        SizedBox(height: 20),
        Text(
          'Records and Recognition',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        buildGrid(items3, icons3),
        Text(
          'Celebrations',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        buildGrid(items4, icons4),
      ],
    );
  }
}

class Morepage extends StatefulWidget {
  const Morepage({super.key});

  @override
  State<Morepage> createState() => _MorepageState();
}

class _MorepageState extends State<Morepage> {
  List<custom_model.SamplePosts> samplePosts = [];
  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    fetchData();
  }
  // final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _posts = [
    {
      'profileImage': 'assets/images/avatar1.png',
      'username': 'Vikram Thakur',
      'postImage': 'assets/images/post1.webp',
      'caption': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'heading': 'Heading 1',
    },
    {
      'profileImage': 'assets/images/avatar2.png',
      'username': 'Satyam Sahu',
      'postImage': 'assets/images/post2.webp',
      'caption': 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat ',
      'heading': 'Heading 2',
    },
    {
      'profileImage': 'assets/images/avatar1.png',
      'username': 'Himanshu Sharma',
      'postImage': 'assets/images/post1.webp',
      'caption': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'heading': 'Heading 3',
    },
    // Add more post data here
  ];



  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       statusBarColor: Colors.white,
  //       statusBarIconBrightness: Brightness.light,
  //     ));
  //   });
  // }

  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }
//
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 200, // Adjust the width to a reasonable size
                height: 200, // Adjust the height to a reasonable size
              ),
            ),
            SizedBox(height: 40,)
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                Scaffold.of(context).openEndDrawer(); // Opens the end drawer
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar1.png"),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const CustomNavigationDrawerl(), // Assign the drawer
      endDrawer: const CustomNavigationDrawer(), // Assign the end drawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding as needed
                child: Text(
                  "More",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  return SamplePost(
                    profileImage: post['profileImage']!.startsWith('http')
                        ? NetworkImage(post['profileImage']!)
                        : AssetImage(post['profileImage']!) as ImageProvider,
                    username: post['username']!,
                    postImage: post['postImage']!.startsWith('http')
                        ? NetworkImage(post['postImage']!)
                        : AssetImage(post['postImage']!) as ImageProvider,
                    caption: post['caption']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> fetchData() async {
    final url = Uri.parse('https://gatewayapi.eela.tech/api/v1/posts?userId=43&app=1234560'); // Replace with your API URL

    // Set up the headers including the Bearer token
    final headers = {
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNDlhY2ZmMmE2YmVmOWVlZTIwMjQ0NDdjMTg5ZWE0N2U3ZGU5YmYwODhlZGFkNDg0MTZjMGNjMTQzNzlhYzAxYzIzZDUzNzJhYWZkY2ZiZTEiLCJpYXQiOjE3MjIyMzA2OTAuOTkxMTcxLCJuYmYiOjE3MjIyMzA2OTAuOTkxMTc0LCJleHAiOjE3NTM3NjY2OTAuOTg3MzI5LCJzdWIiOiI0MyIsInNjb3BlcyI6W119.V3M0g8BFiXLK1sOlzZU8Nw0UNkPfL8qa1SIyNbYZ41oW_0L1TArElX6d1ho4LO_rX7V_SXyxFu4MK5fbIfFwI3lBZOltLvizz-8Y_5l8cNbxYLZdAVn0N6uWnVI9Z4lDJnTCfTDrKqbUStRCNAuxR14h5ggqGPWTVlUo0mrvnA8XzwyMmmHrE9DQmxEBgBbjgh55YpOstINGMk9AbYUSXZ-sqvHwqpQQaLLbzJLoAvuUp9sSKZXUa2Xzru3GlDVYAUOS4GvRg46ED36ZC1ZYmCrb3T58WqWIC3VMpnXbj6eWSDD3ksIh2ouu7eO_KuAcUWoynKwD0pNpxN4eTwSCGDn3H8O0KA8Zs_JReuQiTy2sAqanVsSeB9q5gVqGIBvq14-RN3zSWpxo13CGxx2D0TB980l75FOJuDMvNhwj12ljTGgCMlinzbaMoC_YPBfO1bEe0WUWZwYE7L_n0sxjYYjlKM3bXjaUD-EciUxiO7AnCIJaQLSm1xQ93KYBC0Fo_I60cWaxQ4VkXrydndrffjK36k6u4HVBslBH7rHFiu5c6k4ISOHjM7jX0N7StiYqZTrMBgip9tWQVpVx0UdBmttf3i5kXtPr2DtM-0BTt_nqapRMYKgeD8Q-ls8JgZTLzbB74d-lWiWX3fASZ78uAFa_cwF8WXjOF5nbktF0R_c',  // Replace with your Bearer token
      'Content-Type': 'application/json',           // Adjust the Content-Type if necessary
    };

    // Set up query parameters if needed
    final params = {
      'app': '1234560',  // Replace with your query parameters
    };

    // Make the GET request
    final response = await http.get(url.replace(queryParameters: params), headers: headers);

    // Check for a successful response
    if (response.statusCode == 200) {
      // Parse the response body
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        samplePosts = data.map((json) => custom_model.SamplePosts.fromJson(json)).toList();
        isLoading = false;
      });
    } else {
      // Handle error
      setState(() {
        isLoading = false;
      });
      print('Failed to load data: ${response.statusCode}');
    }
  }
}
