import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class BlaBottom extends StatelessWidget {
  const BlaBottom({
    super.key, 
    required this.label, 
    this.icon,                            
    this.onPressed,                       
    this.isPrimary = true,                // set it to true to make it primary botton
  });

  final String label;
  final IconData? icon;                 // Nullable because it can be optional with or without icon
  final VoidCallback? onPressed;        // onPressed nullable, use null when enable is false or disable botton
  final bool isPrimary;                 // handle the validation of primary and secondary botton


  
  @override
  Widget build(BuildContext context) {
    //TODO build the botton 
    //implement the condition to validate PRIMARY/SECONDART
    final backgroundColor = isPrimary? BlaColors.primary : BlaColors.white; // Set condition when botton isPrimary or Secondary
    final textColor = isPrimary? BlaColors.white : BlaColors.primary;       // Set condition when the text isPrimary or Secondary
    
    //Botton Code
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        width: double.infinity,
        height: 52,

        child: icon != null?      // Condition Checking

        ElevatedButton.icon(      // True conditions NOT NULL, appear Icon on the botton
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: BorderSide(
              color: BlaColors.neutralLighter,
              width: 1,
            )
          ),
          onPressed: onPressed,
          icon: Icon(icon, color: textColor,),
          label: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: textColor ),
          ),
        )

        : ElevatedButton.icon(     // False consitions: duplicate the botton and set it with no ICON, case: to make label ceter and balance space
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            side: BorderSide(
              color: BlaColors.neutralLighter,
              width: 1,
            )
          ),
          onPressed: onPressed,
          label: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: textColor ),
          ),
        ),
      ),
    );
  }
} 