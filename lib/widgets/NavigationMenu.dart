// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:eventos_uesb/utils/store/UserStore.dart';

// ignore: camel_case_types
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    BasicCss basicCss = BasicCss();

    return Container(
      height: 50,
      width: mediaQuery.size.width,
      decoration: BoxDecoration(color: basicCss.basicColor),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton.icon(
            icon: const Icon(Icons.home_filled),
            label: const Text('Home'),
            onPressed: () => Navigator.pushNamed(context, '/'),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(basicCss.basicColorSmother))),
        ElevatedButton.icon(
            onPressed: () async {
              if (await UserStore().getUser() != null) {
                Navigator.pushNamed(context, '/usuario');
              } else {
                Navigator.pushNamed(context, '/login');
              }
            },
            label: const Text('Usuário'),
            icon: const Icon(Icons.person),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(basicCss.basicColorSmother))),
        ElevatedButton.icon(
            onPressed: () => {UserStore().deleteUser()},
            label: const Text('Sair'),
            icon: const Icon(Icons.exit_to_app),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(basicCss.basicColorSmother)))
      ]),
    );
  }
}
