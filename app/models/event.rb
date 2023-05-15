class Event < ApplicationRecord

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: 'User'

  validates :start_date, presence: true
  validate :not_passed

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :valid_duration

  validates :title, presence: true, length: { minimum: 5, maximum: 140 }
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :price, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :location, presence: true

  def not_passed
    if start_date.present? && start_date < Time.now
      errors.add(:start_date, "La date indiquée est dépassée.")
    end
  end

  def valid_duration
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "La duée doit être un mulptiple de 5")
    end
  end

end
