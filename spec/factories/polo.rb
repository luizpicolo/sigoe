# frozen_string_literal: true

FactoryBot.define do
  factory :polo do
    name { 'Nova Andradina' }
    institution factory: :institution
  end
end
