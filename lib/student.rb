class Student < ActiveRecord::Base
  has_and_belongs_to_many(:periods)

  scope(:between, lambda do |start_date, end_date|
    where('birthday >= :start_date AND birthday <= :end_date',
          { :start_date => start_date, :end_date => end_date} )

  end)

end
