class Event < ApplicationRecord
  has_many :registrations, dependent: :destroy

  validates :name, :location, presence: true
  validates :description, length: { minimum: 25 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }

  def self.upcoming
    where('start_at > ?', Time.now).order('start_at')
  end

  def self.past
    where('start_at < ?', Time.now).order('start_at')
  end

  def free?
    price.blank? || price.zero?
  end

  def sold_out?
    (capacity - registrations.size).zero?
  end
end
