using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using Xunit;

namespace SeattleHealthClinic
{
  public class EmployeeTest : IDisposable
  {
    public EmployeeTest()
    {
      DBConfiguration.ConnectionString = "Data Source=(localdb)\\mssqllocaldb;Initial Catalog=seattle_health_clinic_test;Integrated Security=SSPI;";
    }
    public void Dispose()
    {
      Employee.DeleteAll("employees");
      License.DeleteAll();
      Payroll.DeleteAll();
      Physician.DeleteAll("physicians");
    }
    [Fact]
    public void Test_EmptyDataTable_DataTableIsEmpty()
    {
      // Arrange
      List<Employee> allEmployees = new List<Employee>{};
      allEmployees = Employee.GetAll("employees");
      // Act
      int countActual = allEmployees.Count;
      // Assert
      Assert.Equal(0, countActual);
    }
    [Fact]
    public void Test_AddEmployee_AddsEmployeeToDatabase()
    {
      // Arrange
      string firstExpected = "Doc";
      string lastExpected = "Gonzo";
      string ssnExpected = "000-00-0000";
      string typeExpected = "Medical";
      string salaryTypeExpected = "Annual";
      string emailExpected = "docgonzo@outlook.com";
      string passwordExpected = "password";
      DateTime hireDateExpected = new DateTime(2016, 1, 1);
      Employee newEmployee = new Employee(firstExpected, lastExpected, ssnExpected, typeExpected, salaryTypeExpected, emailExpected, passwordExpected, hireDateExpected);
      // Act
      newEmployee.Save("employees");
      List<Employee> expectedEmployees = Employee.GetAll("employees");
      int countActual = expectedEmployees.Count;
      // Assert
      Assert.Equal(1, countActual);
    }
    [Fact]
    public void Test_Save_AssignsIdToObject()
    {
      //Arrange
      string firstExpected = "Doc";
      string lastExpected = "Gonzo";
      string ssnExpected = "000-00-0000";
      string typeExpected = "Medical";
      string salaryTypeExpected = "Annual";
      string emailExpected = "docgonzo@outlook.com";
      string passwordExpected = "password";
      DateTime hireDateExpected = new DateTime(2016, 1, 1);
      Employee newEmployee = new Employee(firstExpected, lastExpected, ssnExpected, typeExpected, salaryTypeExpected, emailExpected, passwordExpected, hireDateExpected);
      newEmployee.Save("employees");
      int expectedId = newEmployee.GetId();
      //Act
      Employee savedEmployee = Employee.GetAll("employees")[0];
      int actualId = savedEmployee.GetId();
      //Assert
      Assert.Equal(expectedId, actualId);
    }
    [Fact]
    public void Test_Find_FindsEmployeeById()
    {
      // Arrange
      string firstExpected = "Doc";
      string lastExpected = "Gonzo";
      string ssnExpected = "000-00-0000";
      string typeExpected = "Medical";
      string salaryTypeExpected = "Annual";
      string emailExpected = "docgonzo@outlook.com";
      string passwordExpected = "password";
      DateTime hireDateExpected = new DateTime(2016, 1, 1);
      Employee newEmployee = new Employee(firstExpected, lastExpected, ssnExpected, typeExpected, salaryTypeExpected, emailExpected, passwordExpected, hireDateExpected);
      newEmployee.Save("employees");
      int findId = newEmployee.GetId();
      // Act
      Employee employeeActual = Employee.Find(findId);
      string firstActual = newEmployee.GetFirstName();
      string lastActual = newEmployee.GetLastName();
      // Assert
      Assert.Equal(firstExpected, firstActual);
      Assert.Equal(lastExpected, lastActual);
    }
    [Fact]
    public void Test_UpdateName_UpdatesEmployeeNameInDatabase()
    {
      // Arrange
      string firstExpected = "Doc";
      string lastExpected = "Gonzo";
      string ssnExpected = "000-00-0000";
      string typeExpected = "Medical";
      string salaryTypeExpected = "Annual";
      string emailExpected = "docgonzo@outlook.com";
      string passwordExpected = "password";
      DateTime hireDateExpected = new DateTime(2016, 1, 1);
      Employee newEmployee = new Employee(firstExpected, lastExpected, ssnExpected, typeExpected, salaryTypeExpected, emailExpected, passwordExpected, hireDateExpected);
      newEmployee.Save("employees");
      string newFirst = "Dr.";
      string newLast = "Aharchi";
      string newName = "Dr." + "Aharchi";
      // Act
      newEmployee.UpdateName(newFirst, newLast);
      // Assert
      Assert.Equal(newName, newEmployee.GetFirstName() + newEmployee.GetLastName());
    }
    [Fact]
    public void Test_AddLicense_AddsLicenseToEmployee()
    {
      //Arrange
      string firstExpected = "Doc";
      string lastExpected = "Gonzo";
      string ssnExpected = "000-00-0000";
      string typeExpected = "Medical";
      string salaryTypeExpected = "Annual";
      string emailExpected = "docgonzo@outlook.com";
      string passwordExpected = "password";
      DateTime hireDateExpected = new DateTime(2016, 1, 1);
      Employee newEmployee = new Employee(firstExpected, lastExpected, ssnExpected, typeExpected, salaryTypeExpected, emailExpected, passwordExpected, hireDateExpected);
      newEmployee.Save("employees");
      License newLicense1 = new License("WA9999", "MD");
      newLicense1.Save();
      License newLicense2 = new License("WA0000", "RN");
      newLicense2.Save();
      //Act
      newEmployee.AddLicense(newLicense1);
      newEmployee.AddLicense(newLicense2);
      List<License> result = newEmployee.GetLicenses();
      int actualCount = result.Count;
      List<License> newList = new List<License>{newLicense1, newLicense2};
      int expectedCount = newList.Count;
      //Assert
      Assert.Equal(expectedCount, actualCount);
    }
    [Fact]
    public void Test_GetLicenses_ReturnsAllEmployeeLicenses()
    {
      //Arrange
      string firstExpected = "Doc";
      string lastExpected = "Gonzo";
      string ssnExpected = "000-00-0000";
      string typeExpected = "Medical";
      string salaryTypeExpected = "Annual";
      string emailExpected = "docgonzo@outlook.com";
      string passwordExpected = "password";
      DateTime hireDateExpected = new DateTime(2016, 1, 1);
      Employee newEmployee = new Employee(firstExpected, lastExpected, ssnExpected, typeExpected, salaryTypeExpected, emailExpected, passwordExpected, hireDateExpected);
      newEmployee.Save("employees");
      License newLicense1 = new License("WA9999", "MD");
      newLicense1.Save();
      License newLicense2 = new License("WA0000", "RN");
      newLicense2.Save();
      List<License> newList = new List<License> {newLicense1};
      //Act
      newEmployee.AddLicense(newLicense1);
      List<License> savedLicenses = newEmployee.GetLicenses();
      int expectedCount = newList.Count;
      int actualCount = savedLicenses.Count;
      //Assert
      Assert.Equal(expectedCount, actualCount);
    }
    [Fact]
    public void Test_VerifyLogin_ChecksLoginInfoAgainstDatabase()
    {
      //Arrange
      string firstExpected = "Doc";
      string lastExpected = "Gonzo";
      string ssnExpected = "000-00-0000";
      string typeExpected = "Medical";
      string salaryTypeExpected = "Annual";
      string emailExpected = "docgonzo@outlook.com";
      string passwordExpected = "password";
      DateTime hireDateExpected = new DateTime(2016, 1, 1);
      Employee newEmployee = new Employee(firstExpected, lastExpected, ssnExpected, typeExpected, salaryTypeExpected, emailExpected, passwordExpected, hireDateExpected);
      newEmployee.SetLogin("doc@doc.com", "password");
      newEmployee.Save("employees");
      newEmployee.SaveLogin();

      //Act
      bool expected = true;
      bool result = Employee.VerifyLogin("doc@doc.com", "password");
      //check for negative case
      bool expected2 = false;
      bool result2 = Employee.VerifyLogin("john@john.com", "password");

      //Assert
      Assert.Equal(expected, result);
      Assert.Equal(expected2, result2);
    }

