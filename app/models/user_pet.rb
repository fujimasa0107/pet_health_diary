class UserPet
  include ActiveModel::Model
  attr_accessor :email, :password, :password_confirmation, :name, :pet_name, :pet_age, :pet_weight

  validates :email, presence: { message: 'Please enter an email address' }
  validates :password, presence: { message: 'Please enter a password' }
  validates :password_confirmation, presence: { message: 'Please confirm your password' }
  validates :name, presence: { message: 'Please enter a name' }
  validates :pet_name, presence: { message: 'Please enter your pet\'s name' }
  validates :pet_age, numericality: { only_integer: true, greater_than: 0, message: 'Please enter a valid pet age' }
  validates :pet_weight, numericality: { greater_than_or_equal_to: 0, message: 'Please enter a valid pet weight' }
  
  def save
    return false unless valid?

    user = User.new(email: email, password: password, password_confirmation: password_confirmation, name: name)
    if user.save
      user.pets.create(name: pet_name, age: pet_age, weight: pet_weight)
      return user
    else
      user.errors.full_messages.each { |msg| errors.add(:base, msg) }
      return false
    end
  end
end
