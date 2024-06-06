import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_tec/prividers/login_provider.dart';
import 'package:web_app_tec/prividers/users_provoder.dart';
import 'package:web_app_tec/services/users_service.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/add_user_panel.dart';
import 'package:web_app_tec/widgets/app_expansion_tile.dart';
import 'package:web_app_tec/widgets/custombuttom.dart';
import 'package:web_app_tec/widgets/popup_menu.dart';
import 'package:web_app_tec/widgets/search_bar.dart';
import 'package:web_app_tec/widgets/title_bar.dart';

class AdminUsersPage extends StatelessWidget {
  AdminUsersPage({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    return Scaffold(
      body: SizedBox(
        height: ScreenSize.i.heigth,
        child: SingleChildScrollView(
          child: SizedBox(
            height: ScreenSize.i.heigth - 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleBar(
                    menu: const PopupMenu(),
                    nombreUsuario:
                        context.watch<LoginProvider>().usuarioLocal!.name!,
                    puesto: ""),
                Container(
                  alignment: Alignment.center,
                  width: ScreenSize.i.width - 10,
                  height: 80,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "USUARIOS",
                              style: TextStyle(
                                fontSize: ScreenSize.i.width < 600 ? 20 : 28,
                              ),
                            ),
                          ),
                        ),
                        CustomSearchBar(
                          controller: searchController,
                          action: () async {
                            try {
                              final searchResult =
                                  await UsersService.getUsersByName(
                                      searchController.text,
                                      context
                                          .watch<LoginProvider>()
                                          .usuarioLocal!
                                          .token!);
                              searchController.text = '';
                              context
                                  .read<UsersProvider>()
                                  .updateUsers(searchResult);
                            } catch (e) {
                              //
                            }
                          },
                          width: ScreenSize.i.width < 600
                              ? ScreenSize.i.width * 0.4
                              : 300,
                          heigth: 50,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CustomButtom(
                            action: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title:
                                        const Text('Agregar un nuevo usuario'),
                                    content: AddUserPanel(),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancelar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            text: 'nuevo',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenSize.i.heigth > 600
                      ? ScreenSize.i.heigth * 0.7
                      : ScreenSize.i.heigth * 0.52,
                  width: ScreenSize.i.width * 0.90,
                  child: const ExpansionPanelListRadioExample(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
