class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :wiki

    def initialize(user, wiki)
      @user = user
      @wiki = wiki
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:private => false)
      end
    end
  end

  def destroy?
    user.admin? || wiki.user_id == user.id
  end
end
