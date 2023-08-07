#1. Use Blocks, Procs and Lambda each to write a program which takes array of integers as an input and finds the count of even numbers in the array
def count_even_numbers(arr, &block)
  count = 0
  arr.each do |num|
    count += 1 if block.call(num)
  end
  count
end

# Using block
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
even_count = count_even_numbers(numbers) { |num| num.even? }
puts "Count of even numbers using block: #{even_count}"

# Using proc
even_proc = proc { |num| num.even? }
even_count_proc = count_even_numbers(numbers, &even_proc)
puts "Count of even numbers using proc: #{even_count_proc}"

# Using lambda
even_lambda = ->(num) { num.even? }
even_count_lambda = count_even_numbers(numbers, &even_lambda)
puts "Count of even numbers using lambda: #{even_count_lambda}"


#2.A company has many departments such as HR, Engineering, Sales, Marketting. 
class Employee
  attr_accessor :name, :designation

  def initialize(name, designation)
    @name = name
    @designation = designation
  end
end

class Department
  attr_accessor :name, :employees

  def initialize(name)
    @name = name
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end
end

class Project
  attr_accessor :name, :department

  def initialize(name, department)
    @name = name
    @department = department
  end
end

class Company
  attr_accessor :name, :departments, :projects

  def initialize(name)
    @name = name
    @departments = []
    @projects = []
  end

  def add_department(department)
    @departments << department
  end

  def add_project(project)
    @projects << project
  end
end

# Creating employees
employee1 = Employee.new("Anu", "Software Engineer")
employee2 = Employee.new("Radha", "Project Manager")
employee3 = Employee.new("Michel", "HR Manager")

# Creating departments
development_dept = Department.new("Development")
development_dept.add_employee(employee1)
development_dept.add_employee(employee2)

hr_dept = Department.new("Human Resources")
hr_dept.add_employee(employee3)


project1 = Project.new("Banking Project", development_dept)
project2 = Project.new("Recruitment Drive", hr_dept)

company = Company.new("webonise")
company.add_department(development_dept)
company.add_department(hr_dept)
company.add_project(project1)
company.add_project(project2)

puts "Company Name: #{company.name}"
puts "Departments:"
company.departments.each do |department|
  puts " - #{department.name}"
  puts "   Employees:"
  department.employees.each do |employee|
    puts "    - #{employee.name}, #{employee.designation}"
  end
end

puts "Projects:"
company.projects.each do |project|
  puts " - #{project.name}"
  puts "   Department: #{project.department.name}"
end

#3.
class Employee
  attr_accessor :name, :designation

  def initialize(name, designation)
    @name = name
    @designation = designation
  end
end

class Division
  attr_accessor :name, :employees

  def initialize(name)
    @name = name
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end
end

class Department
  attr_accessor :name, :department_head, :divisions

  def initialize(name, department_head)
    @name = name
    @department_head = department_head
    @divisions = []
  end

  def add_division(division)
    @divisions << division
  end

  def total_employees
    total = @divisions.sum { |division| division.employees.size }
    total += @employees.size if @divisions.empty?
    total
  end
end

class Company
  attr_accessor :name, :departments

  def initialize(name)
    @name = name
    @departments = []
  end

  def add_department(department)
    @departments << department
  end
end


employee1 = Employee.new("John Doe", "Software Engineer")
employee2 = Employee.new("Jane Smith", "Project Manager")
employee3 = Employee.new("Michael Brown", "HR Manager")
employee4 = Employee.new("Alice Johnson", "QA Engineer")
employee5 = Employee.new("John", "Devops Engineer")
employee6 = Employee.new("Niel", "TMG")
employee7 = Employee.new("Smith", "operations")

development_division = Division.new("Development")
development_division.add_employee(employee1)

qa_division = Division.new("QA")
qa_division.add_employee(employee4)

devops_division = Division.new("Devops")
devops_division.add_employee(employee5)


recruitment_division = Division.new("Recruitment")
recruitment_division.add_employee(employee3)

TMG_division = Division.new("TMG")
TMG_division.add_employee(employee6)

operations_division = Division.new("Operations")
operations_division.add_employee(employee7)

engineering_dept = Department.new("Engineering", "Engineering Head")
engineering_dept.add_division(development_division)
engineering_dept.add_division(qa_division)
engineering_dept.add_division(devops_division)


hr_dept = Department.new("HR", "HR Head")
hr_dept.add_division(recruitment_division)
hr_dept.add_division(TMG_division)
hr_dept.add_division(operations_division)


company = Company.new("webonise")
company.add_department(engineering_dept)
company.add_department(hr_dept)


puts "Company Name: #{company.name}"
puts "Departments:"
company.departments.each do |department|
  puts " - #{department.name}"
  puts "   Department Head: #{department.department_head}"
  puts "   Total Employees: #{department.total_employees}"
  department.divisions.each do |division|
    puts "    - #{division.name}"
    puts "      Employees:"
    division.employees.each do |employee|
      puts "       - #{employee.name}, #{employee.designation}"
    end
  end
