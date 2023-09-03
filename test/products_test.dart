import 'package:flutter_test/flutter_test.dart';
import 'package:login_screen/screens/produits.dart';

void main() {
  group('Card', () {
    test('init', () {
      String id = 'id';
      String name = 'salman';
      String price = '0';
      String description = 'gratuit';
      String color = 'black';
      int stock = -1;

      final Products produit = Products(
          id: id,
          name: name,
          price: price,
          description: description,
          color: color,
          stock: stock);
      expect(produit.id, id);
      expect(produit.name, name);
      expect(produit.price, price);
      expect(produit.description, description);
      expect(produit.color, color);
      expect(produit.stock, stock);
    });
  });
}
