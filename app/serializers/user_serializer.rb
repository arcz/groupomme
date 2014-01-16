class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar

  def avatar
    object.avatar.url(:thumb)
  end
end
