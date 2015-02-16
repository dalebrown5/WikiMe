class Wiki < ActiveRecord::Base

  belongs_to :user # the wiki creator

<<<<<<< HEAD
  has_many :collaborators
  has_many :users, through: :collaborators  # the wiki collaborators  -not the creator

  def choices
    Choice.where(wiki_id: id)
  end

  def collaborators
    Collaborator.where( id: choices.pluck(:collaborator_id) )
  end
  
=======
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

>>>>>>> collaborators
end
