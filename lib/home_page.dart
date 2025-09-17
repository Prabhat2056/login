

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:login/login/login_page.dart';


// //import 'widgets/bottomnav.dart';
//  // Make sure this path is correct

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () async {
//               // ✅ Sign out user
//               await FirebaseAuth.instance.signOut();

//               // 🔹 Navigate to LoginPage and remove HomePage from stack
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const LoginPage()),
//               );
//             },
//           )
//         ],
//       ),
//       // body: const Center(
//       //   child: Text(
//       //     "Welcome! You are logged in 🎉",
//       //     style: TextStyle(fontSize: 20),
//       //   ),
//       // ),
//        //body: MyBottomNavApp(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:login/login/login_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0; // Track which tab is selected

//   // Example pages for bottom navigation
//   final List<Widget> _pages = const [
//     Center(child: Text("🏠 Home Page", style: TextStyle(fontSize: 20))),
//     Center(child: Text("📄 Tasks Page", style: TextStyle(fontSize: 20))),
//     Center(child: Text("👤 Profile Page", style: TextStyle(fontSize: 20))),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index; // Change tab
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () async {
//               await FirebaseAuth.instance.signOut();
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const LoginPage()),
//               );
//             },
//           )
//         ],
//       ),

//       // ✅ Body changes based on selected index
//       body: _pages[_selectedIndex],

//       // ✅ Bottom Navigation Bar
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped, // Call function on tap
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'widgets/unitbox.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), //height of the app bar
        child: Container(
          color: Colors.teal.shade800,
          //height: 50,
          //color: Colors.red,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "J-Jewellery App",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      body: Container(
        //color: Colors.red,
        color: Colors.teal.shade800, // whole body color
        // <-- This colors the side gaps
        child: Column(
          children: [
            SizedBox(
              height:
                  10, // gap between AppBar and this container verticle space as it is inside column
            ),
            // 🔷 First Container (e.g. Units row)
            Container(
              //padding: const EdgeInsets.symmetric(vertical: 100),// gap between AppBar and this container
              //padding: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                //color: Colors.white,
                //color: Colors.red,
                color: Colors.teal.shade800, //first container color
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(0),
                ),

                // For boxShadow widget we must have borderRadius
                boxShadow: const [
                  //to add shadow to the box

                  // BoxShadow(
                  //   color: Colors.black12,
                  //   blurRadius: 0,
                  //   offset: Offset(0, 0),
                  // ),
                ],
              ),
              child: const Row(
                //Row widget to align the boxes horizontally
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  UnitBox(
                    label: '',
                    subtext: 'Gram',
                  ), // subtext to write text under the label
                  Icon(Icons.swap_horiz, color: Colors.white),
                  UnitBox(label: '', subtext: 'Tola'),
                  UnitBox(label: '', subtext: 'Lal'),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // 🔷 Second Container (e.g. Gold/Silver Info)
            Expanded(
              //to color the entire remaining space wrap container with Expanded widget
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white, //second container color
                  borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Text(
                            "आजको \nसुन चाँदीको भाउ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 3, 102, 92),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        
                        const SizedBox(width: 5),
                        const Icon(Icons.refresh, color: Colors.teal, size: 25),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Text(
                            "2082 - Shrawan - 12",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 36, 112, 104),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.share, color: Colors.teal, size: 25),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Price(Per Tola)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 102, 92),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                    
                  ],
                ),
              ),
            ),

            // Add more widgets below...
          ],
        ),
      ),
    );
  }
}

