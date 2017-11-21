class RentPolicy
  attr_reader :rent, :scope

  def initialize(current_user, model)
    @current_user = current_user
    @rent = model
  end

  def index?
    simple_authorization
  end

  def create?
    simple_authorization
  end

  private

  def simple_authorization
    @current_user == @rent.first.user
  end
end
