import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish/src/constants/colors.dart';

class ImageSliderWithIndicator extends StatefulWidget {
  const ImageSliderWithIndicator({super.key});

  @override
  State<ImageSliderWithIndicator> createState() => _ImageSliderWithIndicatorState();
}
class _ImageSliderWithIndicatorState extends State<ImageSliderWithIndicator> {
  final PageController _controller = PageController(viewportFraction: 0.9); // Adds spacing
  int currentPage = 0;

  final List<String> images = [
    'assets/product/banner1.png',
    'assets/product/banner1.png',
    'assets/product/banner1.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 190, // Enough height for image + padding
          child: PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10), // Space between items
                child: Container(
                  height: 168,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _controller,
          count: images.length,
          effect: ExpandingDotsEffect(
            dotColor: Colors.grey,
            activeDotColor: TColors.buttonPrimary,
            dotHeight:5,
            dotWidth: 17,
          ),
        ),
      ],
    );
  }
}
