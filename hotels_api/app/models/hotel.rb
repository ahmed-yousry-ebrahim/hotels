class Hotel < ActiveRecord::Base
  belongs_to :accomodation_type
  validates_presence_of :name, :star_rating, :address, :accomodation_type_id
  validates_numericality_of :star_rating, { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 }
  searchable do
    text :name, :address
  end
end
