import '../../domain/entities/contact.dart';
import '../../domain/repositories/contact_repository.dart';
import '../datasources/contact_local_datasources.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactLocalDataSource localDataSource;

  ContactRepositoryImpl(this.localDataSource);

  @override
  Future<List<Contact>> getContacts() {
    return localDataSource.getContacts();
  }
}
