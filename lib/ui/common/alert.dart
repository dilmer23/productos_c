import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertsTemplate {
   static _seleccionarIconoTipo(String tipo) {
    // ignore: no_leading_underscores_for_local_identifiers
    dynamic _tipo;
    switch (tipo) {
      case 'success':
        _tipo = AlertType.success;
        break;
      case 'error':
        _tipo = AlertType.error;
        break;
      case 'info':
        _tipo = AlertType.info;
        break;
      case 'warning':
        _tipo = AlertType.warning;
        break;
      default:
        _tipo = AlertType.none;
    }
    return _tipo;
  }

  static alertCustom(String tipo, Function onPressed,
      {dynamic context,
      Color? colors,
      dynamic borderRadius,
      String? title,
      String? desc,
      Widget? content,
      required bool onWillPopActive}) {
      dynamic iconoTipo = _seleccionarIconoTipo(tipo);
    return Alert(
      context: context,
      closeFunction: () => onPressed(true),
      closeIcon: Container(),
      type: iconoTipo,
      title: title,
      desc: desc,
      onWillPopActive: onWillPopActive,
      buttons: [
        DialogButton(
            onPressed: () {
              onPressed(true);
            },
            color: colors,
            radius: borderRadius,
            child: content),
      ],
    ).show();
  }
}
