import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

String twoDigits(int n) {
  if (n >= 10) return "$n";
  return "0$n";
}

int toTwelveHour(int n) {
  return n > 12 ? n % 12 : (n == 0 ? 12 : n);
}

String amOrPm(int n) {
  return n >= 12 ? 'p.m.' : 'a.m.';
}
