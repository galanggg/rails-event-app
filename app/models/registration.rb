class Registration < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :email, format: { with: /\S+@\S+/ }

  HEARD_FROM_OPTIONS = %w[Newsletter Facebook LinkedIn Twitter Instagram Other]

  validates :heard_from, inclusion: { in: HEARD_FROM_OPTIONS }
end
