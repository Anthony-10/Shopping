import 'package:flutter/material.dart';
import 'package:shopping_app/models/profile_items.dart';

class ProductCategory {
  static const language = ProfileItems(
      text: 'language',
      subText: 'Swahili',
      icon: Icons.arrow_forward_ios_rounded);
  static const addressBook = ProfileItems(
      text: 'addressBook',
      subText: 'gmail',
      icon: Icons.arrow_forward_ios_rounded);
  static const country = ProfileItems(
      text: 'Country', subText: 'Kenya', icon: Icons.arrow_forward_ios_rounded);
  static const Faq = ProfileItems(
      text: 'Faq', subText: 'Faq', icon: Icons.arrow_forward_ios_rounded);

  static final List<ProfileItems> all = [language, addressBook, country, Faq];
}
