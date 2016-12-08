class SessionSerializer < ActiveModel::Serializer
  attributes :id, :username, :full_name, :token
end
