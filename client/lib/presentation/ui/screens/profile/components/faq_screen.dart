import 'package:flutter/material.dart';

import '../../../../../core/constants/app/color_strings.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColor.appBarColor,
        title: const Text(
          'Frequently Asked Questions',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...faqCategories.map((category) {
              return ExpansionTile(
                title: Text(category.name),
                children: [
                  ...category.questions.map((question) {
                    return ListTile(
                      title: Text(question.text),
                      subtitle: Text(question.answer),
                    );
                  })
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class FAQCategory {
  final String name;
  final List<FAQQuestion> questions;

  FAQCategory({
    required this.name,
    required this.questions,
  });
}

class FAQQuestion {
  final String text;
  final String answer;

  FAQQuestion({
    required this.text,
    required this.answer,
  });
}

final faqCategories = [
  FAQCategory(
    name: 'Orders',
    questions: [
      FAQQuestion(
          text: 'Siparişimi nasıl takip edebilirim?',
          answer:
              'Siparişinizi takip etmek için, Hesabım > Siparişlerim bölümüne gidin.'),
      FAQQuestion(
          text: 'Siparişimi nasıl iptal edebilirim?',
          answer:
              'Siparişinizi iptal etmek için, Hesabım > Siparişlerim bölümüne gidin ve iptal etmek istediğiniz siparişi bulun. Siparişi iptal etmek için "İptal Et" düğmesine tıklayın.'),
    ],
  ),
  FAQCategory(
    name: 'Products',
    questions: [
      FAQQuestion(
          text: 'Ürünlerin iade politikası nedir?',
          answer:
              'Ürünlerimizi 14 gün içinde iade edebilirsiniz. İade etmek istediğiniz ürünün orijinal ambalajında olması ve kullanılmamış olması gerekmektedir.'),
      FAQQuestion(
          text: 'Ürünlerin değişim politikası nedir?',
          answer:
              'Ürünlerimizi farklı bir boyutta veya renkte değiştirmek isterseniz, 14 gün içinde iade edip yenisini satın alabilirsiniz.'),
    ],
  ),
  FAQCategory(
    name: 'Ödeme ve teslimat',
    questions: [
      FAQQuestion(
          text: 'Hangi ödeme yöntemlerini kabul ediyorsunuz?',
          answer:
              'Kredi kartı, banka kartı, havale ve EFT ile ödeme kabul ediyoruz.'),
      FAQQuestion(
          text: 'Ürünler ne zaman teslim edilir?',
          answer:
              'Ürünler, siparişinizin onaylanmasından sonra ortalama 2-3 iş günü içinde teslim edilir.'),
    ],
  ),
];
