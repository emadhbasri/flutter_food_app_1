import 'package:flutter/material.dart';
import 'classes/functions.dart';
import 'data.dart';
import 'models.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  int currentIndex = 0;

  final ScrollController _controller = ScrollController();
  List<GlobalKey> keys =
      List.generate(slideList.length, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
              onPageChanged: (int value) {
                setState(() {
                  currentIndex = value;
                  Scrollable.ensureVisible(keys[value].currentContext!,
                      alignment: 0.5, duration: const Duration(milliseconds: 300));
                });
              },
              physics: const BouncingScrollPhysics(),
              controller: PageController(viewportFraction: 0.9),
              itemCount: slideList.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5)
                        .copyWith(right: doubleWidth(2)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(slideList[index].image),
                        )),
                    child: Padding(
                      padding: EdgeInsets.all(doubleWidth(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                  onTap: () {
                                    SlideData temp = slideList[index];
                                    temp.like = !temp.like;
                                    setState(() {
                                      slideList[index] = temp;
                                    });
                                  },
                                  child: Image.asset(
                                    slideList[index].like
                                        ? 'assets/heart.png'
                                        : 'assets/hearti.png',
                                    width: doubleWidth(7),
                                    height: doubleWidth(7),
                                  ))),
                          Align(
                            alignment: Alignment.center,
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: EdgeInsets.all(doubleWidth(3)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      slideList[index].name,
                                      style: textTheme.headline6,
                                    ),
                                    const SizedBox(height: 5),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        slideList[index].desc,
                                        style: textTheme.bodyText2,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Divider(
                                      height: 0,
                                      thickness: 0.5,
                                      color: Colors.black38,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        const Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Color.fromRGBO(255, 221, 0, 1),
                                        ),
                                        Text(slideList[index].star.toString(),
                                            style: textTheme.bodyText1),
                                        Text(
                                          ' (${slideList[index].count})   ',
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  150, 150, 150, 1)),
                                        ),
                                        const Icon(
                                          Icons.timer,
                                          size: 20,
                                          color:
                                              Color.fromRGBO(204, 204, 204, 1),
                                        ),
                                        Text(' ${slideList[index].time}  ',
                                            style: textTheme.bodyText1),
                                        const Icon(
                                          Icons.monetization_on,
                                          size: 20,
                                          color:
                                              Color.fromRGBO(204, 204, 204, 1),
                                        ),
                                        Text('   ${slideList[index].price}',
                                            style: textTheme.bodyText1),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              }),
        ),
        SizedBox(
            width: double.maxFinite,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: doubleWidth(30)),
                child: SingleChildScrollView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        slideList.length,
                        (index) => Padding(
                              key: keys[index],
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Container(
                                width: currentIndex == index ? 15 : 6,
                                height: currentIndex == index ? 15 : 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black,
                                ),
                              ),
                            )),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
