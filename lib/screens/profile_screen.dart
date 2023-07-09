import 'package:blackyellow/screens/submission_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileScreen extends StatelessWidget {
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.toastBackground,
      textColor: AppColors.toastText,
    );
  }

  Widget buildButtonWithToast({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Function() onPressed,
    bool showArrow = false,
    Color? boxColor,
  }) {
    return GestureDetector(
      onTap: () {
        if (label == AppStrings.leaderboard) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SubmissionScreen()),
          );
        } else {
          showToast(label);
          onPressed();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: boxColor ?? AppColors.background,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
              icon,
              color: AppColors.iconColor,
            ),
            SizedBox(height: 4.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                color: AppColors.textColor,
              ),
            ),
            if (showArrow) SizedBox(height: 4.0),
            if (showArrow)
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.iconColor,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showToast(AppStrings.profileTap);
                // Handle profile image tap
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 48.0,
                    backgroundImage:
                        AssetImage('assets/images/testflutter.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.profileName,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                      Text(
                        AppStrings.profileHouse,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              height: 1.0,
              color: AppColors.dividerColor,
              margin: EdgeInsets.symmetric(vertical: 8.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.aadharNumber,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  '1234567890',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.phoneNumber,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  '9876543210',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.schoolName,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.textColor,
                  ),
                ),
                Text(
                  'ABC School',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
            Container(
              height: 1.0,
              color: AppColors.dividerColor,
              margin: EdgeInsets.symmetric(vertical: 8.0),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: buildButtonWithToast(
                    context: context, // Pass the BuildContext here
                    icon: Icons.notifications_none_outlined,
                    label: AppStrings.notification,
                    onPressed: () {
                      // Handle Notification button tap
                    },
                    boxColor: AppColors.buttonBoxColor,
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: buildButtonWithToast(
                    context: context, // Pass the BuildContext here
                    icon: Icons.leaderboard_outlined,
                    label: AppStrings.leaderboard,
                    onPressed: () {
                      // Handle Leaderboard button tap
                    },
                    boxColor: AppColors.buttonBoxColor,
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: buildButtonWithToast(
                    context: context, // Pass the BuildContext here
                    icon: Icons.settings_outlined,
                    label: AppStrings.settings,
                    onPressed: () {
                      // Handle Settings button tap
                    },
                    boxColor: AppColors.buttonBoxColor,
                  ),
                ),
              ],
            ),
            Container(
              height: 1.0,
              color: AppColors.dividerColor,
              margin: EdgeInsets.symmetric(vertical: 8.0),
            ),
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                color: AppColors.buttonBoxColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showToast(AppStrings.contribution);
                      // Handle Contribution tap
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.house_outlined,
                          color: AppColors.textColor,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          AppStrings.contribution,
                          style: TextStyle(
                            color: AppColors.textColor,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.textColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Divider(
                    color: AppColors.dividerColor,
                    height: 1.0,
                  ),
                  SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () {
                      showToast(AppStrings.viewPlan);
                      // Handle View Plan tap
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: AppColors.textColor,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          AppStrings.viewPlan,
                          style: TextStyle(
                            color: AppColors.textColor,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.textColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Divider(
                    color: AppColors.dividerColor,
                    height: 1.0,
                  ),
                  SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () {
                      showToast(AppStrings.share);
                      // Handle Share tap
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.share,
                          color: AppColors.textColor,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          AppStrings.share,
                          style: TextStyle(
                            color: AppColors.textColor,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.textColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButtonWithToast(
                  context: context, // Pass the BuildContext here
                  icon: Icons.home_outlined,
                  label: AppStrings.home,
                  onPressed: () {
                    // Handle Home button tap
                  },
                ),
                buildButtonWithToast(
                  context: context, // Pass the BuildContext here
                  icon: Icons.book_outlined,
                  label: AppStrings.learn,
                  onPressed: () {
                    // Handle Learn button tap
                  },
                ),
                buildButtonWithToast(
                  context: context, // Pass the BuildContext here
                  icon: Icons.emoji_events_outlined,
                  label: AppStrings.competitions,
                  onPressed: () {
                    // Handle Competitions button tap
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppColors {
  static const Color background = Color.fromARGB(255, 9, 49, 47);
  static const Color textColor = Colors.white;
  static const Color iconColor = Colors.white;
  static const Color dividerColor = Colors.white;
  static const Color toastBackground = Colors.grey;
  static const Color toastText = Colors.white;
  static const Color buttonBoxColor = Color.fromARGB(255, 0, 82, 78);
  static const Color containerColor = Color.fromARGB(255, 0, 82, 78);
}

class AppStrings {
  static const String profileTap = 'Ashutosh Patil';
  static const String profileName = 'Ashutosh Patil';
  static const String profileHouse = 'Green House';
  static const String aadharNumber = 'Aadhar Number:';
  static const String phoneNumber = 'Phone Number:';
  static const String schoolName = 'School Name:';
  static const String notification = 'Notification';
  static const String leaderboard = 'Leaderboard';
  static const String settings = 'Settings';
  static const String contribution = 'Contribution';
  static const String viewPlan = 'View Plan';
  static const String share = 'Share';
  static const String home = 'Home';
  static const String learn = 'Learn';
  static const String competitions = 'Competitions';
}