    [Fact]
    public void Test_Delete_DeleteSingleOneAndAssociateTable()
    {
      //Arrange
      string firstExpected = "Doc";
      string lastExpected = "Gonzo";
      string ssnExpected = "000-00-0000";
      string typeExpected = "Medical";
      string salaryTypeExpected = "Annual";
      string emailExpected = "docgonzo@outlook.com";
      string passwordExpected = "password";
      DateTime hireDateExpected = new DateTime(2016, 1, 1);
      Employee newEmployee = new Employee(firstExpected, lastExpected, ssnExpected, typeExpected, salaryTypeExpected, emailExpected, passwordExpected, hireDateExpected);
      newEmployee.Save("employees");
      Employee newEmployee2 = new Employee("John", lastExpected, ssnExpected, typeExpected, salaryTypeExpected, emailExpected, passwordExpected, hireDateExpected);
      newEmployee2.Save("employees");
      License newLicense1 = new License("WA9999", "MD");
      newLicense1.Save();
      License newLicense2 = new License("WA0000", "RN");
      newLicense2.Save();
      List<License> newList = new List<License> {newLicense1};
      //Act
      newEmployee.AddLicense(newLicense1);
      newEmployee.Delete();
      List<Employee> resultEmployees = Employee.GetAll("employees");
      List<Employee> expectedEmployees = new List<Employee>{newEmployee2};
        Console.WriteLine(newEmployee.GetFullName());
          Console.WriteLine(newEmployee2.GetFullName());
          Console.WriteLine(resultEmployees[0].GetFullName());

      //Assert
      Assert.Equal(expectedEmployees[0].GetFullName(), resultEmployees[0].GetFullName());
      Assert.Equal(0, newEmployee.GetLicenses().Count);

    }
  }
}
