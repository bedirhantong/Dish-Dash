namespace DishDash.Models
{
    public class Order
    {
        public int OrderNumber { get; set; }
        public DateTime OrderDate { get; set; }
        public string OrderStatus { get; set; }
        public List<Product> OrderProducts { get; set; }
        public double TotalAmount { get; set; }

        public Order(int orderNumber, DateTime orderDate, string orderStatus, List<Product> products, double totalAmount)
        {
            OrderNumber = orderNumber;
            OrderDate = orderDate;
            OrderStatus = orderStatus;
            OrderProducts = products;
            TotalAmount = totalAmount;
        }

        public Order()
        {
        }


    }

}
