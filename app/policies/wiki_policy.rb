class WikiPolicy < ApplicationPolicy
  class Scope < Scope

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(private: false && record.user == user)
      end
    end
  end

  def destroy?
    user.admin? || record.user == user
  end
end
