class NovelSerializer

  def initialize(novel_object)
    @novel = novel_object
  end

  def to_serialized_json
    options = {
      include: {
        user: {
          only: :name
        },
        badges: {
          only: [:id, :name, :description, :emoji, :novel_id, :badgetype_id]
        }
      }
    }
    @novel.to_json(options)
  end
end
