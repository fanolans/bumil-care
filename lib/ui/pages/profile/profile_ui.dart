import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:intl/intl.dart';

import '../../../common/constant/string_constant.dart';
import '../../../cubit/account/account_cubit.dart';
import '../../../data/models/account.dart';
import '../../widget/appbar.dart';
import '../../widget/button.dart';
import 'components/profile_ui_form.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  void _onBirthDateSaved(DateTime? value) {
    if (value == null) return;
    _dateController.text = DateFormat('yyyy-MM-dd').format(value);
  }

  Account? currentAccount;

  @override
  void initState() {
    context.read<AccountCubit>().loadAccount();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: StringConstant.profileTitle,
      ),
      body: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loaded: (state) {
              currentAccount = state.account;
              _emailController.text = state.account.email;
              _nameController.text = state.account.name;
              _dateController.text = state.account.birthDate;
              _ageController.text = state.account.age;
              _heightController.text = state.account.height;
              _weightController.text = state.account.weight;
              return Scrollbar(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ProfileForm(
                      fbKey: _fbKey,
                      account: state.account,
                      emailController: _emailController,
                      nameController: _nameController,
                      dateController: _dateController,
                      ageController: _ageController,
                      heightController: _heightController,
                      weightController: _weightController,
                      onBirthDateSaved: _onBirthDateSaved,
                    ),
                  ),
                ),
              );
            },
            error: (state) {
              return Center(
                child: Text(state.message),
              );
            },
          );
        },
      ),
      bottomNavigationBar: FleetimeButton(
        text: StringConstant.profileButton,
        onPressed: () {
          if (_emailController.text.isNotEmpty &&
              _nameController.text.isNotEmpty &&
              _dateController.text.isNotEmpty &&
              _ageController.text.isNotEmpty &&
              _heightController.text.isNotEmpty &&
              _weightController.text.isNotEmpty) {
            final account = Account(
              id: currentAccount!.id,
              photoURL: currentAccount!.photoURL,
              email: _emailController.text,
              name: _nameController.text,
              birthDate: _dateController.text,
              age: _ageController.text,
              height: _heightController.text,
              weight: _weightController.text,
            );
            context.read<AccountCubit>().updateAccount(account);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Profil berhasil diupdate'),
              ),
            );
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Semua field harus diisi'),
              ),
            );
          }
        },
      ),
    );
  }
}
