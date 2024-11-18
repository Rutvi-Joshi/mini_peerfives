class RewardHistory < ApplicationRecord
  belongs_to :user, foreign_key: 'given_by'
  belongs_to :given_to, class_name: 'User', foreign_key: 'given_to'
end
