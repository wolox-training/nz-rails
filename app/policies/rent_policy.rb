class RentPolicy
  attr_reader :rent, :scope

  def initialize(current_user, model)
    @current_user = current_user
    @rent = model
  end

  def index?
    simple_authorziation
  end

  def create?
    simple_authorziation
  end

  private
    def simple_authorziation
      byebug
      @current_user == @rent.first.user
    end
end
