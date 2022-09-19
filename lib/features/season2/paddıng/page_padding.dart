import 'package:flutter/material.dart';

class PagePadding extends EdgeInsets {
  static const double _normalValue = 10;

  const PagePadding.horizontalSymmetric() : super.symmetric(horizontal: _normalValue);
  const PagePadding.verticalSymmetric() : super.symmetric(vertical: _normalValue);
  const PagePadding.general() : super.only(right: _normalValue, left: _normalValue, top: _normalValue);
  const PagePadding.all() : super.all(_normalValue);
  const PagePadding.onlyLeft() : super.only(left: _normalValue);
  const PagePadding.onlyBottom() : super.only(bottom: _normalValue);
  const PagePadding.onlyTop() : super.only(top: _normalValue);
  const PagePadding.onlyRight() : super.only(right: _normalValue);
}
