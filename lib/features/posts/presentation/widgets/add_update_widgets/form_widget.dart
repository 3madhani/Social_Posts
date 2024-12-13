import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/post_entity.dart';

import '../../../../../core/utils/common/widgets/snack_bar.dart';
import '../../bloc/create_delete_update/create_delete_update_bloc.dart';
import 'form_submit_button.dart';
import 'text_field_widget.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdate;
  final PostEntity? postEntity;
  const FormWidget({super.key, required this.isUpdate, this.postEntity});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdate) {
      _titleController.text = widget.postEntity!.title;
      _bodyController.text = widget.postEntity!.body;
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  void validateFormThenUpdateOrAdd() {
    if (_formKey.currentState!.validate()) {
      final postEntity = _createPostEntity();

      if (widget.isUpdate) {
        BlocProvider.of<CreateDeleteUpdateBloc>(context)
            .add(UpdatePostEvent(postEntity: postEntity));
      } else {
        BlocProvider.of<CreateDeleteUpdateBloc>(context)
            .add(CreatePostEvent(postEntity: postEntity));
      }
    } else {
      SnackBarMessage.showErrorSnackBar(
        context: context,
        message: "Please fill out all required fields correctly.",
      );
    }
  }

  PostEntity _createPostEntity() {
    return PostEntity(
      id: widget.isUpdate ? widget.postEntity?.id : null,
      title: _titleController.text.trim(),
      body: _bodyController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // title text field
            TextFormFieldWidget(
              controller: _titleController,
              label: "Title",
              hint: "Enter title",
              validateText: "Title can't be empty",
            ),

            // body text field
            TextFormFieldWidget(
              controller: _bodyController,
              label: "Body",
              hint: "Enter body",
              maxLines: 6,
              validateText: "Body can't be empty",
            ),

            // add or update button
            FormSubmitBtn(
              onPressed: validateFormThenUpdateOrAdd,
              isUpdate: widget.isUpdate,
            ),
          ],
        ),
      ),
    );
  }
}
