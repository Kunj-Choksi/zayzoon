# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

employer = Employer.create(name: 'AcmeCo')

employer.employees.create(name: 'John', external_ref: 'A123')
employer.employees.create(name: 'Rina', external_ref: 'B456')

format = { 
            employee_external_ref: {value: 'EmployeeNumber', type: 'string'}, 
            earning_date: {value: 'CheckDate', type: 'date'}, 
            amount: {value: 'Amount', type: 'float'} 
        }

employer.create_employer_data_format(fields: format.to_h)
