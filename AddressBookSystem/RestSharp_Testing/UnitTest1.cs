using RestSharp;
using AddressBookSystem;
using Newtonsoft.Json;
using System.Net;

namespace RestSharp_Testing
{
    [TestClass]
    public class Address
    {
        AddressBook_Model model = new AddressBook_Model();
        RestClient client;
        [TestMethod]
        public void OnGetMethod_Should_ReturnAddressBookDetails()
        {
            client = new RestClient("http://localhost:5000");
            RestRequest request = new RestRequest("/family", Method.Get);
            RestResponse response = client.Execute(request);
            Assert.AreEqual(response.StatusCode, HttpStatusCode.OK);
            List<AddressBook_Model> list = JsonConvert.DeserializeObject<List<AddressBook_Model>>(response.Content);
            Assert.AreEqual(4, list.Count);
            foreach (AddressBook_Model data in list)
            {
                Console.WriteLine("{0,-5}{1,-20}{2,-20}{3,-10}{4,-20}{5,-20}{6,-10}{7,-15}{8,-20}", data.id, data.firstName, data.lastName,
                    data.address, data.city, data.state, data.zipCode, data.phone, data.email);
            }
        }
    }
}