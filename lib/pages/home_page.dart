import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/constants.dart';
import 'package:notes_sphere/utils/text_styles.dart';
import 'package:notes_sphere/widgets/notes_todo_card.dart';
import 'package:notes_sphere/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: AppTextStyles.appTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            ProgressCard(
              completedTasks: 2,
              totalTasks: 5,
            ),
            SizedBox(
              height: AppConstants.kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NotesTodoCard(
                  title: 'Notes',
                  description: '3 notes',
                  icon: Icons.bookmark_add_outlined,
                ),
                NotesTodoCard(
                  title: 'To_Do List',
                  description: '3 Tasks',
                  icon: Icons.today_outlined,
                )
              ],
            ),
            SizedBox(height: AppConstants.kDefaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Today's Progress",
                  style: AppTextStyles.appSubtitle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "See all...",
                  style: AppTextStyles.appSubtitle.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
