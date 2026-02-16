import '../../domain/entities/contact.dart';

class ContactModel extends Contact {
  ContactModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
    required super.image,
  });
}
