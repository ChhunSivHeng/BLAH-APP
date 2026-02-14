//Update Correction, based on standard code
import 'package:flutter/material.dart';
import 'package:blabla/ui/theme/theme.dart';

class RidePrefsInput extends StatelessWidget {
  final IconData icon;
  final String? txt;
  final DateTime? date;
  final int? num;
  final bool isPlaceholder;
  final VoidCallback? onTap;

  const RidePrefsInput({
    super.key,
    required this.icon,
    this.txt,
    this.date,
    this.num,
    this.isPlaceholder = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayTxt =
        txt ?? (num?.toString()) ?? (date != null ? "${date!.day}/${date!.month}/${date!.year}" : "");
    return InkWell(        
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: BlaColors.iconLight),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                displayTxt,
                style: TextStyle(
                    fontSize: 16,
                    color: isPlaceholder ? BlaColors.textLight : BlaColors.textNormal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}