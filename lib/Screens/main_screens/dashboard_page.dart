import 'package:flutter/material.dart';
import 'package:student_app/Screens/auth_screens/login_screen.dart';
import 'package:student_app/Screens/main_screens/attendance_page.dart';
import 'package:student_app/Screens/main_screens/marks_page.dart';
import 'package:student_app/Screens/main_screens/profile_page.dart';
import 'package:student_app/Screens/main_screens/announcement_page.dart';
import 'package:student_app/Screens/main_screens/assisgnment_page.dart';
import 'package:student_app/Screens/main_screens/fee_page.dart';
import 'package:student_app/Screens/main_screens/leave_request.dart';
import 'package:student_app/Screens/main_screens/timetable_page.dart';

import 'announcement_page.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
         title: const Text('StudHub',style:TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 37, 99, 235),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration:  BoxDecoration(
                color: Color(0xFF2563EB),
              ),
              child: Padding(
                padding: EdgeInsets.only(top:20),
                child: Text(
                  
                  'StudHub Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              ),
            ),
            _buildDrawerItem( Icons.home, 'Dashboard',DashboardPage()),
            _buildDrawerItem(Icons.person, 'Profile',ProfilePage()),
            _buildDrawerItem(Icons.checklist, 'Attendance',AttendancePage()),
            _buildDrawerItem(Icons.emoji_events, 'Marks',MarksPage()),
            _buildDrawerItem(Icons.calendar_month, 'Timetable', TimetablePage()),
            _buildDrawerItem(Icons.assignment, 'Assignments', AssignmentsPage()),

_buildDrawerItem(Icons.campaign, 'Announcements', AnnouncementsPage()),





_buildDrawerItem(Icons.payments, 'Fees', FeesPage()),

_buildDrawerItem(Icons.edit_calendar, 'Leave Request', LeaveRequestPage()),

            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: _buildDashboard()
         
    );
  }

Widget _buildDrawerItem(IconData icon, String label, Widget screen) {
  return ListTile(
    leading: Icon(icon),
    title: Text(label,style: TextStyle(fontWeight: FontWeight.w500),),
    onTap: () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => screen),
      );
    },
  );
}


  Widget _buildDashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats Cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildStatCard(
                  'Attendance Rate',
                  '92%',
                  const Color(0xFF3B82F6),
                  Icons.schedule,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'CGPA',
                  '7.8',
                  const Color(0xFFA855F7),
                  Icons.trending_up,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildStatCard(
            'Total Subjects',
            '6',
            const Color(0xFF10B981),
            Icons.book,
          ),
          const SizedBox(height: 24),
          // Recent Classes
          const Text(
            'Recent Classes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ..._buildClassesList(),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(icon, color: Colors.white24, size: 32),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildClassesList() {
    final classes = ['Mathematics', 'Physics', 'Chemistry', 'English','Tamil','Sanskrit'];
    return classes
        .map(
          (subject) => Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      subject[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subject,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Today at 10:00 AM',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        )
        .toList();
  }
}