
require 'rails_helper'

describe Merchant, type: :model do
    tyla = Merchant.create!(name: "Tyla")
    binding.pry
end
