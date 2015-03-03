class Item < ActiveRecord::Base
    belongs_to :user
    belongs_to :list

    validates :body, length:{minimum: 5}, presence: true
    validates :user, presence: true
end
