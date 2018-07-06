require "rails_helper"

RSpec.describe Issue, type: :model do
  describe "Issue non valido" do
    it "dovrebbe non essere valido" do
      issue = Issue.new(description: "This is a nice description!")
      expect(issue).not_to be_valid
    end
  end
end
