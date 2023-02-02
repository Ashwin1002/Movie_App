import 'package:flutter/material.dart';
import 'package:movie_app/src/widget/widget_space.dart';

class TitleHeadingRow extends StatelessWidget {
  const TitleHeadingRow({Key? key, required this.heading, this.subHeading})
      : super(key: key);

  final String heading;
  final String? subHeading;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                heading.split(" ").first,
                style: textTheme.headlineMedium?.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              horizontalSpace(width: 4.0),
              Text(
                heading.split(" ").last,
                style: textTheme.headlineMedium?.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          Text(
            subHeading ?? "",
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
              fontSize: 14.0,
            ),
          )
        ],
      ),
    );
  }
}
