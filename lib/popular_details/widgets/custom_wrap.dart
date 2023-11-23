import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/shared/style/global_colors.dart';

class CustomRowInfo extends StatelessWidget {
  const CustomRowInfo({super.key, required this.title, required this.textVal});
  final String title;
  final String textVal;

  @override
  Widget build(BuildContext context) {
    final customTextStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: GlobalColors.backgroundColor);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 16,
        children: [
          Text(title,
              style: customTextStyle.copyWith(fontWeight: FontWeight.w500)),
          Text(
            textVal,
            style: customTextStyle,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
