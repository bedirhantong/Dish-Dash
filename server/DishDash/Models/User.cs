namespace DishDash.Models
{
    public class User
    {
        required public string Id { get; set; }
        required public string Name { get; set; }
        required public string Email { get; set; }
        required public string Password { get; set; }
        required public string ShippingAddress { get; set; }
        required public string PhotoLink { get; set; }
        required public List<Order> OrderList { get; set; }
        required public List<Product> FavoriteList { get; set; }




        public User(string id,string name, string email, string password, string shippingAddress, string photoLink, List<Order> orderList, List<Product> favoriteList)
        {
            this.Id = id;
            this.Name = name;
            this.Email = email;
            this.Password = password;
            this.ShippingAddress = shippingAddress;
            this.PhotoLink = photoLink;
            this.OrderList = orderList;
            this.FavoriteList = favoriteList;
        }

        public User()
        {
        }


    }
}
