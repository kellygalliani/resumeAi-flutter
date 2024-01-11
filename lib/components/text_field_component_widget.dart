import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_field_component_model.dart';
export 'text_field_component_model.dart';

class TextFieldComponentWidget extends StatefulWidget {
  const TextFieldComponentWidget({
    Key? key,
    this.parameter1,
  }) : super(key: key);

  final String? parameter1;

  @override
  _TextFieldComponentWidgetState createState() =>
      _TextFieldComponentWidgetState();
}

class _TextFieldComponentWidgetState extends State<TextFieldComponentWidget> {
  late TextFieldComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldComponentModel());

    _model.textController ??= TextEditingController(text: widget.parameter1);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController',
                Duration(milliseconds: 100),
                () => setState(() {}),
              ),
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Prompt',
                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                hintStyle: FlutterFlowTheme.of(context).labelMedium,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              maxLines: null,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
          Text(
            valueOrDefault<String>(
              widget.parameter1,
              'Teste',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
        ],
      ),
    );
  }
}
