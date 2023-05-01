// ignore_for_file: file_names
import 'package:eventos_uesb/domain/Events.dart';
import 'package:eventos_uesb/assets/css/BasicCSS.dart';
import 'package:flutter/material.dart';
import 'package:eventos_uesb/widgets/NavigationMenu.dart';
import 'package:eventos_uesb/controller/ControllerOrganizacao.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

class TelaControleOrganizacao extends State<ControllerOrganizacao> {
  bool subscribed = false;
  var textFieldController = TextEditingController();
  bool insertError = false;
  var collaborators = Events.getCollaborators();
  var managers = Events.getManager();
  var userIsAdmin = Events.getUserIsAdmin();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BasicCss basicCss = BasicCss();
    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
              vertical: mediaQuery.size.height / 8, horizontal: 0),
          decoration: basicCss.iniatilzeDefaultBackground(),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                  errorText: insertError == true ? "CPF inválido" : null,
                  filled: true,
                  fillColor: Colors.white,
                  label: Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child: Text(userIsAdmin
                            ? 'CPF organizador'
                            : 'CPF colaborador'))
                  ]))),
            ),
            TextButton(
                onPressed: () async => {
                      if (CPFValidator.isValid(textFieldController.text) ==
                          false)
                        {
                          textFieldController.text = '',
                          setState(() => insertError = true)
                        }
                      else if (userIsAdmin)
                        {
                          await Events.setNewCollaborator(
                              textFieldController.text, 'manager'),
                          textFieldController.text = '',
                          setState(() => {
                                managers = Events.getManager(),
                                insertError = false
                              }),
                        }
                      else
                        {
                          await Events.setNewCollaborator(
                              textFieldController.text, 'collaborator'),
                          textFieldController.text = '',
                          setState(() => {
                                collaborators = Events.getCollaborators(),
                                insertError = false
                              })
                        },
                    },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: basicCss.basicColor,
                    textStyle:
                        const TextStyle(fontSize: 15, fontFamily: 'arial')),
                child: Text(userIsAdmin
                    ? 'Adicionar organizador'
                    : 'Adicionar colaborador')),
            (userIsAdmin && managers.length > 0) || collaborators.length > 0
                ? SizedBox(
                    height: (50.0 *
                        (userIsAdmin ? managers.length : collaborators.length)),
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        itemCount: userIsAdmin
                            ? managers.length
                            : collaborators.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Container(
                              color: basicCss.basicColorSmother,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        userIsAdmin
                                            ? managers[index]
                                            : collaborators[index],
                                        style: const TextStyle(
                                            fontFamily: 'arial')),
                                    IconButton(
                                        iconSize: 20,
                                        onPressed: () async => {
                                              await Events.removeCollaborator(
                                                  userIsAdmin
                                                      ? managers[index]
                                                      : collaborators[index],
                                                  userIsAdmin
                                                      ? 'manager'
                                                      : 'collaborator'),
                                              setState(() => {
                                                    if (userIsAdmin)
                                                      {
                                                        managers =
                                                            Events.getManager()
                                                      }
                                                    else
                                                      {
                                                        collaborators = Events
                                                            .getCollaborators()
                                                      }
                                                  })
                                            },
                                        icon: const Icon(Icons.delete))
                                  ]));
                        }))
                : Text(userIsAdmin
                    ? "Novos organizadores aparecerão aqui"
                    : "Novos colaboradores aparecerão aqui"),
            TextButton(
                onPressed: () => {
                      Events.insertArrayOfCollaborattors(
                          userIsAdmin ? 'manager' : 'collaborator'),
                      Navigator.pop(context)
                    },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: basicCss.basicColor,
                    textStyle:
                        const TextStyle(fontSize: 15, fontFamily: 'arial')),
                child: const Text('Salvar equipe'))
          ]),
        ),
        bottomNavigationBar: const NavigationMenu());
  }
}
