import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class ReactiveCheckBoxRenderer extends FormElementRenderer<model.CheckBox> {
  @override
  Widget render(
      model.CheckBox element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          StreamBuilder<bool>(
            initialData: element.value.value,
            stream: element.value.valueChanged,
            builder: (context, snapshot) {
              return Checkbox(
                onChanged: (value) =>
                    dispatcher(ChangeValueEvent(value, element.id)),
                value: snapshot.data,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: StreamBuilder<String>(
              initialData: element.label.value,
              stream: element.label.valueChanged,
              builder: (context, snapshot) {
                return Text(snapshot.data);
              },
            ),
          )
        ],
      ),
    );
  }
}