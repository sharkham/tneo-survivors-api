class NovelSerializer

  def initialize(novel_object)
    @novel = novel_object
  end

  def to_serialized_json
    options = {
      include: {
        badges: {
          only: [:id, :name, :description, :emoji, :novel_id]
        }
      },
      except: [:created_at, :updated_at]
    }
    @novel.to_json(options)
  end
end
