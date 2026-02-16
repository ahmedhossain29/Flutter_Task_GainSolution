import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_contacts.dart';
import 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final GetContacts getContacts;

  ContactCubit(this.getContacts) : super(ContactInitial());

  Future<void> fetchContacts() async {
    emit(ContactLoading());

    try {
      final data = await getContacts();
      emit(ContactLoaded(data));
    } catch (_) {
      emit(ContactError());
    }
  }
}
