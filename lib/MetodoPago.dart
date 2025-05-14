import 'package:flutter/material.dart';
import 'package:examenmaqueta/main.dart';

// Importante:  Asegúrate de que PaymentMethodScreen esté en el mismo archivo o que esté correctamente importado.
class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  PaymentMethod? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blue period',
          style: TextStyle(color: Color(0xff0e5acd), fontSize: 25),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volver a la pantalla anterior (Carrito)
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Método de Pago',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('Tarjeta'),
              trailing: Radio<PaymentMethod>(
                value: PaymentMethod.card,
                groupValue: _selectedPaymentMethod,
                onChanged: (PaymentMethod? value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = PaymentMethod.card;
                });
              },
            ),
            const Divider(),
            ListTile(
              leading: const Text('OXXO',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              title: const Text('Transferencia'),
              trailing: Radio<PaymentMethod>(
                value: PaymentMethod.oxxoTransfer,
                groupValue: _selectedPaymentMethod,
                onChanged: (PaymentMethod? value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = PaymentMethod.oxxoTransfer;
                });
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para procesar el pago
                  if (_selectedPaymentMethod != null) {
                    print('Pagar con $_selectedPaymentMethod');
                    // Aquí podrías navegar a una pantalla de confirmación
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Por favor, selecciona un método de pago')),
                    );
                  }
                },
                child: const Text('Pagar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum PaymentMethod {
  card,
  oxxoTransfer,
}
