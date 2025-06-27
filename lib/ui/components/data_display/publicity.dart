import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled/controllers/publicity_controller.dart';
import 'package:untitled/models/publicity_data.dart';
import 'package:untitled/ui/components/my_image.dart';

class Publicity extends StatefulWidget {
  @override
  State<Publicity> createState() => _PublicityState();
}

class _PublicityState extends State<Publicity> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final PublicityController _publicityController =
      PublicityController.getInstance();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _publicityController.getPublicity();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_publicityController.publicityList.isEmpty) return Container();

    return Column(
      children: [
        CarouselSlider(
          items: imageSliders(),
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            aspectRatio: 2,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _publicityController.publicityList.asMap().entries.map((
            entry,
          ) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.orange)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  List<Widget> imageSliders() => _publicityController.publicityList
      .map(
        (item) => Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(children: <Widget>[MyImage(item.image)]),
          ),
        ),
      )
      .toList();
}
