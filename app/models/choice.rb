class Choice < ActiveRecord::Base

  def self.wikis
    Wiki.where( id: pluck(:wiki_id) )
  end

  def self.collaborators
    Collaborator.where( id: pluck(:collaborator_id) )
  end

  def collaborator
    Collaborator.find(collaborator_id)
  end

  def wiki
    Wiki.find(wiki_id)
  end

end