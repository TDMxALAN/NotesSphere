import 'package:flutter/material.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:notes_sphere/utils/text_styles.dart';

class CategoryInputBottomSheet extends StatefulWidget {
  final VoidCallback onNewNote;
  final VoidCallback onNewCategory;
  const CategoryInputBottomSheet({
    super.key,
    required this.onNewNote,
    required this.onNewCategory,
  });

  @override
  State<CategoryInputBottomSheet> createState() =>
      _CategoryInputBottomSheetState();
}

class _CategoryInputBottomSheetState extends State<CategoryInputBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.26,
      decoration: BoxDecoration(
        color: AppColors.kCardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: widget.onNewNote,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create a new Note",
                    style: AppTextStyles.appSubtitle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(Icons.note_add),
                ],
              ),
            ),
            SizedBox(height: 30),
            Divider(
              color: AppColors.kWhiteColor.withOpacity(0.3),
              thickness: 1,
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: widget.onNewCategory,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create a new Note Category",
                    style: AppTextStyles.appSubtitle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(Icons.category),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
