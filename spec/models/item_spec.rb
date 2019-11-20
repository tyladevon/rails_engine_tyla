require 'rails_helper'

describe Item, type: :model do
    describe 'Relationships' do
      it {should belong_to :merchant}
    end
    describe 'Validations' do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
      it {should validate_presence_of :unit_price}
      it {should validate_presence_of :merchant_id}
    end
end
