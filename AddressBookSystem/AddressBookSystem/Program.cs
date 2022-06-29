using System;

namespace AddressBookSystem
{
    public class Program
    {
        public static void Main(string[] args)
        {
            AddressBookRepo getMethod = new AddressBookRepo();
            Console.WriteLine("1.Add Data\n2.Read Data\n3.Update Data\n4.Delete the Data\n5.Add Data With Threading" +
                "\nEnter a Number");
            int userInput = Convert.ToInt32(Console.ReadLine());

            switch (userInput)
            {
                case 1:
                    {
                        AddressBook_Model model = new AddressBook_Model();
                        Console.WriteLine("Enter First Name");
                        model.firstName = Console.ReadLine();
                        Console.WriteLine("Enter Last Name");
                        model.lastName = Console.ReadLine();
                        Console.WriteLine("Enter Address ");
                        model.address = Console.ReadLine();
                        Console.WriteLine("Enter City ");
                        model.city = Console.ReadLine();
                        Console.WriteLine("Enter State ");
                        model.state = Console.ReadLine();
                        Console.WriteLine("Enter Zip Code ");
                        model.zipCode = Convert.ToDouble(Console.ReadLine());
                        Console.WriteLine("Enter Phone ");
                        model.phone = Convert.ToDouble(Console.ReadLine());
                        Console.WriteLine("Enter Email ");
                        model.email = Console.ReadLine();
                        Console.WriteLine("Enter Type ");
                        model.type = Console.ReadLine();
                        getMethod.AddData(model);
                        break;
                    }
                case 2:
                    {
                        getMethod.ReadData();
                        break;
                    }
                case 3:
                    {
                        getMethod.UpdateTable();
                        break;
                    }
                case 4:
                    {
                        getMethod.DeleteData();
                        break;
                    }
                case 5:
                    {
                        List<AddressBook_Model> list = new List<AddressBook_Model>();
                        Console.WriteLine("Enter number of contacts to Add");
                        int number = Convert.ToInt32(Console.ReadLine());
                        int i = 0;
                        while (i < number)
                        {
                            AddressBook_Model model = new AddressBook_Model();
                            Console.WriteLine("Enter First Name");
                            model.firstName = Console.ReadLine();
                            Console.WriteLine("Enter Last Name");
                            model.lastName = Console.ReadLine();
                            Console.WriteLine("Enter Address ");
                            model.address = Console.ReadLine();
                            Console.WriteLine("Enter City ");
                            model.city = Console.ReadLine();
                            Console.WriteLine("Enter State ");
                            model.state = Console.ReadLine();
                            Console.WriteLine("Enter Zip Code ");
                            model.zipCode = Convert.ToDouble(Console.ReadLine());
                            Console.WriteLine("Enter Phone ");
                            model.phone = Convert.ToDouble(Console.ReadLine());
                            Console.WriteLine("Enter Email ");
                            model.email = Console.ReadLine();
                            Console.WriteLine("Enter Type ");
                            model.type = Console.ReadLine();
                            list.Add(model);
                            i++;
                        }
                        getMethod.AddMultipleContacts(list);
                        break;
                    }
                default:
                    {
                        Console.WriteLine("Enter a valid Number");
                        break;
                    }
            }
        }
    }
}