class ContestController < ApplicationController
  def index
  @config={title:"Tordate: Win up to 200 U$D by writing the best Article of the Month!"}
  render params["contest"].to_s
  end
end
