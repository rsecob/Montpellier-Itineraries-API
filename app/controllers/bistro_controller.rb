class BistroController < ApplicationController

  def add
    int1 = params[:int1].to_i
    int2 = params[:int2].to_i

    if int1 && int2
      result = int1 + int2
      render :json => result, :status => :ok
    else
      error = {"error" => "invalid arguments"}.to_json
      render :status => :bad_request, :json => error
    end

  end

  def div
    int1 = params[:int1].to_i
    int2 = params[:int2].to_i

    if int1 && int2 && int2 != 0
      result = int1 / int2
      render :json => result, :status => :ok
    else
      error = {"error" => "invalid arguments"}.to_json
      render :status => :bad_request, :json => error
    end
  end


  def mult
    int1 = params[:int1].to_i
    int2 = params[:int2].to_i

    if int1 && int2
      result = int1 * int2
      render :json => result, :status => :ok
    else
      error = {"error" => "invalid arguments"}.to_json
      render :status => :bad_request, :json => error
    end
  end

  def sub
    int1 = params[:int1].to_i
    int2 = params[:int2].to_i

    if int1 && int2
      result = int1 - int2
      render :json => result, :status => :ok
    else
      error = {"error" => "invalid arguments"}.to_json
      render :status => :bad_request, :json => error
    end
  end

end
