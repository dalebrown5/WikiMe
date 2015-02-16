class Wiki < ActiveRecord::Base

  belongs_to :user # the wiki creator

  has_many :collaborators 
  has_many :users, through: :collaborators  # the wiki collaborators  -not the creator

  # def collaborators
  #   Collaborator.where(wiki_id: id)
  # end

  # def users
  #   User.where( id: collaborators.pluck(:user_id) )
  # end

  def collaborator_for(user)
    collaborators.where(user_id: user.id).first
  end

end
