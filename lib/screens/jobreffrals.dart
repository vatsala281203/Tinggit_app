import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tinggit/screens/referpage.dart';
import 'package:tinggit/screens/savedjobs.dart';
import 'custom_navigation_drawer_l.dart';
import 'jobRefrral2.dart';
import '../models/model.dart' as custom_model;
import '../models/model.dart';
import 'navigation_drawer.dart';
import 'package:http/http.dart' as http;// Import the NavigationDrawer

class SamplePost extends StatelessWidget {
  final ImageProvider profileImage;
  final String username;
  final ImageProvider postImage;
  final String caption;

  const SamplePost({
    super.key,
    required this.profileImage,
    required this.username,
    required this.postImage,
    required this.caption,
  });


  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        "Digital Marketing Manager",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 15), // Adds some space between the text and the button
                      SizedBox(
                        height: 20,
                        width: 75,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            textStyle: TextStyle(fontSize: 12,),
                            backgroundColor: Colors.orangeAccent,
                          ),
                          child: Text("Immediate",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.more_vert_outlined),
                ),
                SizedBox(height: 0,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0), // Add some padding to align with ListTile content
                  child: Row(
                    children: [
                      Icon(Icons.person_2, size: 16, color: Colors.grey), // Example icon
                      SizedBox(width: 4), // Space between icon and text
                      Text(
                        "05 Applications",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(
                    caption,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.1,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                ListTile(
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Aligns the icons and texts to the start
                    children: [
                      Icon(Icons.access_time, size: 16),
                      SizedBox(width: 4),
                      Text('Full Time', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 15),
                      Icon(Icons.location_on, size: 16),
                      SizedBox(width: 4),
                      Text('Noida', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 105),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => referpage()),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'REFER',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}

class JobReferral extends StatefulWidget {
  const JobReferral({super.key});

  @override
  State<JobReferral> createState() => _JobReferralState();
}

class _JobReferralState extends State<JobReferral> {
  List<custom_model.SamplePosts> samplePosts = [];
  bool isLoading = true;


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
            SizedBox(height: 0),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "More / ",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold, // Ensure the text color is set
                      ),
                    ),
                    TextSpan(
                      text: "Job Referrals",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
                        color: Colors.black, // Ensure the text color is set
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 25),
                Text(
                  "Jobs",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 25),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobReferral2(),
                      ),
                    );
                  },
                  child: Text(
                    "My Referrals",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Savedjobs(),
                      ),
                    );
                  },
                  child: Text(
                    "Saved Jobs",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 1),
            Center(
              child: Container(
                width: 340, // Width of the grey line
                child: Stack(
                  alignment: Alignment.centerLeft, // Align to the left
                  children: [
                    // Grey line
                    Divider(
                      color: Colors.grey,
                      thickness: 2,
                      endIndent: 0,
                      indent: 0,
                    ),
                    // Blue line aligned to the left on top of the grey line
                    Container(
                      width: 100.5, // Width of the blue line
                      child: Divider(
                        color: Colors.blue,
                        thickness: 2,
                        endIndent: 24.5, // Set to align left within the 340 width
                        indent: 0,
                      ),
                    ),
                  ],
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
  // Future<void> fetchData() async {
  //   final url = Uri.parse('https://gatewayapi.eela.tech/api/v1/posts?userId=43&app=1234560'); // Replace with your API URL
  //
  //   // Set up the headers including the Bearer token
  //   final headers = {
  //     'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiNDlhY2ZmMmE2YmVmOWVlZTIwMjQ0NDdjMTg5ZWE0N2U3ZGU5YmYwODhlZGFkNDg0MTZjMGNjMTQzNzlhYzAxYzIzZDUzNzJhYWZkY2ZiZTEiLCJpYXQiOjE3MjIyMzA2OTAuOTkxMTcxLCJuYmYiOjE3MjIyMzA2OTAuOTkxMTc0LCJleHAiOjE3NTM3NjY2OTAuOTg3MzI5LCJzdWIiOiI0MyIsInNjb3BlcyI6W119.V3M0g8BFiXLK1sOlzZU8Nw0UNkPfL8qa1SIyNbYZ41oW_0L1TArElX6d1ho4LO_rX7V_SXyxFu4MK5fbIfFwI3lBZOltLvizz-8Y_5l8cNbxYLZdAVn0N6uWnVI9Z4lDJnTCfTDrKqbUStRCNAuxR14h5ggqGPWTVlUo0mrvnA8XzwyMmmHrE9DQmxEBgBbjgh55YpOstINGMk9AbYUSXZ-sqvHwqpQQaLLbzJLoAvuUp9sSKZXUa2Xzru3GlDVYAUOS4GvRg46ED36ZC1ZYmCrb3T58WqWIC3VMpnXbj6eWSDD3ksIh2ouu7eO_KuAcUWoynKwD0pNpxN4eTwSCGDn3H8O0KA8Zs_JReuQiTy2sAqanVsSeB9q5gVqGIBvq14-RN3zSWpxo13CGxx2D0TB980l75FOJuDMvNhwj12ljTGgCMlinzbaMoC_YPBfO1bEe0WUWZwYE7L_n0sxjYYjlKM3bXjaUD-EciUxiO7AnCIJaQLSm1xQ93KYBC0Fo_I60cWaxQ4VkXrydndrffjK36k6u4HVBslBH7rHFiu5c6k4ISOHjM7jX0N7StiYqZTrMBgip9tWQVpVx0UdBmttf3i5kXtPr2DtM-0BTt_nqapRMYKgeD8Q-ls8JgZTLzbB74d-lWiWX3fASZ78uAFa_cwF8WXjOF5nbktF0R_c',  // Replace with your Bearer token
  //     'Content-Type': 'application/json',           // Adjust the Content-Type if necessary
  //   };
  //
  //   // Set up query parameters if needed
  //   final params = {
  //     'app': '1234560',  // Replace with your query parameters
  //   };
  //
  //   // Make the GET request
  //   final response = await http.get(url.replace(queryParameters: params), headers: headers);
  //
  //   // Check for a successful response
  //   if (response.statusCode == 200) {
  //     // Parse the response body
  //     final List<dynamic> data = jsonDecode(response.body);
  //     setState(() {
  //       samplePosts = data.map((json) => custom_model.SamplePosts.fromJson(json)).toList();
  //       isLoading = false;
  //     });
  //   } else {
  //     // Handle error
  //     setState(() {
  //       isLoading = false;
  //     });
  //     print('Failed to load data: ${response.statusCode}');
  //   }
  // }

}
