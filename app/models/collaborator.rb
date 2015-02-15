class Collaborator < ActiveRecord::Base

  belongs_to :wiki
  belongs_to :user

  def choices
    Choice.where(collaborator_id: id)
  end

  def wikis
    Wiki.where(id: choices.pluck(:wiki_id) )
  end

end
