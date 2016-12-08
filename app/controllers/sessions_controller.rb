class SessionsController < ApplicationController
  # respond_to? :json

  def create
    # data = ActiveModelSerializers::Deserialization.jsonapi_parse(login_params)
    data = login_params
    Rails.logger.error params.to_yaml
    user = User.where(username: data[:username]).first
    head 406 and return unless user
    if user.authenticate(data[:password])
      user.regenerate_token
      render json: user, status: :created,
             serializer: ActiveModel::Serializer::SessionSerializer and return
    end
    head 403
  end

  def destroy
    user = User.where(token: params[:id]).first
    head 404 and return unless user
    user.regenerate_token
    head 204
  end

def login_params
  params.require(:session).permit(:username, :password)
end
  

end