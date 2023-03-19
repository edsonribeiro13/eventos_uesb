// ignore_for_file: file_names

import 'package:eventos_uesb/domain/Events.dart';
import 'package:flutter/material.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';

class ListOfElements extends StatelessWidget {
  const ListOfElements({super.key, required this.data});
  final List data;
  @override
  build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    var height = (126 * data.length) * 1.0;
    return SizedBox(
        height: height,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: data.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Card(
                shadowColor: basicCss.basicColor,
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: basicCss.basicColorSmother,
                child: GestureDetector(
                    onTap: () => {
                          Events.setEventDetailed(data[index]),
                          Navigator.pushNamed(context, '/eventDetails')
                        },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(data[index]['nome'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22)),
                          Text(data[index]['local'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily: 'courier')),
                          Text(data[index]['departamento'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily: 'courier')),
                          Text(data[index]['data'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily: 'courier')),
                          const Divider(
                              thickness: 10, color: Colors.transparent)
                        ])));
          },
        ));
  }
}
