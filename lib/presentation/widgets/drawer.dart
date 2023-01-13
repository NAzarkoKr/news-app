import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news/presentation/providers/theme_provider.dart';
import 'package:news/presentation/resources/image_path.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
        child: Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    AppImages.newspaper,
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Flexible(child: Text('News'))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomListTile(icon: IconlyBold.home, text: 'Home', onTap: () {}),
          CustomListTile(
              icon: IconlyBold.bookmark, text: 'Bookmark', onTap: () {}),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 3,
          ),
          SwitchListTile(
              title: Text(
                themeProvider.getDarkTheme ? 'Dark' : 'Light',
                style: const TextStyle(fontSize: 20),
              ),
              secondary: Icon(
                themeProvider.getDarkTheme ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.secondary,
              ),
              value: themeProvider.getDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  themeProvider.setDarkTheme = value;
                });
              }),
        ],
      ),
    ));
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  const CustomListTile(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
      onTap: onTap(),
    );
  }
}
