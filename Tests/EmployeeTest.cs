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
      Employee.DeleteAll();
    }
    [Fact]
    public void Test_EmptyDatabase_DatabaseIsEmpty()
    {
      // Arrange
      List<Employee> allEmployees = new List<Employee>{};
      allEmployees = Employee.GetAll();
      // Act
      int countActual = allEmployees.Count;
      // Assert
      Assert.Equal(0, countActual);
    }
    [Fact]
    public void Test_AddEmployee_AddsEmployeeToDatabase()
    {
      // Arrange
      Employee newEmployee = new Employee("Doc", "Gonzo");
      // Act
      newEmployee.Save();
      List<Employee> expectedEmployees = Employee.GetAll();
      int countActual = expectedEmployees.Count;
      // Assert
      Assert.Equal(1, countActual);
    }
  }
}
