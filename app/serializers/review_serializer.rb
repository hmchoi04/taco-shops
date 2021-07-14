class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score, :shop_id
end
