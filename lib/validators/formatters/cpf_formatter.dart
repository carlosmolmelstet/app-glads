import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CPFFormatter extends MaskTextInputFormatter {
  String initialText;

  CPFFormatter({this.initialText = ''})
      : super(
          mask: '###.###.###-##',
          type: MaskAutoCompletionType.lazy,
          filter: {"#": RegExp(r'[0-9]')},
          initialText: initialText,
        );
}
