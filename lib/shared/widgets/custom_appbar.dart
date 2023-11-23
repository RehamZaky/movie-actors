import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/shared/style/global_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.actions,  this.backButton = true});
  final String title;
  final List<Widget>? actions;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GlobalColors.primaryColor,
      leading: backButton ? const BackButton(color: GlobalColors.backgroundColor): const SizedBox(),
      actions: actions ?? [],
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: GlobalColors.backgroundColor),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
