// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';

class ListOfElements extends StatelessWidget {
  const ListOfElements({super.key, required this.data});
  final List data;
  @override
  build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    var height = (114 * data.length) * 1.0;
    return SizedBox(
        height: height,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: data.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Container(
                color: basicCss.basicColor,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(data[index][2],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                      Text(data[index][1],
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20)),
                      Text(data[index][0].replaceAll('{', ''),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20)),
                      Text(data[index][3].replaceAll('}', ''),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20)),
                      const Divider(thickness: 10, color: Colors.grey)
                    ]));
          },
        ));
  }
}
