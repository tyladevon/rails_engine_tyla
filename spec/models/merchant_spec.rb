require 'rails_helper'

describe Merchant, type: :model do
    describe 'Relationships' do
      it {should have_many :items}
    end
    describe 'Validations' do
      it {should validate_presence_of :name}
    end
end
