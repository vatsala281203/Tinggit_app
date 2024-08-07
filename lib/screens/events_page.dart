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
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(username),
            trailing: Icon(Icons.more_horiz),
          ),
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
          SizedBox(height: 10),
          GestureDetector(
            onDoubleTap: () {
              // Handle like action
            },
            child: Center(
              child: Container(
                width: 330,
                height: 300,
                child: Image(
                  image: postImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up),
                  onPressed: () {
                    // Handle like action
                  },
                ),
                Text("Like"),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                    // Handle comment action
                  },
                ),
                Text("Comment"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  // Static list of events
  final List<Map<String, String>> _posts = [
    {
      'profileImage': 'assets/images/avatar1.png',
      'username': 'Diwali Vogue 2023',
      'postImage': 'assets/images/diwalipic1.jpg',
      'caption': 'Celebrate the sparkle of Diwali with Vogue, where tradition meets contemporary elegance. Illuminate your festivities with our exclusive style guide',
    },
    {
      'profileImage': 'assets/images/avatar2.png',
      'username': 'Office Trip',
      'postImage': 'assets/images/officetrip.png',
      'caption': 'Trading the conference room for breathtaking views and team bonding. Our office trip turned into an unforgettable adventure. Here’s to great times and even greater colleagues!',
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
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding as needed
                child: Text(
                  "Events",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
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
