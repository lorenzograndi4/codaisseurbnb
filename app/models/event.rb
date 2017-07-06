class Event < ApplicationRecord
  belongs_to :user
  has_many :photos 
  has_and_belongs_to_many :themes

  validates :name, :location, :starts_at,
    presence: true
  # validates :ends_at,
  #   date: { after_or_equal_to:  :starts_at}
  validates :description,
    length: { maximum: 500 }

  def bargain?
    price <= 30
  end

  def self.order_by_price
    order price: :asc
  end

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
