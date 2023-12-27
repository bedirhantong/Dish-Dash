using DishDash.Models;
using System.Xml.Linq;

namespace DishDash.Data
{
    public class ApplicationContextUsers
    {
        public static User currentUser = new User() { Id = "", Name = "", Password = "", Email = "", ShippingAddress = "", PhotoLink = "", OrderList = [], FavoriteList = [] };
        public static List<User> Users = new List<User> {
            new User(){ Id = "0", Name ="bedirhan" ,Email = "bdo@x.com",Password = "123", ShippingAddress = "", PhotoLink = "", OrderList = [], FavoriteList = []},
        };
       

    }
}
