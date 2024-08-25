import 'package:bureau_base/components/rounded_image.dart';
import 'package:bureau_base/resources/constants.dart';
import 'package:bureau_base/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class CarouselCard extends StatelessWidget {
  final months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  final String title;
  final String subtitle;
  final String imageUrl;
  final DateTime postDate;

  final void Function()? onClick;
  CarouselCard({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.postDate,
    this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: SizedBox(
        width: ScreenSize.getPercentOfWidth(context, 0.55),
        child: FCard(
          title: Text(
            title,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Text(subtitle),
          image: RoundedImage(
            image: imageUrl,
            width: ScreenSize.getPercentOfWidth(context, 0.4),
            ratio: Constants.postImageRatio,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              "Posted on ${postDate.day} ${months[postDate.month - 1]}",
              style: context.theme.typography.sm,
            ),
          ),
        ),
      ),
    );
  }
}
