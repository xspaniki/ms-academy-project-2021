class UsersPresenter
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def organizations
    @organizations ||= Organization.all
  end
end
