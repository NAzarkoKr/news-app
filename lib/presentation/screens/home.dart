import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/presentation/bloc/news/news_bloc.dart';
import 'package:news/presentation/resources/helpers.dart';
import 'package:news/presentation/resources/utils.dart';
import 'package:news/presentation/widgets/category_tab.dart';
import 'package:news/presentation/widgets/drawer.dart';
import 'package:news/presentation/widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsType = NewsType.allNews;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context: context).getColor;

    return SafeArea(
      child: Scaffold(
        appBar: _appBar(color, context),
        drawer: const CustomDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                return Column(
                  children: [
                    _categoryTabRow(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        paginationButton(
                            context: context,
                            text: 'Prew',
                            function: () {
                              if (state is NewsLoadedState) {
                                context.read<NewsBloc>().add(
                                      LoadNewsEvent(
                                          page: state.page > 1
                                              ? state.page - 1
                                              : 1,
                                          sortBy: state.sortBy),
                                    );
                              }
                            }),
                        paginationButton(
                            context: context,
                            text: 'Next',
                            function: () {
                              if (state is NewsLoadedState) {
                                context.read<NewsBloc>().add(
                                      LoadNewsEvent(
                                          page: state.page < 6
                                              ? state.page + 1
                                              : 6,
                                          sortBy: state.sortBy),
                                    );
                              }
                            }),
                      ],
                    ),
                    if (state is NewsLoadingState)
                      const SizedBox(
                        height: 600,
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      )
                    else if (state is NewsLoadedState)
                      SizedBox(
                        height: 600,
                        child: ListView.builder(
                            itemCount: state.news.length,
                            itemBuilder: (context, index) =>
                                NewsCard(news: state.news[index])),
                      )
                    else
                      Container(),
                  ],
                );
              },
            )),
      ),
    );
  }

  AppBar _appBar(Color color, BuildContext context) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: color),
      elevation: 0,
      title: Text(
        'News',
        style: GoogleFonts.lobster(
          textStyle: TextStyle(color: color, fontSize: 20, letterSpacing: 0.6),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(IconlyLight.search),
        ),
      ],
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  Row _categoryTabRow(BuildContext context) {
    return Row(
      children: [
        CategoryTab(
            text: 'All news',
            color: newsType == NewsType.allNews
                ? Theme.of(context).cardColor
                : Colors.transparent,
            function: () {
              if (newsType == NewsType.allNews) {
                return;
              }
              setState(() {
                newsType = NewsType.allNews;
              });
            },
            fontSize: newsType == NewsType.allNews ? 22 : 14),
        const SizedBox(
          width: 20,
        ),
        CategoryTab(
            text: 'Top trending',
            color: newsType == NewsType.topTrending
                ? Theme.of(context).cardColor
                : Colors.transparent,
            function: () {
              if (newsType == NewsType.topTrending) {
                return;
              }
              setState(() {
                newsType = NewsType.topTrending;
              });
            },
            fontSize: newsType == NewsType.topTrending ? 22 : 14)
      ],
    );
  }

  ElevatedButton paginationButton({
    required BuildContext context,
    required String text,
    required Function function,
  }) =>
      ElevatedButton(
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          padding: const EdgeInsets.all(6),
          textStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        child: Text(
          text,
        ),
      );
}
