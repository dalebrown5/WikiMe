class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  after_initialize :init

  has_many :collaborators
  has_many :wikis, through: :collaborators

  # def collaborators
  #   Collaborator.where(user_id: id)
  # end
  
  # def wikis
  #   Wiki.where( id: collaborators.pluck(:wiki_id) )
  # end

  def init
    self.role ||= 'standard'
  end

  def standard?
    role == 'standard'
  end 

  def premium?
    role == 'premium'
  end

  def admin?
    role == 'admin'
  end

   def upgradeable
    @upgradeable = user.role(standard)
  end

  
end
