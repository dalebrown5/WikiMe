class Wiki < ActiveRecord::Base
  belongs_to :user

  # scope :visible_to, -> (user){ user ? user.admin? ? all : user.premium? ? : where(private: false)}
  # scope :private_wikis, -> { where(private: true) }
  # scope :public_wikis, -> { where(private: false) }
  # scope :user_wikis, -> (user) { user ? where(user_id: user.id) : []}

end
