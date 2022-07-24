import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gems_tarifi/domain/states/provider/main_app_state.dart';
import 'package:gems_tarifi/domain/theme/app_theme.dart';
import 'package:provider/provider.dart';

class ToCitation extends StatelessWidget {
  const ToCitation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textEditingController = TextEditingController();
    return Material(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.only(right: 16, top: 16, left: 16, bottom: 16),
        width: double.maxFinite,
        child: Wrap(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: TextFormField(
                autofocus: true,
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Введите значение от 1 до 500',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.mainAccentColor,
                  ),
                  hintText: 'Введите номер цитаты',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.mainAccentColor,
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (currentInputValue) {
                  context
                      .read<MainAppState>()
                      .updateInputText(currentInputValue);
                },
              ),
              trailing: IconButton(
                splashRadius: 20,
                icon: Icon(
                  CupertinoIcons.arrow_turn_up_right,
                  color: Theme.of(context).colorScheme.mainAccentColor,
                ),
                onPressed: () {
                  if (context.read<MainAppState>().getSelectedIndex > 0) {
                    context.read<MainAppState>().updateSelectedIndex(0);
                  }
                  final index =
                      int.parse(context.read<MainAppState>().getInputText);
                  if (index > 0) {
                    if (index < 501) {
                      Future.delayed(
                        Duration(milliseconds: 100),
                        () {
                          context.read<MainAppState>().toIndex(index - 1);
                          Navigator.of(context).pop();
                        },
                      );
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
