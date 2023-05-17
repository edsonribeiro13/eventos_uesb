// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:eventos_uesb/controller/ControllerDropDown.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:eventos_uesb/domain/Events.dart';
import 'package:eventos_uesb/widgets/FormCamp.dart';

List<String> list = <String>['Data', 'Departamento'];

class DropdownMenu extends State<DropdownButtonState> {
  var telaCriarEvento = false;
  @override
  void initState() {
    super.initState();
    telaCriarEvento = Events.getTelaCriarEvento();

    if (telaCriarEvento) {
      list = ['Não', 'Sim'];
    }
  }

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    String dropdownValue = list.first;
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward,
          size: telaCriarEvento ? 25 : 35, color: Colors.black),
      elevation: 16,
      style:
          TextStyle(color: Colors.black, fontSize: telaCriarEvento ? 15 : 30),
      borderRadius: BorderRadius.circular(20),
      underline: Container(
        height: 2,
        color: basicCss.basicColor,
      ),
      onChanged: (String? value) {
        setState(() {
          Events.setFilterClause(value);
          dropdownValue = value!;
        });
        CampoForm.updateFilterClause();
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
