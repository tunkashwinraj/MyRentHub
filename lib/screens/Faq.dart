import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/clickabletext.dart';
class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 20,),
              Text( 'Frequently Asked Quesation ',style: TextStyle(fontSize: 18)),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ClickableText(
                      title: '1. How do I create an account onthe\nonline shopping app?',
                      details:
                      ' To create an account, simply download the app, click on the "Sign Up" button, and follow the prompts to enter your details.',
                    ),
                    SizedBox(height: 5,),
                    ClickableText(
                      title: '2. What payment methods are\naccepted on the app?',
                      details:
                      'We accept various payment methods, including credit/debit cards, digital wallets, and other secure payment options. You can check the available payment methods during the checkout process.',
                    ),
                    SizedBox(height: 5,),
                    ClickableText(
                      title: '3. How can I track my order?',
                      details:
                      'You can track your order by navigating to the "Order History" section in your account. Once your order is shipped, you will receive a tracking number via email, allowing you to monitor the delivery status in real-time.',
                    ),
                    SizedBox(height: 5,),
                    ClickableText(
                      title: '4. What is the return policy?',
                      details:
                      'Our return policy is designed to ensure your satisfaction. You can find detailed information on our return policy, including eligibility, timelines, and procedures, in the "Returns and Refunds" section on our website or app.',
                    ),
                    SizedBox(height: 5,),
                    ClickableText(
                      title: '5. How do I change or cancel an order?',
                      details:
                      "To change or cancel an order, go to the 'Order History' section in your account. If the order is still in processing, you may have the option to make changes. Once it's shipped, please contact our customer support for assistance.",
                    ),
                    SizedBox(height: 5,),
                    ClickableText(
                      title: '6. Are there any discounts or\npromotions available?',
                      details:
                      'Keep an eye on our app for regular promotions, discounts, and special offers. You can also subscribe to our newsletter to receive exclusive deals and updates on upcoming sales.',
                    ),
                    SizedBox(height: 5,),
                    ClickableText(
                      title: '7. How can I contact customer\nsupport?',
                      details:
                      "If you have any questions or concerns, our customer support team is here to help. You can reach us through the 'Contact Us' section in the app, where you'll find options for live chat, email, or phone support.",
                    ),
                    SizedBox(height: 5,),
                    ClickableText(
                      title: '8. Is my personal information secure?',
                      details:
                      'We take your privacy seriously. Our app uses advanced security measures to protect your personal information. You can learn more about our privacy policy in the "Privacy Settings" section of the app.',
                    ),
                    SizedBox(height: 5,),
                    ClickableText(
                      title: '9. Can I save items for later or create\na wishlist?',
                      details:
                      "Yes, you can! Use the 'Save for Later' or 'Add to Wishlist' option when viewing a product. This allows you to keep track of items you're interested in without immediately making a purchase.",
                    ),
                    SizedBox(height: 5,),
                    ClickableText(
                      title: '10. How can I provide feedback\non the app?',
                      details:
                      'We appreciate your feedback! You can share your thoughts through the "Feedback" option in the app or by leaving a review on the app store. Your input helps us enhance your shopping experience.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
