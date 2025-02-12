import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/utils/constants.dart';
import 'package:notes_sphere/utils/text_styles.dart';

class NotesCard extends StatelessWidget {
  final String noteCategory;
  final int noOfNotes;
  const NotesCard({
    super.key,
    required this.noteCategory,
    required this.noOfNotes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.kCardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            noteCategory,
            style:
                AppTextStyles.appSubtitle.copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            '$noOfNotes notes',
            style: AppTextStyles.appBody.copyWith(
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}
