import '../../model/product/product_model.dart';

class ProductViewModel {
  static List<Product> techProductList = [
    Product(
      value: 0,
      name: 'Laptop XYZ',
      imageUrl:
          'https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_101502299/mobile_786_587_png/HUAWEI-Matebook-D15--i5-1155G7-%C4%B0%C5%9Flemci--8GB-Ram--256GB-SSD--15.6-in%C3%A7--Win-11-Laptop-Mistik-G%C3%BCm%C3%BC%C5%9F',
      price: 999.99,
      isNew: false,
      star: 4.3,
      brand: 'laptop',
      cargoType: 'bedava',
      size: true,
      sizeType: "orta",
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
      amountOfStock: 3,
      isInStock: true,
      amountOfDiscount: '%10',
      oldCost: 200,
    ),
    Product(
        amountOfDiscount: '%10',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        cargoType: 'bedava',
        size: false,
        sizeType: "orta",
        name: 'Akıllı Telefon ABC',
        imageUrl:
            'https://reimg-teknosa-cloud-prod.mncdn.com/mnresize/600/600/productimage/125078788/125078788_0_MC/66845559.jpg',
        price: 699.99,
        brand: 'Kronik Yayınevi',
        isNew: true,
        star: 4.3,
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
      amountOfDiscount: '%10',
      oldCost: 200,
      amountOfStock: 3,
      isInStock: true,
      value: 0,
      cargoType: 'bedava',
      size: false,
      sizeType: "orta",
      name: 'Bluetooth Kulaklık',
      imageUrl:
          'https://akn-ayb.a-cdn.akinoncdn.com/products/2021/06/14/58647/f007828a-76e7-421a-b61d-37d2503a5a4d_size780x780_quality60_cropCenter.jpg',
      price: 49.99,
      brand: 'Kronik Yayınevi',
      isNew: true,
      star: 4.3,
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
        amountOfDiscount: '%10',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
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
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        name: 'Akıllı Saat',
        imageUrl:
            'https://cdn03.ciceksepeti.com/cicek/kc3222420-1/XL/smart-siyah-akilli-saat-kc3222420-1-451229b892384cfe800c828cfdc243e3.jpg',
        price: 129.99,
        brand: 'Kronik Yayınevi',
        isNew: true,
        star: 4.3),
    Product(
        amountOfDiscount: '%10',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
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
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        name: 'Gaming Laptop Ultra',
        imageUrl:
            'https://image.made-in-china.com/202f0j00GyrldSocSAqz/Ultra-Thin-Gaming-Laptops-16-1-Inch-Intel-Core-I9-8950HK-I7-9750h-Nvidia-Gtx-1650-4G-Graphic-Card-Notebook-Win-10-Computer.jpg',
        price: 1499.99,
        brand: 'Kronik Yayınevi',
        isNew: true,
        star: 4.3),
    Product(
        amountOfDiscount: '%10',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
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
        name: '4K UHD Smart TV',
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        imageUrl:
            'https://www.lg.com/africa/images/tvs/md06251641/gallery/uhd-lg-43un7000pta-tv-new_d2.jpg',
        price: 899.99,
        brand: 'Kronik Yayınevi',
        isNew: true,
        star: 4.3),
    Product(
        amountOfDiscount: '%10',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
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
        name: 'Kablosuz Bluetooth Mouse',
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        imageUrl:
            'https://productimages.hepsiburada.net/s/48/375-375/10953682354226.jpg',
        price: 19.99,
        brand: 'Kronik Yayınevi',
        isNew: false,
        star: 4.3),
    Product(
        amountOfDiscount: '%10',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        name: 'Taşınabilir Bluetooth Hoparlör',
        imageUrl:
            'https://www.teknostore.com/image/cache/data/resimler/lenovo-lecoo-ds154-boombox-rgb-tasinabilir-bluetooth-hoparlor-17245-682x682.jpg',
        price: 59.99,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        isNew: false,
        brand: 'Kronik Yayınevi',
        star: 4.3,
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
        amountOfDiscount: '%10',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        name: 'HD Video Kamera',
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        imageUrl:
            'https://productimages.hepsiburada.net/s/7/375-375/8949968437298.jpg',
        price: 329.99,
        isNew: false,
        brand: 'Kronik Yayınevi',
        star: 4.3,
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
  static List<Product> educationProductList = [
    Product(
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
  static List<Product> sportsProductList = [
    Product(
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        name: 'Dambıl Seti 2\'li',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty438/product/media/images/20220526/9/116331901/226974396/1/1_org_zoom.jpg',
        price: 40.99,
        isNew: true,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        star: 4.0,
        brand: 'SportGiyim',
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
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        name: 'Slim Kondisyon Bisikleti',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty1029/product/media/images/prod/SPM/PIM/20231105/16/ebe3cf30-2660-376c-8668-1c0ddd10b966/1_org_zoom.jpg',
        price: 29.99,
        isNew: false,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        star: 4.6,
        brand: 'AldınAldın',
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
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 0,
        name: 'Uzaktan Kumandalı Koşu Bandı',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty744/product/media/images/20230223/15/287759278/866433150/1/1_org_zoom.jpg',
        price: 99.99,
        isNew: true,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        star: 4.3,
        brand: 'ModX',
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
        amountOfDiscount: '%5',
        oldCost: 200,
        amountOfStock: 3,
        isInStock: true,
        value: 1,
        name: 'Kol Bilek Güçlendirici Fitness Bilek Aparatı',
        imageUrl:
            'https://cdn.dsmcdn.com/mnresize/600/-/ty1021/product/media/images/prod/SPM/PIM/20231024/17/f5999ed1-0539-371b-b919-77ecb23dd250/1_org_zoom.jpg',
        price: 29.99,
        isNew: false,
        cargoType: 'bedava',
        size: true,
        sizeType: "orta",
        star: 4.2,
        brand: 'TrNon',
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
      amountOfDiscount: '%5',
      oldCost: 200,
      amountOfStock: 3,
      isInStock: true,
      name: 'Boks Eldiveni Siyah',
      imageUrl:
          'https://cdn.dsmcdn.com/mnresize/600/-/ty1006/product/media/images/prod/SPM/PIM/20230927/13/68f5adc5-a9f3-3841-a017-55c2674519f6/1_org_zoom.jpg',
      price: 39.99,
      isNew: true,
      cargoType: 'bedava',
      size: true,
      sizeType: "orta",
      star: 4.4,
      brand: 'Uxa',
      description:
          'Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. '
          ' için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade.'
          ' Detaylı bilgi için tıklayın.',
      value: 0,
    ),
  ];
}
