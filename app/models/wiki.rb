class Wiki < ActiveRecord::Base

  belongs_to :user # the wiki creator

  has_many :collaborators
  has_many :users, through: :collaborators  # the wiki collaborators  -not the creator

  def choices
    Choice.where(wiki_id: id)
  end

  def collaborators
    Collaborator.where( id: choices.pluck(:collaborator_id) )
  end
  
end
