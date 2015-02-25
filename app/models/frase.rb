class Frase
  include Mongoid::Document
  field :texto, type: String
  field :autor, type: String
end
