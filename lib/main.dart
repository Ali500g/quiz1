import 'dart:io';

class Product {
  String name;
  double price;
  Product(this.name, this.price);
}

class ShoppingCart {
  List<Product> _cart = [];

  void addProduct(Product product) {
    _cart.add(product);
    print('${product.name} added to the cart.');
  }

  void showCart() {
    if (_cart.isEmpty) {
      print('Your cart is empty.');
    } else {
      print('\nYour Cart:');
      for (var product in _cart) {
        print('- ${product.name}: \$${product.price}');
      }
      print('Total price: \$${totalPrice()}');
    }
  }

  double totalPrice() {
    return _cart.fold(0, (sum, product) => sum + product.price);
  }
}

void main() {
  List<Product> products = [
    Product('Handfree', 100.00),
    Product('Iphone', 100000),
    Product('Mouse', 149.00),
    Product('Watch', 110.00),
  ];
  ShoppingCart cart = ShoppingCart();

  while (true) {
    print('\nAvailable Products:');
    for (int i = 0; i < products.length; i++) {
      print('${i + 1}. ${products[i].name} - \$${products[i].price}');
    }
    print('${products.length + 1}. View Cart');
    print('${products.length + 2}. Exit');

    stdout.write('\nSelect a product by number or other option: ');
    String? input = stdin.readLineSync();
    int? selected = int.tryParse(input ?? '');

    if (selected != null) {
      if (selected >= 1 && selected <= products.length) {
        cart.addProduct(products[selected - 1]);
      } else if (selected == products.length + 1) {
        cart.showCart();
      } else if (selected == products.length + 2) {
        print('Exiting the application.');
        break;
      } else {
        print('Invalid choice. Please try again.');
      }
    } else {
      print('Invalid input. Please enter a number.');
    }
  }
}