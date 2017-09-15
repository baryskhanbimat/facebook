require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_many(:users).through(:role_users) }
end
