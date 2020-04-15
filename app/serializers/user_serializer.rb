class UserSerializer

  def initialize(user_object)
    @user = user_object
  end

  def to_serialized_json
    options = {
      only: [:id, :name, :username]
      include: {
        novels: {
          only: [:id, :title, :summary, :plan, :goal, :wordcount, :year, :user_id]
        }
      }
    }
    @user.to_json(options)
  end
end
