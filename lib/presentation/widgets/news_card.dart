import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/domain/entities/news_entity.dart';

class NewsCard extends StatelessWidget {
  final NewsEntity news;
  const NewsCard({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle smallTextStyle = GoogleFonts.montserrat(fontSize: 15);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 60,
                  width: 60,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    _imageWidget(),
                    const SizedBox(
                      width: 10,
                    ),
                    _newsMainContent(smallTextStyle)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _newsMainContent(TextStyle smallTextStyle) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            news.title,
            textAlign: TextAlign.justify,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: smallTextStyle,
          ),
          const SizedBox(width: 5),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              '🕒 ${news.readingTimeText}',
              style: smallTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect _imageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Hero(
        tag: news.publishedAt,
        child: FancyShimmerImage(
          height: 50,
          width: 50,
          boxFit: BoxFit.fill,
          errorWidget: Image.asset('assets/images/empty_image.png'),
          imageUrl: news.urlToImage,
        ),
      ),
    );
  }
}
