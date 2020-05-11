# frozen_string_literal: true

module Api::V1
  class UserService
    def self.create(attrs)
      params = user_params(attrs)
      { code: 400, error: 'paramtros não permitidos' } unless params.permitted?

      create_user(params)
    end

    private_class_method def self.create_user(attrs)
      @user = User.create(attrs)
      return { code: 400, error: @user.errors.as_json } if @user.errors.present?

      @user
    end

    private_class_method def self.user_params(params)
      params.require(:user).permit(:name, :email, :password,
                                   :cpf,  :telephone)
    end
  end
end
