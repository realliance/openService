# Macros to make rspec with devise easier
module DeviseMacros
  def login_member
    let(:user) do
      FactoryBot.create(:user, rank: 1)
    end

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end
  end

  def login_admin
    let(:user) do
      FactoryBot.create(:user, rank: 2)
    end

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in user
    end
  end
end
