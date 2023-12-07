class EmployeeController < ApplicationController

  #Code for Storing the Employee details : Task 1 
  def store
    employee = Employee.build(employee_params)

    if employee.save
      render json: { success: true, errors: [], data: employee.to_json }
    else
      render json: { success: false, errors: employee.errors.full_messages}
    end
  end
  #End of Code for Storing the Employee details : Task 1 
    
    
  #Code for Storing the Employee Tax Deductions : Task 2
  def tax_deductions
    employee_id = params[:employee_id]

    employee = Employee.find_by(:employee_id)

    if employee
      if doj.year = 2023
        month = doj.month
        months = 12-month-1
      else
        months = 12
      end
      month = doj.month

      yearly_salary = employee.salary*months

      tax_amount = 0

      if yearly_salary < 250000
        tax_amount = 0
      elsif yearly_salary > 250000 && yearly_salary < 500000
        tax_amount += (yearly_salary*5)/100
      elsif yearly_salary > 500000 && yearly_salary < 1000000
        tax_amount += 12500
        tax_amount += ((yearly_salary - 500000)*10))/100
      else
        tax_amount += 12500
        tax_amount += 25000
        tax_amount += ((yearly_salary - 1000000)*10))/100
      end

      render json: {
        success: true,
        errors: [],
        data: {
          employee: {
            employee_code: employee.employee_id,
            first_name: employee.first_name,
            last_name: employee.last_name,
            yearly_salary: ,
            tax_amount: tax_amount,
            cess_amount: cess_amount
          }
        }
      }
    else
      render json: { success: false, errors: ['Employee not found']}
    end

  end
  #End of Code for Storing the Employee Tax Deductions : Task 2

  private

  def employee_params
    params.require(:employee).permit(
      :first_name,
      :last_name,
      :doj,
      :salary,
      :email,
      phone_numbers: []
      )
end
