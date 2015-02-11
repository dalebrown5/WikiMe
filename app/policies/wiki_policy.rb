class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  class Scope < Scope
    def resolve
      if user.admin? || user.premium?
        scope.all 
      else
        scope.public_wikis
      end
    end
  end

end