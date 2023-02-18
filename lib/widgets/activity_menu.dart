import 'package:flutter/material.dart';
import 'package:sento_staff/models/activity.dart';
import 'package:sento_staff/services/activity_service.dart';

class ActivityMenu extends StatefulWidget {
  const ActivityMenu({super.key, required this.type});

  final String type;

  @override
  State<ActivityMenu> createState() => ActivityMenuState();
}

class ActivityMenuState extends State<ActivityMenu> {
  int selectedActivityId = -1;
  List<Activity> activities = [
    Activity.placeholder(),
  ];

  @override
  void initState() {
    super.initState();
    ActivityService().getAllByType(widget.type).then(
      (retrievedActivities) {
        setState(() {
          activities.addAll(retrievedActivities);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white54),
      child: DropdownButton<int>(
          elevation: 15,
          value: selectedActivityId,
          dropdownColor: Color.fromARGB(255, 233, 233, 233),
          borderRadius: BorderRadius.circular(10.0),
          iconSize: 25.0,
          underline: SizedBox(),
          isExpanded: true,
          items: activities
              .map(((activity) => DropdownMenuItem(
                  value: activity.id, child: Text(activity.title))))
              .toList(),
          onChanged: (int? value) {
            setState(() {
              selectedActivityId = value!;
            });
          }),
    );
  }
}
