class Api::V1::StatusController < ApplicationController
  def index
    render json: { status: 'ok' }, status: 200
  end
end
