using DishDash.Data;
using DishDash.Models;
using DishDash.ViewModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DishDash.Controllers
{
    [Route("api/users")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        List<User> _users = ApplicationContextUsers.Users;


        // GET api/users/current
        [HttpGet("current")]
        public ActionResult<User> GetCurrent()
        {
            return Ok(ApplicationContextUsers.currentUser);
        }


        //[HttpGet]
        //public IActionResult GetAllUsers()
        //{
        //    return Ok(_users);
        //}

        [HttpGet("{email}")]
        public IActionResult UserByEmail(string email)
        {
            var user = _users.FirstOrDefault(u => u.Email == email);
            if (user == null)
                return NotFound();

            return Ok(user);
        }

        //[HttpPost("CreateUser")]
        //public IActionResult CreateUser([FromBody] User newUser)
        //{
        //    try
        //    {
        //        // Add validation logic if needed
        //        ApplicationContextUsers.Users.Add(newUser);
        //        return Ok(newUser);
        //    }
        //    catch (Exception ex)
        //    {
        //        // Log the exception
        //        return StatusCode(500, $"Internal server error: {ex.Message}");
        //    }
        //}

        //[HttpDelete("DeleteUser")]
        //public IActionResult DeleteUser([FromBody] User userToDelete)
        //{
        //    try
        //    {
        //        // Add validation logic if needed
        //        var user = ApplicationContextUsers.Users.FirstOrDefault(u => u.Email == userToDelete.Email);

        //        if (user == null)
        //            return NotFound();

        //        ApplicationContextUsers.Users.Remove(user);
        //        return Ok(user);
        //    }
        //    catch (Exception ex)
        //    {
        //        // Log the exception
        //        return StatusCode(500, $"Internal server error: {ex.Message}");
        //    }
        //}

        [HttpPut("ChangeCurrentUser/{Id}")]
        public IActionResult ChangeCurrentUser(string Id, [FromBody] User updatedUser)
        {
            try
            {
                // Add validation logic if needed
                var user = ApplicationContextUsers.currentUser;

                if (user == null)
                    return NotFound();

                // Update properties as needed
                user.Id = updatedUser.Id;
                user.Name = updatedUser.Name;
                user.Email = updatedUser.Email;
                user.Password = updatedUser.Password;
                user.ShippingAddress = updatedUser.ShippingAddress;
                user.PhotoLink = updatedUser.PhotoLink;
                user.OrderList = updatedUser.OrderList;
                user.FavoriteList = updatedUser.FavoriteList;

                return Ok(user);
            }
            catch (Exception ex)
            {
                // Log the exception
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }


        [HttpGet("allOrders")]
        public IActionResult AllOrders()
        {
            List<Order> orders = ApplicationContextProducts.orders;
            return Ok(orders);
        }

        [HttpPost("createOrder")]
        public IActionResult CreateOrder([FromBody] List<Product> products)
        {
            try
            {

                // Sipariş numarasını ve sipariş tarihini oluştur
                Random random = new Random();
                int orderNumber = random.Next(1000, 9999);
                DateTime orderDate = DateTime.Now;

                // Toplam tutarı hesapla
                double totalAmount = 31421.2;

                // Yeni siparişi oluştur
                Order newOrder = new Order(orderNumber, orderDate, "New", products, totalAmount);

                // Siparişi listeye ekle
                ApplicationContextProducts.orders.Add(newOrder);

                return Ok(newOrder);
            }
            catch (Exception ex)
            {
                return BadRequest($"Failed to create order: {ex.Message}");
            }
        }

        //[HttpPost("createOrder")]
        //public IActionResult CreateOrder([FromBody] Order order)
        //{
        //    if (order == null)
        //    {
        //        return NotFound("Order is null");
        //    }
        //    ApplicationContextProducts.orders.Add(order);
        //    return Ok();
        //}

    }
}
