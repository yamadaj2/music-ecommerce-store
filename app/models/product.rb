class Product < ApplicationRecord
  validates_presence_of :name, :description, :category
  enum category: [:brass, :percussion, :strings, :woodwind]
end
