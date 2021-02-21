import "package:flutter/material.dart";
import 'package:heart_app/theme.dart';
import 'package:heart_app/widgets/home/OrganizationTile.dart';

class PieData {
  static List<Data> data = [
    Data('Chidrens Charity', 47.95, AppTheme().green),
    Data('Tech Charity', 19.83, AppTheme().yellow),
    Data('Animal Charity', 32.22, AppTheme().blue)
  ];
}

class Data {
  final String organization;
  final double perc;
  final Color color;
  Data(this.organization, this.perc, this.color);
}
