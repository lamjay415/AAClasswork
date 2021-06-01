class Employee
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(mult)
        @salary * mult
    end
end

class Manager < Employee
    def initialize
        @employees = []
    end

    def bonus(mult)
        mult * get_all_emp_salary(@employees)
    end

    def get_all_emp_salary(array)
        salary = 0
        array.each do |employee|
            if employee.is_a? Manager
                get_all_emp_salary(employee.employees)
            else
                salary += employee.salary
            end
        end
        salary
    end
end

