using System.ComponentModel;

namespace DishDash.Models
{

    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
    public class Product
    {
        public Category Category { get; set; }
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
        public double Price { get; set; }
        public bool IsNew { get; set; }
        public double Star { get; set; }
        public string Brand { get; set; }
        public string CargoType { get; set; }
        public bool Size { get; set; }
        public int Value { get; set; }
        public string SizeType { get; set; }
        public bool IsInStock { get; set; }
        public int AmountOfStock { get; set; }
        public double OldCost { get; set; }
        public string AmountOfDiscount { get; set; }





        public Product(
            Category category,
            int id,
            string name,
            string imageUrl,
            double price,
            bool isNew,
            string Description,
            double star,
            string brand,
            string cargoType,
            bool size,
            int value,
            string sizeType,
            bool isInStock,
            int amountOfStock,
            double oldCost,
            string amountOfDiscount)
        {
            this.Category = category;
            this.Id = id;
            this.Name = name;
            this.ImageUrl = imageUrl;
            this.Price = price;
            this.IsNew = isNew;
            this.Star = star;
            this.Brand = brand;
            this.CargoType = cargoType;
            this.Size = size;
            this.Value = value;
            this.SizeType = sizeType;
            this.IsInStock = isInStock;
            this.AmountOfStock = amountOfStock;
            this.OldCost = oldCost;
            this.AmountOfDiscount = amountOfDiscount;
            this.Description = Description;
        }

        public Product()
        {
        }
    }


}
