class MovieSerializer
  include FastJsonapi::ObjectSerializer

  # We can control what attributes we want to expose
  attributes :name, :image_url, :slug

  has_many :reviews
end
