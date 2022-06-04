import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_squirrel/providers/home_provider.dart';

class CoachMarksPage extends StatefulWidget {
  const CoachMarksPage({Key? key}) : super(key: key);

  @override
  State<CoachMarksPage> createState() => _CoachMarksPageState();
}

class _CoachMarksPageState extends State<CoachMarksPage> {
  late HomeProvider homeProvider;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: InkWell(
        onTap: () async {
          final SharedPreferences prefs = await _prefs;

          if (homeProvider.coachMarksNumber < 7) {
            setState(() {
              homeProvider.coachMarksNumber++;
            });
          } else {
            prefs.setBool('isShowCoachMarks', false);
            homeProvider.isShowCoachMarks = false;
          }
        },
        child: Image.asset(
          'assets/images/coach-marks-${homeProvider.coachMarksNumber}.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
