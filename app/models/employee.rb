class Employee < ApplicationRecord

	EMAIL_REGEX =^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$
	
	validates_presence_of :first_name, :last_name, :salary, :doj, :phone_numbers

	validates_format_of   ∶email, with: EMAIL_REGEX

	validates :phone_number,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 10 }

	after_save :create_employeid

	def create_employeeid
		update_column(:employee_id, "EMP0#{self.id}")
	end
end
