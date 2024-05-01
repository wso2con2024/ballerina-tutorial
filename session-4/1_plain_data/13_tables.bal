import ballerina/io;

type Employee record {|
    readonly int id;
    readonly string department;
    string firstName;
    string lastName;
    boolean permanent;
|};

type EmployeeTable table<Employee> key(id, department);

public function main() {

    EmployeeTable employees = table [];

    employees.add({id: 1, department: "HR", firstName: "John", lastName: "Doe", permanent: false});
    employees.add({id: 2, department: "HR", firstName: "Jane", lastName: "Doe", permanent: false});
    employees.add({id: 1, department: "IT", firstName: "Alice", lastName: "Smith", permanent: false});
    employees.add({id: 2, department: "IT", firstName: "Bob", lastName: "Smith", permanent: false});

    // Update the employee record with key [1, "HR"]
    if employees.hasKey([1, "HR"]) {
        Employee emp1 = employees.get([1, "HR"]);
        emp1.permanent = true;
    }

    // Search employees with name "Alice"
    Employee[] result1 = from var emp in employees
        where emp.firstName.toLowerAscii() == "alice"
        select emp;

    Employee[] result2 = employees
                .filter((value) => value.firstName.toLowerAscii() == "alice")
                .toArray();

    io:println("Employees with name Alice:", result1);
    io:println("Employees with name Alice:", result2);

    // Table are set
    employees.add({id: 1, department: "HR", firstName: "Sam", lastName: "Brown", permanent: false});
    //        ^^^ panic: duplicate key: [1, "HR"]
}
