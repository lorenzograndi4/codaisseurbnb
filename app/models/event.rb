class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :themes

  validates :name, :location, :active, :starts_at,
    presence: true
  validates :ends_at,
    date: { after_or_equal_to:  :starts_at}
  validates :description,
    length: { maximum: 500 }

  # t.string :name
  # t.text :description
  # t.string :location
  # t.decimal :price
  # t.integer :capacity
  # t.boolean :includes_food
  # t.boolean :includes_drinks
  # t.datetime :starts_at
  # t.datetime :ends_at
  # t.boolean :active
  # t.references :user, foreign_key: true
end
