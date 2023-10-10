import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/colors/colors.dart';
import 'package:getwidget/getwidget.dart';
import 'package:task_app/components/task.dart';
import 'package:task_app/data/tasks_list.dart';
import 'package:task_app/pages/add_task.dart';
import 'package:task_app/pages/notification_page.dart';
import 'package:task_app/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double calculateProgress() {
    int tasksDone = taskList.where((task) => task["done"] == true).length;
    final totalTasks = taskList.length;

    if (totalTasks == 0) {
      return 100.0;
    }

    return (tasksDone / totalTasks) * 100;
  }

  String getFormattedDate() {
    final DateTime now = DateTime.now();
    return "${now.month}/${now.day}/${now.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                // App Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/me.jpg"),
                        radius: 25.0,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationsPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: buttonBgColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.notifications_none_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddTaskPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: buttonBgColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 50),
                Row(
                  children: [
                    Text(
                      "Good \nMorning",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: secondColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's date",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${getFormattedDate()}",
                          style: GoogleFonts.poppins(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${calculateProgress().toStringAsFixed(2)}% Done",
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        Text(
                          "Completed Tasks",
                          style: GoogleFonts.poppins(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Text(
                            "${taskList.length}",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Tasks",
                          style: GoogleFonts.poppins(
                            color: secondColor,
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Text(
                            "${taskList.length}",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Board",
                          style: GoogleFonts.poppins(
                            color: secondColor,
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20),

                GFProgressBar(
                  percentage: calculateProgress() / 100,
                  backgroundColor: buttonBgColor,
                  progressBarColor: GFColors.SUCCESS,
                ),

                SizedBox(height: 20),
                SizedBox(
                  child: taskList.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 100),
                            Center(
                              child: Text(
                                "No more tasks",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: taskList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final todo = taskList.reversed.toList()[index];
                            final task = todo["task"];
                            return Task(
                              task: task,
                              deleteTask: () {
                                setState(() {
                                  taskList.removeWhere(
                                      (item) => item["task"] == task);
                                  print(taskList);
                                });
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
