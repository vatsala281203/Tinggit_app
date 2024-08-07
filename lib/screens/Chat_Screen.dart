import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_navigation_drawer_l.dart';
import 'navigation_drawer.dart';

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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 5,
      child: Container(
        height: 600,
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.chat, size: 30, color: Colors.blueAccent),
              SizedBox(width: 10),
              Text(
                'Start Conversation',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Static list of events
  final List<Map<String, String>> _posts = [
    {
      'profileImage': 'assets/images/avatar1.png',
      'username': 'Diwali Vogue 2023',
      'postImage': 'assets/images/diwalipic1.jpg',
      'caption': 'Celebrate the sparkle of Diwali with Vogue, where tradition meets contemporary elegance. Illuminate your festivities with our exclusive style guide',
    },
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
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 40),
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
          children: [
            SizedBox(height: 0),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "My Referrals /",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold, // Ensure the text color is set
                      ),
                    ),
                    TextSpan(
                      text: " Chat",
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
            // SizedBox(
            //   width: screenWidth * 0.9, // Set the desired width
            //   height: 50,
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.white,
            //       foregroundColor: Colors.black45,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15.0), // Corner radius
            //       ),
            //       elevation: 4, // Shadow
            //     ).copyWith(
            //       textStyle: MaterialStateProperty.all(
            //         TextStyle(
            //           fontSize: 17, // Text size
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ),
            //     child: const Text("Events Page"),
            //     onPressed: () {
            //       showDialog(
            //         context: context,
            //         builder: (context) {
            //           return AlertDialog(
            //             title: const Text("Create Post"),
            //             content: Column(
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 TextField(
            //                   decoration: InputDecoration(
            //                     hintText: 'Write something...',
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             actions: [
            //               TextButton(
            //                 onPressed: () {
            //                   Navigator.pop(context);
            //                 },
            //                 child: const Text("Cancel"),
            //               ),
            //               TextButton(
            //                 onPressed: () {
            //                   // Handle the post action here
            //                   Navigator.pop(context);
            //                 },
            //                 child: const Text("Post"),
            //               ),
            //             ],
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
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
}
