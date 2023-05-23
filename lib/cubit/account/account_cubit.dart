import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_quiz/data/datasources/firebase_database_datasource.dart';

import '../../data/local/shared_preferences_data.dart';
import '../../data/models/account.dart';

part 'account_cubit.freezed.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(
    this._datasource,
  ) : super(const AccountState.initial());
  final FirebaseDatabaseDatasource _datasource;

  void loadAccount() async {
    try {
      emit(const AccountState.loading());
      final account = await SharedPreferencesData.getAccount();
      emit(AccountState.loaded(account));
    } catch (e) {
      emit(AccountState.error(e.toString()));
    }
  }

  void updateAccount(Account account) async {
    try {
      emit(const AccountState.loading());
      await SharedPreferencesData.saveAccount(account);
      _datasource.updateAccount(account.id, account);
      emit(AccountState.loaded(account));
    } catch (e) {
      emit(AccountState.error(e.toString()));
    }
  }
}
