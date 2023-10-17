import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

kTxtFielldDecoration({
  String hint = '',
  IconData prefixicon = Icons.access_time_filled_outlined,
}) =>
    InputDecoration(
      //  fillColor: Colors.blueGrey.shade50,
      prefixIcon: Icon(
        prefixicon,
        color: Colors.blueGrey,
      ),
      hintText: hint,
      hintStyle: TextStyle(
          color: Colors.blueGrey.shade200,
          fontSize: 12,
          fontStyle: FontStyle.italic),
    );

kPasswordFielldDecoration({
  String hint = '',
  IconData prefixicon = Icons.lock,
  IconData suffixicon = LineIcons.eyeSlash,
}) =>
    InputDecoration(
      //  fillColor: Colors.blueGrey.shade50,
      prefixIcon: Icon(
        prefixicon,
        color: Colors.blueGrey,
      ),
      suffixIcon: Icon(suffixicon),
      hintText: hint,
      hintStyle: TextStyle(
          color: Colors.blueGrey.shade200,
          fontSize: 12,
          fontStyle: FontStyle.italic),
    );
