# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           default(""), not null
#  name                   :string
#  siape                  :integer
#  avatar                 :string
#  course_id              :bigint(8)
#  admin                  :boolean          default(FALSE)
#

require 'rails_helper'
require 'cancan/matchers'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.create :user
  end

  # Validations
  it { should validate_presence_of :email }
  it { should validate_presence_of :password  }
  it { should validate_presence_of :username  }

  # Columns
  it { should have_db_column :id }
  it { should have_db_column :email }
  it { should have_db_column :encrypted_password }
  it { should have_db_column :reset_password_token }
  it { should have_db_column :reset_password_sent_at }
  it { should have_db_column :remember_created_at }
  it { should have_db_column :sign_in_count }
  it { should have_db_column :current_sign_in_at }
  it { should have_db_column :last_sign_in_at }
  it { should have_db_column :current_sign_in_ip }
  it { should have_db_column :last_sign_in_ip }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }
  it { should have_db_column :username }
  it { should have_db_column :name }
  it { should have_db_column :siape }

  # Indexes
  it { should have_db_index ['email'] }
  it { should have_db_index ['reset_password_token'] }
  it { should have_db_index ['username'] }

  describe '#search' do
    it 'find user by name' do
      expect(User.search(@user.name)).to eq([@user])
    end

    it 'find user by email' do
      expect(User.search(@user.email)).to eq([@user])
    end
  end

  describe '.ordenation_attributes' do
    ordenation_attributes = User.ordenation_attributes

    it 'should return an array' do
      expect(ordenation_attributes).to be_an_instance_of(Array)

      ordenation_attributes.each do |attribute|
        expect(attribute).to be_an_instance_of(Array)
      end
    end

    ordenation_attributes.each do |attribute|
      it "should return user attribute #{attribute}" do
        expect(User.attribute_names.include?(attribute.last)).to be true
      end
    end
  end
end
