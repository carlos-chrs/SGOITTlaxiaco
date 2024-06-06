import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_tec/models/usuario_global.dart';
import 'package:web_app_tec/prividers/users_provoder.dart';

// stores ExpansionPanel state information
class ExpansionPanelListRadioExample extends StatefulWidget {
  const ExpansionPanelListRadioExample({
    super.key,
  });

  @override
  State<ExpansionPanelListRadioExample> createState() =>
      _ExpansionPanelListRadioExampleState();
}

class _ExpansionPanelListRadioExampleState
    extends State<ExpansionPanelListRadioExample> {
  List<UserGlobal>? users;

  @override
  Widget build(BuildContext context) {
    users = context.watch<UsersProvider>().users!.docs;

    return SingleChildScrollView(
      child: Container(
        child: users == null
            ? const Text('no hay nada par mostrar')
            : _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 1,
      children: context
          .watch<UsersProvider>()
          .users!
          .docs!
          .map<ExpansionPanelRadio>((UserGlobal item) {
        return ExpansionPanelRadio(
            value: item.sId!,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.name!),
              );
            },
            body: ListTile(
                title: const Text('por generar espacios'),
                subtitle:
                    const Text('To delete this panel, tap the trash can icon'),
                trailing: const Icon(Icons.delete),
                onTap: () {
                  setState(() {
                    users!.removeWhere(
                        (UserGlobal currentItem) => item == currentItem);
                  });
                }));
      }).toList(),
    );
  }
}
