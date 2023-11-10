import 'package:flutter/material.dart';

import '../Create/create.dart';
import '../HomeScreen/Home.dart';
import '../Notification/notification.dart';
import '../Personal/account.dart';
import '../QR/QrCamera.dart';
import '../SignIn/ForgotPassword.dart';
import '../Task/TaskDetail.dart';

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _currentIndex = 0;

//   // List of screens to navigate to
//   final List<Widget> _screens = [
//     Home(),
//     TaskDetail(),
//     // CreateScreen(),
//     // NotificationsScreen(),
//     // ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         children: _screens,
//         controller: PageController(initialPage: _currentIndex),
//         onPageChanged: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home, color: Colors.green),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.scanner, color: Colors.green),
//             label: 'Scanner',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add, color: Colors.green),
//             label: 'Create',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications, color: Colors.green),
//             label: 'Notifications',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person, color: Colors.green),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);
  

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };

  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    QRScannerScreen(),
    Create(),
    NotificationClass(),
    Personal(),
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      navigatorKeys[_selectedIndex]?.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code, color: Colors.green),
            label: 'Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.green),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.green),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.green),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: buildNavigator(),
    );
  }

  buildNavigator() {
    return Navigator(
      key: navigatorKeys[_selectedIndex],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (_) => _widgetOptions.elementAt(_selectedIndex),
        );
      },
    );
  }
}
