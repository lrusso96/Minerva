require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'valido' do
    it 'generico user' do
      user = create(:user)
      expect(user).to be_valid
    end

    it 'generico admin' do
      user = create(:admin)
      expect(user).to be_valid
    end
  end

  describe 'non valido' do
    it 'senza mail' do
      user = build(:user)
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'senza mail' do
      user = build(:user)
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'senza cognome' do
      user = build(:user)
      user.surname = nil
      expect(user).not_to be_valid
    end

    it 'password corta' do
      user = build(:user)
      user.password = '123'
      user.password_confirmation = '123'
      expect(user).not_to be_valid
    end

    it 'password diverse' do
      user = build(:user)
      user.password = 'password1'
      user.password_confirmation = 'password2'
      expect(user).not_to be_valid
    end

    it 'minore età' do
      user = build(:user)
      user.birthdate = Time.now.to_date - 10.year
      expect(user).not_to be_valid
    end

    it 'compleanno assente' do
      user = build(:user)
      user.birthdate = nil
      expect(user).not_to be_valid
    end
  end
end
