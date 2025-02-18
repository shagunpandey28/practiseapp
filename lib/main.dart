import 'package:flutter/material.dart';
import 'package:practiseapp/SignIn.dart';
import 'package:practiseapp/admin.dart';
import 'package:practiseapp/attendance_history.dart';
import 'package:practiseapp/dashboard.dart';
import 'package:practiseapp/employee_details.dart';
import 'package:practiseapp/leavepage.dart';
import 'package:practiseapp/notification_page.dart';
import 'package:practiseapp/personalInformation.dart';
import 'package:practiseapp/profile.dart';
import 'package:practiseapp/report_attendance.dart';
import 'package:practiseapp/signup_page.dart';

import 'Screens/slpash.dart';
import 'changePassword.dart';
import 'clockinout.dart';
import 'loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splashscreen(),
      initialRoute: 'dashboard',
       routes: {
        'SignIn':(context) => SignInPage(),
         'signup_page':(context)=>SignUpPage(),
         'dashboard':(context) =>DashboardScreen(),
         'clockinout':(context) =>LiveAttendanceScreen(),
         'profile':(context) => ProfilePage(),
         'admin':(context)=>AdminPage(),
         'employee_details':(context)=> EmployeeScreen(),
         'attendance_history':(context)=> AttendanceHistoryScreen(),
         'report_attendance':(context)=>ReportAttendanceScreen(),
         'leavepage':(context)=>LeaveManagementScreen(),
         'notification_page':(context)=> NotificationsScreen(),
         'personalInformation':(context)=>PersonalInformationScreen(),
         'changePassword':(context)=> ChangePasswordScreen(),
         'loginpage':(context)=>Loginscreen(),
         'splash':(context)=> Splashscreen(),
       },
    );
  }
}


