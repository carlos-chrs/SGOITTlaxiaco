import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:web_app_tec/utils/screen_size.dart';
import 'package:web_app_tec/widgets/boton_filtrado.dart';
import 'package:web_app_tec/widgets/calendar_button.dart';
import 'package:web_app_tec/widgets/search_bar.dart';

class CustomSearchTab extends StatelessWidget {
  const CustomSearchTab({
    required this.heigthFilterButtons,
    super.key,
    required this.maxWidthBar,
    required this.widthFilterButtons,
  });
  final double maxWidthBar;
  //  = 930.0;
  final double widthFilterButtons;
  // 140.0;
  final double heigthFilterButtons;
  // final _dates;
  @override
  Widget build(BuildContext context) {
    ScreenSize.i.upadate(context);
    // print(ScreenSize.i.width);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: CustomSearchBar(
                controller: TextEditingController(),
                action: buscarAction,
                width: ScreenSize.i.width <= maxWidthBar
                    ? ScreenSize.i.width * 0.9
                    : 400,
                heigth: heigthFilterButtons,
              ),
            ),
            ScreenSize.i.width > maxWidthBar
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilterButtom(
                      hint: "Asunto",
                      action: asuntoAction,
                      width: widthFilterButtons,
                      heigth: heigthFilterButtons,
                      icon: const Icon(Icons.book),
                    ),
                  )
                : const SizedBox(),
            ScreenSize.i.width > maxWidthBar
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilterButtom(
                      hint: "Dirigido a",
                      action: dirigidoAAction,
                      width: widthFilterButtons,
                      heigth: heigthFilterButtons,
                      icon: const Icon(Icons.group),
                    ),
                  )
                : const SizedBox(),
            ScreenSize.i.width > maxWidthBar
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CalenarButton(
                        text: "Fecha",
                        action: () => calendarAction(context),
                        width: widthFilterButtons,
                        heigth: heigthFilterButtons),
                  )
                : const SizedBox(),
          ],
        ),
        ScreenSize.i.width < maxWidthBar
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilterButtom(
                      hint: "Asunto",
                      action: asuntoAction,
                      width: ScreenSize.i.width * 0.3,
                      heigth: 50,
                      icon: const Icon(Icons.book),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilterButtom(
                      hint: "Dirigido a",
                      action: dirigidoAAction,
                      width: ScreenSize.i.width * 0.3,
                      heigth: 50,
                      icon: const Icon(Icons.group),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CalenarButton(
                        text: "",
                        action: () => calendarAction(context),
                        width: 50,
                        heigth: 50),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}

void asuntoAction() {}
void dirigidoAAction() {}

void buscarAction() {}

Future<void> calendarAction(BuildContext context) async {
  List<DateTime?> dates = [];
  var results = await showCalendarDatePicker2Dialog(
    context: context,
    config: CalendarDatePicker2WithActionButtonsConfig(),
    dialogSize: const Size(325, 400),
    value: dates,
    borderRadius: BorderRadius.circular(15),
  );
}
