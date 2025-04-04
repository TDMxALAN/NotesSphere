import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sphere/utils/constants.dart';
import 'package:notes_sphere/utils/router.dart';
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
          'Notes App',
          style: GoogleFonts.lobster(
            fontSize: 40,
            fontWeight: FontWeight.normal,
            color: Colors.cyan,
          ),
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
                GestureDetector(
                  //push
                  onTap: () => AppRouter.router.push('/notes'),
                  child: NotesTodoCard(
                    title: 'Notes',
                    description: '3 notes',
                    icon: Icons.bookmark_add_outlined,
                  ),
                ),
                GestureDetector(
                  //push
                  onTap: () => AppRouter.router.push('/todos'),
                  child: NotesTodoCard(
                    title: 'To-Do List',
                    description: '3 Tasks',
                    icon: Icons.today_outlined,
                  ),
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