end


#4
class Employee
  attr_accessor :name, :designation

  def initialize(name, designation)
    @name = name
    @designation = designation
  end
end

class Division
  attr_accessor :name, :employees

  def initialize(name)
    @name = name
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end
end

class Department
  attr_accessor :name, :department_head, :employees, :divisions

  def initialize(name, department_head)
    @name = name
    @department_head = department_head
    @employees = []
    @divisions = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def add_division(division)
    @divisions << division
  end

  def total_employees
    total = @divisions.sum { |division| division.employees.size }
    total += @employees.size if @divisions.empty?
    total
  end
end

class Company
  attr_accessor :name, :departments

  def initialize(name)
    @name = name
    @departments = []
  end

  def add_department(department)
    @departments << department
  end
end

#  employees
employee1 = Employee.new("John Doe", "Software Engineer")
employee2 = Employee.new("Jane Smith", "Project Manager")
employee3 = Employee.new("Michael Brown", "HR Manager")
employee4 = Employee.new("Alice Johnson", "QA Engineer")

#  divisions
development_division = Division.new("Development")
development_division.add_employee(employee1)

qa_division = Division.new("QA")
qa_division.add_employee(employee4)

recruitment_division = Division.new("Recruitment")
recruitment_division.add_employee(employee3)

#  departments
engineering_dept = Department.new("Engineering", "Engineering Head")
engineering_dept.add_employee(employee1)
engineering_dept.add_employee(employee2)

hr_dept = Department.new("HR", "HR Head")
hr_dept.add_employee(employee3)
# company
company = Company.new("webonise")
company.add_department(engineering_dept)
company.add_department(hr_dept)


puts "Company Name: #{company.name}"
puts "Departments:"
company.departments.each do |department|
  puts " - #{department.name}"
  puts "   Department Head: #{department.department_head}"
  puts "   Total Employees: #{department.total_employees}"
  puts "   Employees:"
  department.employees.each do |employee|
    puts "    - #{employee.name}, #{employee.designation}"
  end
  department.divisions.each do |division|
    puts "    - #{division.name}"
    puts "      Employees:"
    division.employees.each do |employee|
      puts "       - #{employee.name}, #{employee.designation}"
    end
  end
end


#4
require 'csv'

class Employee
  attr_accessor :name, :age, :designation

  def initialize(name, age, designation)
    @name = name
    @age = age
    @designation = designation
  end
end

class Division
  attr_accessor :name, :employees

  def initialize(name)
    @name = name
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end
end

class Department
  attr_accessor :name, :department_head, :employees, :divisions

  def initialize(name, department_head)
    @name = name
    @department_head = department_head
    @employees = []
    @divisions = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def add_division(division)
    @divisions << division
  end

  def total_employees
    total = @divisions.sum { |division| division.employees.size }
    total += @employees.size if @divisions.empty?
    total
  end
end

class Company
  attr_accessor :name, :departments

  def initialize(name)
    @name = name
    @departments = []
  end

  def add_department(department)
    @departments << department
  end
end

class HR
  def initialize(company)
    @company = company
  end

  def add_employee(name, age, designation, department_name, division_name)
    employee = Employee.new(name, age, designation)
    department = @company.departments.find { |dept| dept.name == department_name }
    if department
      division = department.divisions.find { |div| div.name == division_name }
      if division
        division.add_employee(employee)
      else
        department.add_employee(employee)
      end
      puts "Employee '#{name}' added successfully."
      save_employee_details_to_csv
    else
      puts "Department '#{department_name}' not found."
    end
  end

  private

  def save_employee_details_to_csv
    CSV.open("employee_details.csv", "w") do |csv|
      csv << ["Name", "Age", "Designation", "Department", "Division"]
      @company.departments.each do |department|
        department.employees.each do |employee|
          csv << [employee.name, employee.age, employee.designation, department.name, ""]
        end
        department.divisions.each do |division|
          division.employees.each do |employee|
            csv << [employee.name, employee.age, employee.designation, department.name, division.name]
          end
        end
      end
    end
  end
end

class DepartmentHead
  def initialize(department)
    @department = department
  end

  def get_employee_details
    puts "Department: #{@department.name}"
    puts "Department Head: #{@department.department_head}"
    puts "Total Employees: #{total_employees}"
    puts "Employees:"
    @department.employees.each do |employee|
      puts " - Name: #{employee.name}, Age: #{employee.age}, Designation: #{employee.designation}"
    end
    @department.divisions.each do |division|
      puts " - Division: #{division.name}"
      puts "   Employees:"
      division.employees.each do |employee|
        puts "    - Name: #{employee.name}, Age: #{employee.age}, Designation: #{employee.designation}"
      end
    end
  end

  private

  def total_employees
    total = @department.divisions.sum { |division| division.employees.size }
    total += @department.employees.size if @department.divisions.empty?
    total
  end
end

#  company and departments
company = Company.new("Tech Solutions")
engineering_dept = Department.new("Engineering", "Engineering Head")
hr_dept = Department.new("HR", "HR Head")

