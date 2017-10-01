class Organization < ApplicationRecord

	has_many :memberships
	has_many :members, through: :memberships, :source => :user
	has_many :notes, as: :notable
	validates :name, length: {minimum: 3}
	
	validates :website, format: {with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/, on: :create}, :allow_blank => true



end
