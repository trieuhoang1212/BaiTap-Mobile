import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedPaymentMethod;

  // Hàm trả về đường dẫn logo tương ứng
  String getSelectedLogo() {
    switch (selectedPaymentMethod) {
      case 'paypal':
        return 'assets/images/Paypal-Logo.png';
      case 'google_pay':
        return 'assets/images/Google_Pay-Logo.png';
      case 'apple_pay':
        return 'assets/images/Apple_Pay-Logo.png';
      default:
        return 'assets/images/mobile-payment.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 100,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SizedBox(
            height: 80,
            width: 80,
            child: Center(
              child: selectedPaymentMethod == null
                  ? const Icon(
                      Icons.payment,
                      size: 80,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )
                  : Image.asset(
                      getSelectedLogo(),
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.payment,
                          size: 120,
                          color: Color.fromARGB(255, 0, 0, 0),
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            buildPaymentMethod('PayPal', 'paypal', 'Paypal-Logo'),
            const SizedBox(height: 16),
            buildPaymentMethod('Google Pay', 'google_pay', 'Google_Pay-Logo'),
            const SizedBox(height: 16),
            buildPaymentMethod('Apple Pay', 'apple_pay', 'Apple_Pay-Logo'),
            const Spacer(),
            // Nút Continue
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: selectedPaymentMethod != null
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Đã chọn: $selectedPaymentMethod'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A90E2),
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentMethod(String title, String value, String imagePath) {
    bool isSelected = selectedPaymentMethod == value;

    return SizedBox(
      height: 70, // Chiều cao cố định cho tất cả các ô
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF4A90E2) : Colors.grey.shade300,
            width: isSelected ? 2.5 : 1.5,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: RadioListTile<String>(
          value: value,
          // ignore: deprecated_member_use
          groupValue: selectedPaymentMethod,
          activeColor: const Color(0xFF4A90E2),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          // ignore: deprecated_member_use
          onChanged: (String? newValue) {
            setState(() {
              selectedPaymentMethod = newValue;
            });
          },
          title: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? Colors.black87 : Colors.black54,
                ),
              ),
              const Spacer(),
              Image.asset(
                'assets/images/$imagePath.png',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.payment,
                    size: 40,
                    color: isSelected ? const Color(0xFF4A90E2) : Colors.grey,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
