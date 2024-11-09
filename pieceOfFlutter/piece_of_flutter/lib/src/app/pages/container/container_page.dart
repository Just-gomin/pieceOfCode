import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:piece_of_flutter/src/app/constants/constants.dart';
import 'package:piece_of_flutter/src/app/core/base_screen.dart';

class ContainerPage extends StatefulWidget {
  static const String pageName = "Container";

  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  final double minWidth = 10;
  final double minHeight = 10;
  final double maxWidth = 300;
  final double maxHeight = 300;

  double width = 100;
  double height = 100;
  AlignmentGeometry alignment = Alignment.center;
  BoxShape shape = BoxShape.rectangle;
  Color color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: ContainerPage.pageName,
      documentFilePath: documentFilePath(resouceName: 'container'),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: maxWidth,
              height: maxHeight,
              alignment: alignment,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  shape: shape,
                  color: color,
                ),
              ),
            ),
          ),

          // Width
          field(context, widgets: [
            const Text("Width"),
            Slider(
              value: width,
              min: minWidth,
              max: maxWidth,
              onChanged: (val) {
                setState(() {
                  width = val;
                });
              },
            ),
            Text("${width.floor()}px"),
          ]),

          // Height
          field(context, widgets: [
            const Text("Height"),
            Slider(
              value: height,
              min: minHeight,
              max: maxHeight,
              onChanged: (val) {
                setState(() {
                  height = val;
                });
              },
            ),
            Text("${height.floor()}px"),
          ]),

          // Alignment
          field(context, widgets: [
            const Text("Alignment"),
            DropdownButton(
              value: alignment,
              items: <DropdownMenuItem<AlignmentGeometry>>[
                DropdownMenuItem(
                  value: Alignment.bottomCenter,
                  child: Text(Alignment.bottomCenter.toString()),
                ),
                DropdownMenuItem(
                  value: Alignment.bottomLeft,
                  child: Text(Alignment.bottomLeft.toString()),
                ),
                DropdownMenuItem(
                  value: Alignment.bottomRight,
                  child: Text(Alignment.bottomRight.toString()),
                ),
                DropdownMenuItem(
                  value: Alignment.center,
                  child: Text(Alignment.center.toString()),
                ),
                DropdownMenuItem(
                  value: Alignment.centerLeft,
                  child: Text(Alignment.centerLeft.toString()),
                ),
                DropdownMenuItem(
                  value: Alignment.centerRight,
                  child: Text(Alignment.centerRight.toString()),
                ),
                DropdownMenuItem(
                  value: Alignment.topCenter,
                  child: Text(Alignment.topCenter.toString()),
                ),
                DropdownMenuItem(
                  value: Alignment.topLeft,
                  child: Text(Alignment.topLeft.toString()),
                ),
                DropdownMenuItem(
                  value: Alignment.topRight,
                  child: Text(Alignment.topRight.toString()),
                ),
              ],
              onChanged: (item) {
                if (item != null) {
                  setState(() {
                    alignment = item;
                  });
                }
              },
            ),
          ]),

          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text(
              "BoxDecoration",
              style: TextStyle(fontSize: 18),
            ),
          ),

          // Shape
          field(context, widgets: [
            const Text("Shape"),
            DropdownButton(
              value: shape,
              items: <DropdownMenuItem<BoxShape>>[
                DropdownMenuItem(
                  value: BoxShape.rectangle,
                  child: Text(BoxShape.rectangle.toString()),
                ),
                DropdownMenuItem(
                  value: BoxShape.circle,
                  child: Text(BoxShape.circle.toString()),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    shape = value;
                  });
                }
              },
            )
          ]),

          // Color
          field(context, widgets: [
            const Text("Color"),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: color,
                          onColorChanged: (pickerColor) {
                            setState(() {
                              color = pickerColor;
                            });
                          },
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("닫기"),
                        )
                      ],
                    );
                  },
                );
              },
              child: const Text("Change Color"),
            )
          ]),
        ],
      ),
    );
  }

  Widget field(BuildContext context, {required List<Widget> widgets}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widgets,
    );
  }
}
