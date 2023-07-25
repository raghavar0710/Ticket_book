class Welcome < ApplicationRecord

  enum role: {Employee: 0, Passenger: 1, Admin: 2}

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

end
