require_relative 'spec_helper'

describe User do

  let(:user) do
    User.create({ email: 'veryspecialemail@footle.com',
      password: 'Gublah'})
    end

  it 'has an email' do
    expect(user.email).to eq 'veryspecialemail@footle.com'
  end

  it 'has a unique identifier' do
    expect(user.id).to equal 1
  end

  it 'has a password' do
    expect(user.password_digest).to be_a_kind_of String
  end

end