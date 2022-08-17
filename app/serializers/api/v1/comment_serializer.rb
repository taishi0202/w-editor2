class Api::V1::CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :user, serializer: Api::V1::UserSerializer
  belongs_to :article, serializer: Api::V1::ArticleSerializer
end
