import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/presentation/bloc/news/news_bloc.dart';
import 'package:news/presentation/resources/utils.dart';
import 'package:news/presentation/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context: context).getColor;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: color),
          elevation: 0,
          title: Text(
            'News',
            style: GoogleFonts.lobster(
              textStyle:
                  TextStyle(color: color, fontSize: 20, letterSpacing: 0.6),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(IconlyLight.search),
            ),
          ],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        drawer: const CustomDrawer(),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (state is NewsLoadedState) {
                  return ListView.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) =>
                          Text(state.news[index].title));
                }
                return Container();
              },
            )
            // Column(
            //   children: [
            //     Row(
            //       children: [
            //         Container(
            //           decoration: BoxDecoration(),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            ),
      ),
    );
  }
}
