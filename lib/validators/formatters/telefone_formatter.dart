import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TelefoneFormatter extends MaskTextInputFormatter {
  String initialText;

  TelefoneFormatter({this.initialText = ''})
      : super(
          mask: '(##) #####-####',
          type: MaskAutoCompletionType.lazy,
          filter: {"#": RegExp(r'[0-9]')},
          initialText: initialText,
        );
}
