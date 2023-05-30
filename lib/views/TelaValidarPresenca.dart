// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:scan/scan.dart';
import 'package:eventos_uesb/domain/Events.dart';
import 'package:eventos_uesb/controller/ControllerTelaValidarPresenca.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';

class TelaValidarPresenca extends State<ControllerTelaValidarPresenca> {
  ScanController controller = ScanController();
  String message = '';

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    controller.resume();
    return Scaffold(
        body: Container(
            decoration: basicCss.iniatilzeDefaultBackground(),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  width: 400, // custom wrap size
                  height: 250,
                  child: ScanView(
                    controller: controller,
// custom scan area, if set to 1.0, will scan full area
                    scanAreaScale: .7,
                    scanLineColor: Colors.green.shade400,
                    onCapture: (data) {
                      var event = Events.getEventDetailed();
                      if (event['id'] == data) {
                        setState(() {
                          message = 'Usuário homologado';
                        });
                      } else {
                        setState(() {
                          message = 'QRCode não pertence ao evento';
                        });
                      }
                    },
                  )),
              Text(
                message,
                style: const TextStyle(
                    backgroundColor: Colors.white, fontSize: 20),
              )
            ])));
  }
}
