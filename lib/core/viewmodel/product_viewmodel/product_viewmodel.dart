import '../../model/service_model/product_model/product_model.dart';

class ProductViewModel {
  static List<Product> educationProductList = [
    Product(
      id: 1,
      amountOfDiscount: '%5',
      oldCost: 200,
      amountOfStock: 3,
      isInStock: true,
      value: 0,
      name: 'Atomik Alışkanlıklar',
      cargoType: 'bedava',
      size: true,
      sizeType: "orta",
      imageUrl:
          'https://www.kayhanaydogdu.com.tr/uploads/372888-I%CC%87yi-al%C4%B1%C5%9Fkanl%C4%B1klar-edinmenin-ve-k%C3%B6t%C3%BC-al%C4%B1%C5%9Fkanl%C4%B1klardan-1.jpeg',
      price: 199.99,
      isNew: false,
      brand: 'Kronik Yayınevi',
      star: 4.5,
      description:
          'Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. '
          'Bir ürün, birden fazla satıcı tarafından satılabilir. '
          'Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara,'
          ' kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır.'
          ' Bu üründen en fazla 1 adet sipariş verilebilir.'
          ' 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur.'
          ' Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler'
          ' için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade.'
          ' Detaylı bilgi için tıklayın.',
    ),
    Product(
        id: 1,
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        name: 'Senin Cahilliğin Benim Yaşamımı Etkiliyor',
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty1019/product/media/images/prod/SPM/PIM/20231018/16/157fafd0-a216-3b1d-88f9-d9d03e3e86e1/1_org_zoom.jpg',
        price: 149.99,
        isNew: false,
        star: 4.2,
        brand: 'Kronik Yayınevi',
        description:
            'Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. '
            'Bir ürün, birden fazla satıcı tarafından satılabilir. '
            'Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara,'
            ' kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır.'
            ' Bu üründen en fazla 1 adet sipariş verilebilir.'
            ' 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur.'
            ' Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler'
            ' için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade.'
            ' Detaylı bilgi için tıklayın.'),
    Product(
        id: 1,
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 0,
        isInStock: false,
        value: 0,
        name: 'Dahi Diktatör',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty102/product/media/images/20210413/15/79805047/13746232/1/1_org_zoom.jpg',
        price: 89.99,
        isNew: true,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        star: 4.8,
        brand: 'Kronik Yayınevi',
        description:
            'Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. '
            'Bir ürün, birden fazla satıcı tarafından satılabilir. '
            'Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara,'
            ' kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır.'
            ' Bu üründen en fazla 1 adet sipariş verilebilir.'
            ' 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur.'
            ' Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler'
            ' için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade.'
            ' Detaylı bilgi için tıklayın.'),
    Product(
        id: 1,
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        name: 'A5 Defter Celal Şengör Nasıl Yapıcaz 200 Sayfa',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty777/product/media/images/20230315/15/304016577/886696731/1/1_org_zoom.jpg',
        price: 59.99,
        isNew: false,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        star: 4.0,
        brand: 'Kronik Yayınevi',
        description:
            'Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. '
            'Bir ürün, birden fazla satıcı tarafından satılabilir. '
            'Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara,'
            ' kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır.'
            ' Bu üründen en fazla 1 adet sipariş verilebilir.'
            ' 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur.'
            ' Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler'
            ' için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade.'
            ' Detaylı bilgi için tıklayın.'),
    Product(
        id: 1,
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        name: 'Var Mısın ?',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty998/product/media/images/prod/SPM/PIM/20230907/23/64287eeb-4b25-3322-a722-e4656d841f46/1_org_zoom.jpg',
        price: 29.99,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        isNew: true,
        star: 4.6,
        brand: 'Kronik Yayınevi',
        description:
            'Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. '
            'Bir ürün, birden fazla satıcı tarafından satılabilir. '
            'Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara,'
            ' kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır.'
            ' Bu üründen en fazla 1 adet sipariş verilebilir.'
            ' 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur.'
            ' Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler'
            ' için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade.'
            ' Detaylı bilgi için tıklayın.'),
  ];
  static List<Product> clothingProductList = [
    Product(
        id: 1,
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        name: 'Siyah Dokuma Dokuma Elbise',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty997/product/media/images/prod/PIM/20230908/10/d18cdef2-5281-4d39-96a8-4748790c013d/1_org_zoom.jpg',
        price: 79.99,
        isNew: true,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        star: 4.2,
        brand: 'X Kadın',
        description:
            'Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. '
            'Bir ürün, birden fazla satıcı tarafından satılabilir. '
            'Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara,'
            ' kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır.'
            ' Bu üründen en fazla 1 adet sipariş verilebilir.'
            ' 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur.'
            ' Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler'
            ' için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade.'
            ' Detaylı bilgi için tıklayın.'),
    Product(
        id: 1,
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 3,
        name: 'Kadın Çizgili Triko Kazak',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty587/product/media/images/20221103/22/206966411/612981031/1/1_org_zoom.jpg',
        price: 49.99,
        isNew: false,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        star: 4.0,
        brand: 'X Kadın',
        description:
            'Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. '
            'Bir ürün, birden fazla satıcı tarafından satılabilir. '
            'Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara,'
            ' kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır.'
            ' Bu üründen en fazla 1 adet sipariş verilebilir.'
            ' 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur.'
            ' Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler'
            ' için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade.'
            ' Detaylı bilgi için tıklayın.'),
    Product(
        id: 1,
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 1,
        name: 'Kısa Taytlı Outdoor Şort',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty955/product/media/images/20230622/13/388128090/881485565/1/1_org_zoom.jpg',
        price: 39.99,
        isNew: true,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        star: 4.5,
        brand: 'Msport',
        description:
            'Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. '
            'Bir ürün, birden fazla satıcı tarafından satılabilir. '
            'Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara,'
            ' kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır.'
            ' Bu üründen en fazla 1 adet sipariş verilebilir.'
            ' 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur.'
            ' Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler'
            ' için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade.'
            ' Detaylı bilgi için tıklayın.'),
    Product(
        id: 1,
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        name: ' El Örgüsü Eldiven',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty1081/product/media/images/prod/SPM/PIM/20231207/14/0f9d212e-69a3-3ad7-a2c0-036545b93594/1_org_zoom.jpg',
        price: 89.99,
        isNew: false,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        star: 4.3,
        brand: 'MSanat',
        description:
            'Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. '
            'Bir ürün, birden fazla satıcı tarafından satılabilir. '
            'Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara,'
            ' kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır.'
            ' Bu üründen en fazla 1 adet sipariş verilebilir.'
            ' 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur.'
            ' Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler'
            ' için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade.'
            ' Detaylı bilgi için tıklayın.'),
    Product(
        id: 1,
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        name: 'Kürk Detaylı Pilot Şapka',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty273/product/media/images/20211220/9/13657025/340968294/1/1_org_zoom.jpg',
        price: 19.99,
        isNew: true,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        star: 4.8,
        brand: 'Ela Giyim',
        description:
            'Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. '
            'Bir ürün, birden fazla satıcı tarafından satılabilir. '
            'Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara,'
            ' kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır.'
            ' Bu üründen en fazla 1 adet sipariş verilebilir.'
            ' 1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur.'
            ' Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler'
            ' için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade.'
            ' Detaylı bilgi için tıklayın.'),
  ];
}
