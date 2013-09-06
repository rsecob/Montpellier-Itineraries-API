class UtilsController < ApplicationController

  def date
  begin
    time = Time.new
    day = time.day.to_s
    month = time.month.to_s
    year = time.year.to_s

    day = (day.length == 1) ? "0#{day}" : day
    month = (month.length == 1) ? "0#{month}" : month

    render :json => { "day" => day, "month" => month, "year" => year }, :status => :ok
  rescue
    render :json => { "error" => "bad argument" }, :status => :bad_request
  end

  end

end
