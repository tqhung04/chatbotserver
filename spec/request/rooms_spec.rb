require "rails_helper"

RSpec.describe "/rooms", type: :request do
  let(:login_info) do
    {
      name: "hung",
      email: "hung@example.com",
      password: "ww--123456"
    }
  end

  before do
    User.destroy_all
    @user = User.register(login_info[:name],
      login_info[:email],
      login_info[:password]
    ).data

    User.login(login_info[:email], login_info[:password]).data
  end
end
