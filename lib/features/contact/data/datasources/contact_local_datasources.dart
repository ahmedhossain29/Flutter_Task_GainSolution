import '../model/contact_model.dart';

class ContactLocalDataSource {
  Future<List<ContactModel>> getContacts() async {
    await Future.delayed(const Duration(milliseconds: 600));

    return [
      ContactModel(
        name: "Michale Kahnwald",
        email: "michel@email.com",
        phone: "+12 34 56 78 90",
        address: "12A, Lillistrom, Norway",
        image: "https://i.pravatar.cc/150?img=3",
      ),
      ContactModel(
        name: "Noah",
        email: "michel@email.com",
        phone: "+12 34 56 78 90",
        address: "12A, Lillistrom, Norway",
        image: "https://i.pravatar.cc/150?img=5",
      ),
      ContactModel(
        name: "Jonus Kahnwald",
        email: "michel@email.com",
        phone: "+12 34 56 78 90",
        address: "12A, Lillistrom, Norway",
        image: "https://i.pravatar.cc/150?img=7",
      ),
      ContactModel(
        name: "Ahmed",
        email: "michel@email.com",
        phone: "+12 34 56 78 90",
        address: "12A, Lillistrom, Norway",
        image: "https://i.pravatar.cc/150?img=5",
      ),
    ];
  }
}
