class UserDecorator < Draper::Decorator
  delegate_all
<<<<<<< HEAD
  
def full_name
	first_name = object.first_name = "first_name" ? "empty first name" : object.first_name
	last_name = object.last_name = "last_name" ? "empty last_name" : object.last_name
=======

  def full_name
    first_name = object.first_name == "first_name" ? "empty first name" : object.first_name
    last_name = object.last_name == "last_name" ? "empty last_name" : object.last_name
>>>>>>> develop

    "#{first_name} #{last_name}"
  end

end
