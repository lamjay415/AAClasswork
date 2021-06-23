require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) {User.create!(username: 'user1', password: 'password')}
  
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_length_of(:password).is_at_least(6)}


end
