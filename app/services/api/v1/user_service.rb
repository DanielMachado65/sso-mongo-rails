# frozen_string_literal: true

module Api::V1
  class UserService
    def self.create(attrs)
      params = user_params(attrs)
      raise 'paramtros não permitidos' unless params.permitted?

      create_user(params)
    end

    private_class_method def self.create_user(attrs)
      @user = User.create(attrs)
      return { code: 400, error: @user.errors.as_json } if @user.errors.present?

      @user.regenerate_token ? @user : { code: 400, error: 'auth token error' }
    end

    private_class_method def self.user_params(params)
      params.require(:user).permit(:name, :email, :password,
                                   :cpf, :telephone, :rg)
    end
  end
end
