# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
    @user_pet = UserPet.new
    super
   end

  # POST /resource
  def create
    @user_pet = UserPet.new(sign_up_params)
    user = @user_pet.save
    if user
      sign_in(user) # Userインスタンスを渡す
      redirect_to root_path
    else
      flash.now[:notice] = "登録に失敗しました"
      render :new
    end
  end

  def edit
    user = current_user
    pet = user.pets.first # 仮定: ユーザーには少なくとも1つのペットが関連付けられている
    @user_pet = UserPet.new(
      name: user.name,
      pet_name: pet.name, 
      pet_age: pet.age, 
      pet_weight: pet.weight, 
    )
    super
  end

  # PUT /resource
  def update
    # UserPetインスタンスを更新パラメータで初期化
    @user_pet = UserPet.new(account_update_params.merge(user: current_user))
    @user_pet.update_context = true
    if @user_pet.save
      # 成功した場合の処理
      set_flash_message :notice, :updated
      sign_in resource_name, resource, bypass: true
      redirect_to root_path
    else
      # 失敗した場合の処理
      respond_with resource
    end
  end

  private

  def sign_up_params
    params.require(:user_pet).permit(:email, :password, :password_confirmation, :name, :pet_name, :pet_age, :pet_weight)
  end

  def account_update_params
    params.require(:user_pet).permit(:name, :pet_name, :pet_age, :pet_weight, :update_context)
  end
end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end