class Api::V1::SubsidiariesController < Api::V1::ApiController

  def list
    subsidiaries = Subsidiary.all
    render json: subsidiaries
  end
end