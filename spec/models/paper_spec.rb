require 'rails_helper'

RSpec.describe Paper, type: :model do
  describe 'valido' do
    it 'generico paper' do
      paper = create(:paper)
      expect(paper).to be_valid
    end
  end

  describe 'non valido' do
    it 'utente non registrato' do
      paper = build(:paper)
      paper.user = nil
      expect(paper).not_to be_valid
    end

    it 'senza titolo' do
      paper = build(:paper)
      paper.title = nil
      expect(paper).not_to be_valid
    end

    it 'senza descrizione' do
      paper = build(:paper)
      paper.description = nil
      expect(paper).not_to be_valid
    end
  end
end
