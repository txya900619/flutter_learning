import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:test_flutter/blocs/color/color_bloc.dart';

class ColorPickerCard extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return BlocBuilder<ColorBloc, ColorState>(builder: (ctx, state) {
      return Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.white70,
              elevation: 3,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "CC",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  GridView.count(
                    padding: const EdgeInsets.all(20.0),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.7,
                    children: state.colorList
                        .asMap()
                        .map((index, e) {
                          return MapEntry(
                              index,
                              GestureDetector(
                                child: Material(
                                  shape: CircleBorder(
                                    side: state.colorIndex == index
                                        ? BorderSide(width: 2)
                                        : BorderSide.none,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: e,
                                    child: state.colorIndex == index
                                        ? Icon(Icons.touch_app,
                                            color: ThemeData
                                                        .estimateBrightnessForColor(
                                                            e) ==
                                                    Brightness.light
                                                ? Colors.black
                                                : Colors.white)
                                        : null,
                                  ),
                                ),
                                onTap: () {
                                  ctx
                                      .bloc<ColorBloc>()
                                      .add(ColorSelected(index: index));
                                },
                                onLongPress: () {
                                  showColorPickerDialog(
                                      ctx: ctx, index: index, currentColor: e);
                                },
                              ));
                        })
                        .values
                        .toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

Future<void> showColorPickerDialog(
    {BuildContext ctx, int index, Color currentColor}) async {
  Color _insideColor = currentColor;
  showDialog(
    context: ctx,
    barrierDismissible: true,
    builder: (ctx) {
      return AlertDialog(
        title: Text("Pick a color"),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: _insideColor,
            enableAlpha: false,
            showLabel: true,
            paletteType: PaletteType.hsv,
            pickerAreaBorderRadius: BorderRadius.circular(10),
            onColorChanged: (newColor) {
              _insideColor = newColor;
            },
            pickerAreaHeightPercent: 0.6,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("cancel"),
            onPressed: () {
              Navigator.of(ctx).pop(null);
            },
          ),
          FlatButton(
            child: Text("ok"),
            onPressed: () {
              ctx
                  .bloc<ColorBloc>()
                  .add(ColorChanged(index: index, color: _insideColor));
              Navigator.of(ctx).pop(null);
            },
          )
        ],
      );
    },
  );
}
