require 'spec_helper'

describe User do
  let(:valid_attributes) {
    {
        first_name: "Derek",
        last_name: "Liang",
        email: "derekliang@gmail.com"
    }

  }
  context "validations" do
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires unique email (case sensitive)" do
      user.email = "DEREKLIANG@GMAIL.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

  end

  context "#downcase_email" do
    it "makes the email attribute lowercase" do
      user = User.new(valid_attributes.merge(email: "DEREKLIANG@GMAIL.COM"))
      # user.downcase_email
      # expect(user.email).to eq("derekliang@gmail.com")
      expect { user.downcase_email }.to change { user.email }.
        from("DEREKLIANG@GMAIL.COM").
        to("derekliang@gmail.com")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "DEREKLIANG@GMAIL.COM"
      expect(user.save).to be_true
      expect(user.email).to eq("derekliang@gmail.com")
    end
  end

end
