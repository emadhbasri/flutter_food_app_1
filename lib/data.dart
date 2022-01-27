import 'package:flutter/material.dart';

import 'models.dart';

///--------------------------------colors
const yellowBack = Color.fromRGBO(255, 221, 0, 1);

///--------------------------------colors

final List<SlideData> slideList = [
  SlideData(
    image: 'assets/PageFirst5.jpg',
  ),
  SlideData(
    image: 'assets/PageFirst1.jpg',
  ),
  SlideData(
    image: 'assets/PageFirst2.jpg',
  ),
  SlideData(
    image: 'assets/PageFirst3.jpg',
  ),
  SlideData(
    image: 'assets/PageFirst4.jpg',
  ),
  SlideData(
    image: 'assets/PageFirst6.jpg',
  ),
];
final List<SliderBottomData> slideBottomList = [
  SliderBottomData(
      image: 'assets/chineese.png',
      name: 'The Tang NYC',
      desc: 'Asian, Noodles'),
  SliderBottomData(
    image: 'assets/chineese.png',
    name: 'Nickel & Dinner1',
    desc: 'American (Traditional), Breakfast1',
  )
];
final List<CategoryData> categories = [
  CategoryData('assets/chicken_leg.png', 'Americans'),
  CategoryData('assets/assian.png', 'Asian'),
  CategoryData('assets/breakfast.png', 'Breakfast'),
  CategoryData('assets/burger.png', 'Burgers'),
  CategoryData('assets/coffee_cup.png', 'Cafe'),

];
