import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constans/gaps.dart';
import 'package:tiktok_clone/constans/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    initialDate = DateTime(DateTime.now().year - 12);
    _setTextFieldDate(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
      (route) => false,
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "When's your birthday?",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              "Your birthday won't be shown publicly.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              style: const TextStyle(
                color: Colors.black,
              ),
              enabled: false,
              controller: _birthdayController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v32,
            GestureDetector(
              onTap: _onNextTap,
              child: const FormButton(
                disabled: false,
                text: 'Next',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.grey.shade50,
        color: Colors.grey.shade50,
        height: 300,
        child: CupertinoDatePicker(
          initialDateTime: initialDate,
          maximumDate: initialDate,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: _setTextFieldDate,
        ),
      ),
    );
  }
}
