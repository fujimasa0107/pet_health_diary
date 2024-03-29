class UserPet
  include ActiveModel::Model
  attr_accessor :email, :password, :password_confirmation, :name, :pet_name, :pet_age, :pet_weight, :update_context, :user

  validates :email, presence: true, unless: -> { update_context }
  validates :password, presence: true, confirmation: true, unless: -> { update_context }
  validates :password_confirmation, presence: true, unless: -> { update_context }
  validates :name, presence: true
  validates :pet_name, presence: true
  validates :pet_age, numericality: { only_integer: true, greater_than: 0 }
  validates :pet_weight, numericality: { greater_than_or_equal_to: 0 }
  
  def save
    return false unless valid?

    if update_context
      # 更新処理
      user.update(name: name)
      pet = user.pets.first 
      pet.update(name: pet_name, age: pet_age, weight: pet_weight)
      true
    else
      # 新規作成処理
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
end
