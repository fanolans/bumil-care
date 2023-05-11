import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import 'package:flutter_quiz/ui/pages/profile/components/profile_ui_label.dart';

import '../../../../common/constant/string_constant.dart';
import '../../../../data/models/account.dart';
import '../../../widget/input.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({
    super.key,
    required GlobalKey<FormBuilderState> fbKey,
    required this.account,
    required this.emailController,
    required this.nameController,
    required this.dateController,
    required this.ageController,
    required this.heightController,
    required this.weightController,
    required this.onBirthDateSaved,
  }) : _fbKey = fbKey;

  final GlobalKey<FormBuilderState> _fbKey;
  final Account account;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController dateController;
  final TextEditingController ageController;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final Function(DateTime?) onBirthDateSaved;
  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget._fbKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(widget.account.photoURL),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 24,
          ),
          const ProfileLabel(
            name: StringConstant.profileEmailLabel,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 500,
          ),
          FleetimeTextField(
            controller: widget.emailController,
            hintText: '',
            name: 'email',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 36,
          ),
          const ProfileLabel(
            name: StringConstant.profileNameLabel,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 500,
          ),
          FleetimeTextField(
            hintText: '',
            controller: widget.nameController,
            name: 'name',
            keyboardType: TextInputType.name,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 36,
          ),
          const ProfileLabel(
            name: StringConstant.profileDateOfBirthLabel,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 500,
          ),
          FleetimeDatePicker(
            name: 'date',
            hintText: widget.account.birthDate,
            initialDate: widget.account.birthDate == ''
                ? DateTime.now()
                : DateTime.parse(widget.account.birthDate),
            onChanged: widget.onBirthDateSaved,
            onSaved: widget.onBirthDateSaved,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 36,
          ),
          const ProfileLabel(
            name: StringConstant.profileAgeLabel,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 500,
          ),
          FleetimeTextField(
            hintText: '',
            name: 'age',
            controller: widget.ageController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 36,
          ),
          const ProfileLabel(
            name: StringConstant.profileHeightLabel,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 500,
          ),
          FleetimeTextField(
            hintText: '',
            name: 'height',
            controller: widget.heightController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 36,
          ),
          const ProfileLabel(
            name: StringConstant.profileWeightLabel,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 500,
          ),
          FleetimeTextField(
            hintText: '',
            name: 'weight',
            controller: widget.weightController,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}

class FleetimeDatePicker extends StatelessWidget {
  const FleetimeDatePicker({
    Key? key,
    required this.name,
    required this.hintText,
    required this.initialDate,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onReset,
  }) : super(key: key);

  final String name;
  final String hintText;
  final DateTime initialDate;
  final String? Function(DateTime?)? validator;
  final void Function(DateTime?)? onChanged;
  final void Function(DateTime?)? onSaved;
  final void Function()? onReset;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: name,
      onChanged: onChanged,
      onSaved: onSaved,
      onReset: onReset,
      initialValue: initialDate,
      inputType: InputType.date,
      enableInteractiveSelection: true,
      initialDatePickerMode: DatePickerMode.year,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      keyboardType: TextInputType.datetime,
      format: DateFormat('EEEE, dd MMMM yyyy', 'id'),
      validator: validator,
      decoration: InputDecoration(
        filled: false,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 24,
          maxWidth: 24,
        ),
        suffixIcon: Icon(
          Icons.calendar_today,
          color: Theme.of(context).primaryColor,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}
