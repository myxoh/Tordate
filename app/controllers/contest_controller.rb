class ContestController < ApplicationController
  def index
  @config={title:"Tordate: The best article will win a prize!"}
  render params["contest"].to_s
  end
end
