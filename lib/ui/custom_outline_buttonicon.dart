import 'package:flutter/material.dart';
import 'package:syntaxfm_app/styles/my_colors.dart' as mColors;
import 'package:syntaxfm_app/styles/my_styles.dart' as mStyles;

class CustomOutlineButtonIcon extends StatelessWidget {
  const CustomOutlineButtonIcon({
    Key? key,
    required this.text,
    required this.icon,
    required this.callback,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(
        icon,
        color: mColors.primaryColor,
      ),
      style: mStyles.buttonStylePrimary,
      onPressed: callback,
      label: Text(
        text,
        style: TextStyle(
          color: mColors.primaryColor,
        ),
      ),
    );
  }
}
