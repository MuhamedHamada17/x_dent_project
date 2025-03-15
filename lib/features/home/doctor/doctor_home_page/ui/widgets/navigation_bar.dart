import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.all(1),
      color: ColorsManager.lighterBLUE,
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: ColorsManager.lighterBLUE,
        selectedItemColor: ColorsManager.Blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          _buildNavItem(Icons.home_outlined, "Home", 0),
          _buildNavItem(Icons.calendar_today, "Appointments", 1),
          _buildNavItem(Icons.message_outlined, "Messages", 2),
          _buildNavItem(Icons.person, "Profile", 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int index,
  ) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: isSelected ? 30.0 : 24.0,
        height: isSelected ? 30.0 : 24.0,
        child: Icon(icon),
      ),
      label: label,
    );
  }
}
