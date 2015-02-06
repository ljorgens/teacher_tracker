class Student < ActiveRecord::Base
  has_and_belongs_to_many(:periods)

  scope :between_dates, lambda (begin_date, end_date) { where('birthday > begin_date AND birthday < end_date', begin_date, end_date)}
end
