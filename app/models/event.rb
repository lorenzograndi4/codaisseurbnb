class Event < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_and_belongs_to_many :themes
  has_many :tickets, dependent: :destroy
  has_many :attendants, through: :tickets, source: :user

  validates :name, :location, :starts_at,
    presence: true
  # validates :ends_at,
  #   date: { after_or_equal_to:  :starts_at}
  validates :description,
    length: { maximum: 500 }

  scope :published, -> { where(active: true) }

  def self.alphabetical
    order(name: :asc)
  end

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
