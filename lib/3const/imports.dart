import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

mystyles(double fs,[Color?clr,FontWeight?fw,]){
  return GoogleFonts.roboto(
    fontSize: fs,
    fontWeight: fw,
    color: clr,
  );
}
Color primaryColor=CupertinoColors.black;
Color secondaryColor=CupertinoColors.white;
