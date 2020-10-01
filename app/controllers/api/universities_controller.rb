class Api::UniversitiesController < ApiController
  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    university_list = File.open("app/javascript/data/test.json", mode = "r").readlines
    render json: university_list
  end

end