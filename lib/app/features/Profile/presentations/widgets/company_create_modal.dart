import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quirckly/app/core/helper/snackbar_helper.dart';
import 'package:quirckly/app/core/themes/app_colors.dart';
import 'dart:io';

import 'package:quirckly/app/core/themes/app_textstyles.dart';
import 'package:quirckly/app/features/Profile/data/models/request/create_company_request_model.dart';
import 'package:quirckly/app/features/Profile/presentations/bloc/create_company_bloc/create_company_bloc.dart';

class CompanyCreateModal extends StatefulWidget {
  const CompanyCreateModal({super.key});

  @override
  _CompanyCreateModalState createState() => _CompanyCreateModalState();
}

class _CompanyCreateModalState extends State<CompanyCreateModal> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Buat Company Baru'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bagian Pilih Gambar
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _imageFile == null
                    ? const Icon(Icons.add_photo_alternate, size: 50)
                    : Image.file(_imageFile!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),

            // Input Nama Company
            TextField(
              controller: _nameController,
              style: bodyBaseTextStyle.copyWith(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nama Company',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Input Deskripsi Company
            TextField(
              style: bodyBaseTextStyle.copyWith(color: Colors.white),
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Deskripsi Company',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Batal'),
        ),
        BlocConsumer<CreateCompanyBloc, CreateCompanyState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              done: (response) => Navigator.of(context).pop(),
              error: (failure) =>
                  SnackbarHelper.showSnackBar(context, failure.message),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return ElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isNotEmpty &&
                        _descriptionController.text.isNotEmpty) {
                      CreateCompanyRequestModel request =
                          CreateCompanyRequestModel(
                        name: _nameController.text,
                        description: _descriptionController.text,
                        image: _imageFile,
                      );
                      context.read<CreateCompanyBloc>().add(
                            CreateCompanyEvent.createCompany(request),
                          );
                    }
                  },
                  child: Text(
                    'Simpan',
                    style: regularTextStyle.copyWith(color: textColor),
                  ),
                );
              },
              loading: () {
                return ElevatedButton(
                  onPressed: null,
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
