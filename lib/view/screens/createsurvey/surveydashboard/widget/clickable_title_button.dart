import 'package:flutter/material.dart';
import 'package:markprintgeo/util/dimensiona.dart';

class ClickableIconTitleButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final IconData icon;
  const ClickableIconTitleButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          child: Row(
            children: [
              Icon(
                icon,
                size: 16,
              ),
              SizedBox(
                width: Dimensions.paddingSizeExtraSmall,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
