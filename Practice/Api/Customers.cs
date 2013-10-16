using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Practice.Repository;

namespace Practice.Api
{
    public class CustomersController : ApiController
    {
        
        private CustomersEntities _entities = new CustomersEntities();
        // GET api/<controller>
        // GET api/customers
        public HttpResponseMessage Get()
        {
            var custs = _entities.Customers;
            if (custs == null) throw new HttpResponseException(HttpStatusCode.NotFound);
            return Request.CreateResponse<IEnumerable<Customer>>(HttpStatusCode.OK, custs);
        }

        // GET api/customers/5
        public HttpResponseMessage Get(int id)
        {
            var cust = _entities.Customers.First(c => c.Id == id);
            if (cust == null) throw new HttpResponseException(HttpStatusCode.NotFound);
            return Request.CreateResponse<Customer>(HttpStatusCode.OK, cust);
        }

        // POST api/customers
        public HttpResponseMessage Post([FromBody]Customer cust)
        {
            var newCust = _entities.Customers.Add(cust);
            _entities.SaveChanges();
            if (newCust != null)
            {
                return Request.CreateResponse<Customer>(HttpStatusCode.OK, newCust);

            }
            throw new HttpResponseException(HttpStatusCode.Conflict);
        }

        // PUT api/customers/5
        public HttpResponseMessage Put(int id, [FromBody]Customer cust)
        {
            var custToUpdate = _entities.Customers.First(c => c.Id == id);

            custToUpdate.Name = cust.Name;
            custToUpdate.City = cust.City;

            var status = _entities.SaveChanges();
            if (status > 0) return new HttpResponseMessage(HttpStatusCode.OK);
            throw new HttpResponseException(HttpStatusCode.NotFound);
        }

        // DELETE api/customers/5
        public HttpResponseMessage Delete(int id)
        {
            var custToDelete = _entities.Customers.First(c => c.Id == id);

            _entities.Customers.Remove(custToDelete);
            var status = _entities.SaveChanges();
            if (status > 0) return new HttpResponseMessage(HttpStatusCode.OK);
            throw new HttpResponseException(HttpStatusCode.NotFound);
        }

        //[HttpGet]
        //public List<Order> Orders(int custID)
        //{
        //    var orders = _Repository.GetOrders(custID);
        //    if (orders == null)

        //        throw new HttpResponseException(new HttpResponseMessage(HttpStatusCode.NotFound));
        //    return orders;
        //}
    }
}