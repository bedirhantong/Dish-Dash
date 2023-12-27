using DishDash.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using DishDash.ViewModel;
using DishDash.Data;

namespace DishDash.Controllers
{
    [Route("api/products")]
    [ApiController]
    public class ProducsCardController : ControllerBase
    {

        private readonly ILogger<ProducsCardController> _logger;


        public ProducsCardController(ILogger<ProducsCardController> logger)
        {
            _logger = logger;
        }

        [HttpGet("allProducts/{categoryId}")]
        public IActionResult AllProducts(int categoryId)
        {
            List<Product> products = ApplicationContextProducts.productsList
                .Where(x => x.Category != null && x.Category.Id == categoryId)
                .ToList();
            _logger.LogInformation("GetAllProducts action has been called");
            return Ok(products);
        }

        [HttpPut("addToFavorite/{productId}")]
        public IActionResult AddToFavorite(int productId)
        {
            var product = ApplicationContextProducts.productsList.FirstOrDefault(p => p.Id == productId);
            if (product == null)
            {
                return NotFound("Product not found");
            }

            product.Category = ApplicationContextProducts.categories.FirstOrDefault(x => x.Id == 5);

            _logger.LogInformation($"Product with ID {productId} has been added to the Favorite category");
            return Ok(product);
        }

        [HttpDelete("deleteProduct/{id}")]
        public IActionResult DeleteProduct(int id)
        {
            var product = ApplicationContextProducts.productsList.FirstOrDefault(p => p.Id == id);

            if (product == null)
            {
                return NotFound("Product not found");
            }

            ApplicationContextProducts.productsList.Remove(product);
            _logger.LogInformation($"Product with ID {id} has been deleted");
            return NoContent();
        }

        [HttpPut("updateProduct/{id}")]
        public IActionResult PutProduct(int id, [FromBody] Product newProduct) 
        {
            var oldProduct = ApplicationContextProducts.productsList.FirstOrDefault(p => p.Id == id);
            if (oldProduct == null  && newProduct == null)
            {
                return NotFound("Product not found");
            }
            oldProduct.Id = newProduct.Id;
            oldProduct.Name = newProduct.Name;
            oldProduct.Description = newProduct.Description;
            oldProduct.ImageUrl = newProduct.ImageUrl;
            oldProduct.Price = newProduct.Price;
            oldProduct.IsNew = newProduct.IsNew;
            oldProduct.Star = newProduct.Star;
            oldProduct.Brand = newProduct.Brand;
            oldProduct.CargoType = newProduct.CargoType;
            oldProduct.Size = newProduct.Size;
            oldProduct.Value = newProduct.Value;
            oldProduct.SizeType = newProduct.SizeType;
            oldProduct.IsInStock = newProduct.IsInStock;
            oldProduct.AmountOfStock = newProduct.AmountOfStock;
            oldProduct.OldCost = newProduct.OldCost;
            oldProduct.AmountOfDiscount = newProduct.AmountOfDiscount;

            _logger.LogInformation($"Product with ID {id} has been updated");
            return Ok(oldProduct);
        }

        /// ---------------


        //[HttpPost("createOrder/{email}")]
        //public IActionResult CreateOrder(string email, [FromBody] Order order)
        //{
        //    List<User> _users = ApplicationContextUsers.Users;

        //    var user = _users.FirstOrDefault(u => u.Email == email);
        //    if (user == null)
        //        return NotFound();

        //    if (order == null)
        //    {
        //        return NotFound("Order is null");
        //    }
        //    user.OrderList.Add(order);
        //    return Ok();
        //}


    }
}
