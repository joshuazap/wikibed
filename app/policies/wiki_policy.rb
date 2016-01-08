class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :wiki

    def initialize(user, wiki)
      @user = user
      @wiki = wiki
    end

    def resolve
      scope
    end

    def destroy?
      user.admin? || wiki.user_id == user.id
    end
  end
end
