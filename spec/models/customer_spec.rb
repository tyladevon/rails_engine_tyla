require 'rails_helper'

describe Customer, type: :model do
    describe 'Validations' do
      it {should validate_presence_of :first_name}
      it {should validate_presence_of :last_name}
    end
end
