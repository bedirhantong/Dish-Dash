using DishDash.Models;

namespace DishDash.ViewModel
{
    public class ApplicationContextProducts
    {


        public static List<Category> categories = new List<Category> {
            new Category() { Id = 0, Name = "New" },
            new Category() { Id = 1, Name = "Technology" },
            new Category() { Id = 2, Name = "Clothing" },
            new Category() { Id = 3, Name = "Education" },
            new Category() { Id = 4, Name = "Sport" },
            new Category() { Id = 5, Name = "Favorite" },
        };

        public static List<Product> productsList = new List<Product>()
        {
            new Product(){
                Category = categories.FirstOrDefault(x=>x.Id == 0),
                Id = 1,
                Value = 0,
                Name = "Laptop XYZ",
                ImageUrl = "https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_101502299/mobile_786_587_png/HUAWEI-Matebook-D15--i5-1155G7-%C4%B0%C5%9Flemci--8GB-Ram--256GB-SSD--15.6-in%C3%A7--Win-11-Laptop-Mistik-G%C3%BCm%C3%BC%C5%9F",
                Price = 999.99,
                IsNew = true,
                Star = 4.3,
                Brand = "laptop",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                AmountOfStock = 3,
                IsInStock = true,
                AmountOfDiscount =  "10",
                OldCost = 200
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 0),
                Id = 2,
                AmountOfDiscount = "10",
                OldCost = 200,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Name = "Akıllı Telefon ABC",
                ImageUrl = "https://reimg-teknosa-cloud-prod.mncdn.com/mnresize/600/600/productimage/125078788/125078788_0_MC/66845559.jpg",
                Price = 699.99,
                Brand = "Kronik Yayınevi",
                IsNew = true,
                Star = 4.3,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın."
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 0),
                Id = 3,
                AmountOfDiscount =  "10",
                OldCost = 200,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                CargoType = "bedava",
                Size = false,
                SizeType = "orta",
                Name = "Bluetooth Kulaklık",
                ImageUrl = "https://akn-ayb.a-cdn.akinoncdn.com/products/2021/06/14/58647/f007828a-76e7-421a-b61d-37d2503a5a4d_size780x780_quality60_cropCenter.jpg",
                Price = 49.99,
                Brand = "Kronik Yayınevi",
                IsNew = true,
                Star = 4.3,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın."
        },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 1),
                Id = 4,
                AmountOfDiscount =  "10",
                OldCost = 200,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Name = "Akıllı Saat",
                ImageUrl = "https://cdn03.ciceksepeti.com/cicek/kc3222420-1/XL/smart-siyah-akilli-saat-kc3222420-1-451229b892384cfe800c828cfdc243e3.jpg",
                Price = 129.99,
                Brand = "Kronik Yayınevi",
                IsNew = false,
                Star = 4.3
            },
            new Product()
            {
                Category = categories?.FirstOrDefault(x=>x.Id == 1),
                Id = 5,
                AmountOfDiscount = "10",
                OldCost = 200,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Name = "Gaming Laptop Ultra",
                ImageUrl = "https://image.made-in-china.com/202f0j00GyrldSocSAqz/Ultra-Thin-Gaming-Laptops-16-1-Inch-Intel-Core-I9-8950HK-I7-9750h-Nvidia-Gtx-1650-4G-Graphic-Card-Notebook-Win-10-Computer.jpg",
                Price = 1499.99,
                Brand = "Kronik Yayınevi",
                IsNew = false,
                Star = 4.3
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 1),
                Id = 6,
                AmountOfDiscount =  "10",
                OldCost = 200,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                    + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                    + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                    + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                    + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                    + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                    + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler "
                    + "için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                    + "Detaylı bilgi için tıklayın.",
                Name = "4K UHD Smart TV",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                ImageUrl = "https://www.lg.com/africa/images/tvs/md06251641/gallery/uhd-lg-43un7000pta-tv-new_d2.jpg",
                Price = 899.99,
                Brand = "Kronik Yayınevi",
                IsNew = false,
                Star = 4.3
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 1),
                Id = 7,
                AmountOfDiscount = "10",
                OldCost = 200,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                    + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                    + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                    + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                    + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                    + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                    + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler "
                    + "için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                    + "Detaylı bilgi için tıklayın.",
                Name = "Kablosuz Bluetooth Mouse",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                ImageUrl = "https://productimages.hepsiburada.net/s/48/375-375/10953682354226.jpg",
                Price = 19.99,
                Brand = "Kronik Yayınevi",
                IsNew = false,
                Star = 4.3
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 1),
                Id = 8,
                AmountOfDiscount =  "10",
                OldCost = 200,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                    + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                    + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                    + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                    + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                    + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                    + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler "
                    + "için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                    + "Detaylı bilgi için tıklayın.",
                Name = "Taşınabilir Bluetooth Hoparlör",
                ImageUrl = "https://www.teknostore.com/image/cache/data/resimler/lenovo-lecoo-ds154-boombox-rgb-tasinabilir-bluetooth-hoparlor-17245-682x682.jpg",
                Price = 59.99,
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                IsNew = false,
                Brand = "Kronik Yayınevi",
                Star = 4.3
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 1),
                Id = 9,
                AmountOfDiscount =  "10",
                OldCost = 200,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                    + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                    + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                    + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                    + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                    + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                    + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler "
                    + "için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                    + "Detaylı bilgi için tıklayın.",
                Name = "HD Video Kamera",
                ImageUrl = "https://productimages.hepsiburada.net/s/7/375-375/8949968437298.jpg",
                Price = 329.99,
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                IsNew = false,
                Brand = "Kronik Yayınevi",
                Star = 4.3
            },
            new Product(){
                Category = categories.FirstOrDefault(x=>x.Id == 2),
                Id = 15,
                Value = 0,
                Name = "Siyah Dokuma Dokuma Elbise",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty997/product/media/images/prod/PIM/20230908/10/d18cdef2-5281-4d39-96a8-4748790c013d/1_org_zoom.jpg",
                Price = 69.99,
                IsNew = false,
                Star = 4.3,
                Brand = "NZ",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                AmountOfStock = 3,
                IsInStock = true,
                AmountOfDiscount = "10",
                OldCost = 50
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 2),
                Id = 16,
                AmountOfDiscount =  "10",
                OldCost = 70,
                AmountOfStock = 2,
                IsInStock = true,
                Value = 1,
                CargoType = "bedava",
                Size = false,
                SizeType = "orta",
                Name = "Kadın Çizgili Triko Kazak",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty587/product/media/images/20221103/22/206966411/612981031/1/1_org_zoom.jpg",
                Price = 59.99,
                Brand = "X Kadın",
                IsNew = false,
                Star = 4.1,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın."
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 2),
                Id = 17,
                AmountOfDiscount =  "10",
                OldCost = 40,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                CargoType = "bedava",
                Size = false,
                SizeType = "orta",
                Name = "Kısa Taytlı Outdoor Şort",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty955/product/media/images/20230622/13/388128090/881485565/1/1_org_zoom.jpg",
                Price = 19.99,
                Brand = "X Kadın",
                IsNew = false,
                Star = 4.3,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın."
        },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 2),
                Id = 18,
                AmountOfDiscount =  "10",
                OldCost = 40,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Name = "El Örgüsü Eldiven",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty1081/product/media/images/prod/SPM/PIM/20231207/14/0f9d212e-69a3-3ad7-a2c0-036545b93594/1_org_zoom.jpg",
                Price = 29.99,
                Brand = "MS Kadın",
                IsNew = false,
                Star = 4.3
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 2),
                Id = 19,
                AmountOfDiscount =  "10",
                OldCost = 200,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Name = "Kürk Detaylı Pilot Şapka",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty273/product/media/images/20211220/9/13657025/340968294/1/1_org_zoom.jpg",
                Price = 99.99,
                Brand = "Ela Giyim",
                IsNew = false,
                Star = 4.3
            },
            new Product(){
                Category = categories.FirstOrDefault(x=>x.Id == 3),
                Id = 10,
                Value = 0,
                Name = "Atomik Alışkanlıklar",
                ImageUrl = "https://www.kayhanaydogdu.com.tr/uploads/372888-I%CC%87yi-al%C4%B1%C5%9Fkanl%C4%B1klar-edinmenin-ve-k%C3%B6t%C3%BC-al%C4%B1%C5%9Fkanl%C4%B1klardan-1.jpeg",
                Price = 29.99,
                IsNew = false,
                Star = 4.3,
                Brand = "Kronik Yayınevi",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                AmountOfStock = 3,
                IsInStock = true,
                AmountOfDiscount =  "10",
                OldCost = 50
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 3),
                Id = 11,
                AmountOfDiscount =  "10",
                OldCost = 70,
                AmountOfStock = 2,
                IsInStock = true,
                Value = 1,
                CargoType = "bedava",
                Size = false,
                SizeType = "orta",
                Name = "Senin Cahilliğin Benim Yaşamımı Etkiliyor",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty1019/product/media/images/prod/SPM/PIM/20231018/16/157fafd0-a216-3b1d-88f9-d9d03e3e86e1/1_org_zoom.jpg",
                Price = 59.99,
                Brand = "Kronik Yayınevi",
                IsNew = false,
                Star = 4.1,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın."
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 3),
                Id = 12,
                AmountOfDiscount = "10",
                OldCost = 40,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                CargoType = "bedava",
                Size = false,
                SizeType = "orta",
                Name = "Dahi Diktatör",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty102/product/media/images/20210413/15/79805047/13746232/1/1_org_zoom.jpg",
                Price = 19.99,
                Brand = "Kronik Yayınevi",
                IsNew = false,
                Star = 4.3,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın."
        },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 3),
                Id = 13,
                AmountOfDiscount = "10",
                OldCost = 40,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Name = "A5 Defter Celal Şengör Nasıl Yapıcaz 200 Sayfa",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty777/product/media/images/20230315/15/304016577/886696731/1/1_org_zoom.jpg",
                Price = 29.99,
                Brand = "Kronik Yayınevi",
                IsNew = false,
                Star = 4.3
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 3),
                Id = 14,
                AmountOfDiscount = "20",
                OldCost = 200,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Name = "Var Mısın ?",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty998/product/media/images/prod/SPM/PIM/20230907/23/64287eeb-4b25-3322-a722-e4656d841f46/1_org_zoom.jpg",
                Price = 99.99,
                Brand = "Kronik Yayınevi",
                IsNew = false,
                Star = 4.3
            },
            new Product(){
                Category = categories.FirstOrDefault(x=>x.Id == 4),
                Id = 20,
                Value = 0,
                Name = "Dambıl Seti 2\'li",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty438/product/media/images/20220526/9/116331901/226974396/1/1_org_zoom.jpg",
                Price = 69.99,
                IsNew = false,
                Star = 4.3,
                Brand = "SportGiyim",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                AmountOfStock = 3,
                IsInStock = true,
                AmountOfDiscount =  "10",
                OldCost = 50
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 4),
                Id = 21,
                AmountOfDiscount =  "10",
                OldCost = 70,
                AmountOfStock = 2,
                IsInStock = true,
                Value = 1,
                CargoType = "bedava",
                Size = false,
                SizeType = "orta",
                Name = "Slim Kondisyon Bisikleti",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty1029/product/media/images/prod/SPM/PIM/20231105/16/ebe3cf30-2660-376c-8668-1c0ddd10b966/1_org_zoom.jpg",
                Price = 59.99,
                Brand = "SportGiyim",
                IsNew = false,
                Star = 4.1,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın."
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 4),
                Id = 22,
                AmountOfDiscount =  "10",
                OldCost = 40,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                CargoType = "bedava",
                Size = false,
                SizeType = "orta",
                Name = "Uzaktan Kumandalı Koşu Bandı",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty744/product/media/images/20230223/15/287759278/866433150/1/1_org_zoom.jpg",
                Price = 19.99,
                Brand = "SportGiyim",
                IsNew = false,
                Star = 4.3,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın."
        },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 4),
                Id = 23,
                AmountOfDiscount =  "10",
                OldCost = 40,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Name = "Kol Bilek Güçlendirici Fitness Bilek Aparatı",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty1021/product/media/images/prod/SPM/PIM/20231024/17/f5999ed1-0539-371b-b919-77ecb23dd250/1_org_zoom.jpg",
                Price = 29.99,
                Brand = "SportGiyim",
                IsNew = false,
                Star = 4.3
            },
            new Product()
            {
                Category = categories.FirstOrDefault(x=>x.Id == 4),
                Id = 24,
                AmountOfDiscount = "10",
                OldCost = 200,
                AmountOfStock = 3,
                IsInStock = true,
                Value = 0,
                Description = "Kampanya fiyatından satılmak üzere 5 adetten fazla stok sunulmuştur. İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir. "
                              + "Bir ürün, birden fazla satıcı tarafından satılabilir. "
                              + "Birden fazla satıcı tarafından satışa sunulan ürünlerin satıcıları ürün için belirledikleri fiyata, satıcı puanlarına, teslimat statülerine, ürünlerdeki promosyonlara, "
                              + "kargonun bedava olup olmamasına ve ürünlerin hızlı teslimat ile teslim edilip edilememesine, ürünlerin stok ve kategorileri bilgilerine göre sıralanmaktadır. "
                              + "Bu üründen en fazla 1 adet sipariş verilebilir. "
                              + "1 adedin üzerindeki siparişleri iptal etme hakkınız saklı tutulur. "
                              + "Belirlenen bu limit kurumsal siparişlerde geçerli olmayıp, kurumsal siparişler için farklı limitler belirlenebilmektedir.15 gün içinde ücretsiz iade. "
                              + "Detaylı bilgi için tıklayın.",
                CargoType = "bedava",
                Size = true,
                SizeType = "orta",
                Name = "Boks Eldiveni Siyah",
                ImageUrl = "https://cdn.dsmcdn.com/mnresize/600/-/ty1006/product/media/images/prod/SPM/PIM/20230927/13/68f5adc5-a9f3-3841-a017-55c2674519f6/1_org_zoom.jpg",
                Price = 99.99,
                Brand = "SportGiyim",
                IsNew = false,
                Star = 4.3
            },
        };

        public static List<Order> orders = new List<Order> {
            //new Order() { OrderNumber = 1, OrderDate = DateTime.Now, OrderStatus = "delivered",OrderProducts = ApplicationContextProducts.productsList
            //    .Where(x => x.Category != null && x.Category.Id == 0).ToList(), TotalAmount = 1532 },
            //new Order() { OrderNumber = 2, OrderDate = DateTime.Now, OrderStatus = "on progress",OrderProducts = ApplicationContextProducts.productsList
            //    .Where(x => x.Category != null && x.Category.Id == 1).ToList(), TotalAmount = 1234 },
        }; 


    }
}
