import 'package:blabla/ui/screens/ride_pref/widgets/bla_bottom.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

// This screen is for testing the botton to make sure all workk


class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            BlaBottom(
              label: "Primary",
              icon: Icons.dangerous,
              isPrimary: true, // primary button
              onPressed: () {},
            ),

            BlaBottom(
              label: "Second",
              icon: Icons.face,
              isPrimary: false, // secondary button
              onPressed: (){},
            ),
            BlaBottom(          // without icon, when icon == null will fall to second condition
              label: "Second",
              icon: null,
              isPrimary: false,
              onPressed: (){},
            ),
            BlaBottom(          // completely disable the botton because the onPressed: null,
              label: "Second",
              icon: null,
              isPrimary: false,
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}