#  departments to company
company.add_department(engineering_dept)
company.add_department(hr_dept)

#  HR and Department Heads
hr = HR.new(company)
hr_dept_head = DepartmentHead.new(hr_dept)
engineering_dept_head = DepartmentHead.new(engineering_dept)

#  employees using HR
hr.add_employee("John Doe", 30, "Software Engineer", "Engineering", "Development")
hr.add_employee("Jane Smith", 28, "Project Manager", "Engineering", "Development")
hr.add_employee("Michael Brown", 35, "HR Manager", "HR", "")
hr.add_employee("Alice Johnson", 25, "QA Engineer", "Engineering", "QA")

# Getting employee details using Department Heads
hr_dept_head.get_employee_details
engineering_dept_head.get_employee_details

#5
class Client
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Project
  attr_accessor :name, :type, :clients

  def initialize(name, type)
    @name = name
    @type = type
    @clients = []
  end
end

class Service < Project
  attr_accessor :external_client

  def initialize(name, external_client)
    super(name, "Service")
    @external_client = external_client
  end
end

class Product < Project
  def initialize(name)
    super(name, "Product")
  end
end

class Department
  attr_accessor :name, :department_head, :employees, :divisions, :projects

  def initialize(name, department_head)
    @name = name
    @department_head = department_head
    @employees = []
    @divisions = []
    @projects = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def add_division(division)
    @divisions << division
  end

  def add_project(project)
    @projects << project
  end

  def total_employees
    total = @divisions.sum { |division| division.employees.size }
    total += @employees.size if @divisions.empty?
    total
  end
end

class Company
  attr_accessor :name, :departments

  def initialize(name)
    @name = name
    @departments = []
  end

  def add_department(department)
    @departments << department
  end
end

# Creating company and departments
company = Company.new("webonise")
engineering_dept = Department.new("Engineering", "Engineering Head")
hr_dept = Department.new("HR", "HR Head")

# Adding departments to company
company.add_department(engineering_dept)
company.add_department(hr_dept)

# Adding projects to departments
service_project = Service.new("Web Development", Client.new("ABC Company"))
product_project = Product.new("Mobile App")

engineering_dept.add_project(service_project)
engineering_dept.add_project(product_project)

engineering_dept.add_employee("John Doe")
engineering_dept.add_employee("Jane Smith")
hr_dept.add_employee("Michael Brown")
hr_dept.add_employee("Alice Johnson")

engineering_dept.projects.each do |project|
  puts "Project Name: #{project.name}"
  puts "Project Type: #{project.type}"
  if project.type == "Service"
    puts "External Client: #{project.external_client.name}"
  else
    puts "Product Clients:"
    product_clients = ["Client A", "Client B", "Client C"]
    product_clients.each { |client| puts " - #{client}" }
  end
end

#6
class Client
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Project
  attr_accessor :name, :type, :clients

  def initialize(name, type)
    @name = name
    @type = type
    @clients = []
  end
end

class Service < Project
  attr_accessor :external_client, :revenue, :profit

  def initialize(name, external_client, revenue)
    super(name, "Service")
    @external_client = external_client
    @revenue = revenue
    calculate_profit
  end

  def calculate_profit
    @profit = @revenue * 0.3
  end
end

class Product < Project
  attr_accessor :revenue, :profit

  def initialize(name, revenue)
    super(name, "Product")
    @revenue = revenue
    calculate_profit
  end

  def calculate_profit
    @profit = @revenue * 0.5 
  end
end

class Department
  attr_accessor :name, :department_head, :employees, :divisions, :projects

  def initialize(name, department_head)
    @name = name
    @department_head = department_head
    @employees = []
    @divisions = []
    @projects = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def add_division(division)
    @divisions << division
  end

  def add_project(project)
    @projects << project
  end

  def total_employees
    total = @divisions.sum { |division| division.employees.size }
    total += @employees.size if @divisions.empty?
    total
  end
end

class Company
  attr_accessor :name, :departments

  def initialize(name)
    @name = name
    @departments = []
  end

  def add_department(department)
    @departments << department
  end
end


company = Company.new("webonise")
engineering_dept = Department.new("Engineering", "Engineering Head")
hr_dept = Department.new("HR", "HR Head")


company.add_department(engineering_dept)
company.add_department(hr_dept)


service_project = Service.new("Web Development", Client.new("ABC Company"), 100000)
product_project = Product.new("Mobile App", 500000)

engineering_dept.add_project(service_project)
engineering_dept.add_project(product_project)


engineering_dept.add_employee("John Doe")
engineering_dept.add_employee("Jane Smith")
hr_dept.add_employee("Michael Brown")
hr_dept.add_employee("Alice Johnson")


engineering_dept.projects.each do |project|
  puts "Project Name: #{project.name}"
  puts "Project Type: #{project.type}"
  if project.type == "Service"
    puts "External Client: #{project.external_client.name}"
  end
  puts "Revenue: $#{project.revenue}"
  puts "Profit: $#{project.profit}"
  
end
