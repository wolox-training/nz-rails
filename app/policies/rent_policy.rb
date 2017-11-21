class RentPolicy
  attr_reader :rent, :scope

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    simple_authorziation
  end

  def create?
    simple_authorziation
  end

  private
    def simple_authorziation
      @current_user.admin? || @current_user == @user
    end
end
