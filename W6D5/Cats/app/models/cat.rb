require 'action_view'

class Cat <  ApplicationRecord 
  
  include ActionView::Helpers::DateHelper
  
  COLORS = ['orange','black', 'white','brown','yellow']

    validates :birth_date, :name, :description, presence: true
    validates_inclusion_of :color, :in => COLORS
    validates_inclusion_of :sex, :in => ['M','F']

  def age
    time_ago_in_words(self.birth_date)
  end
  

end
