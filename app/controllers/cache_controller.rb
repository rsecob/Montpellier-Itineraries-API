class CacheController < ApplicationController

  def get
    key = params[:key]
    object = Rails.cache.read(key)
    if object
      value = object[:value]
      expiration = object[:expiration]
      if !expiration || expiration.to_i > Time.now.to_i
        render :json => value, :status => :ok
      else
        render :json => { "error" => "key expired"}, :status => :bad_request
      end
    else
      render :json => { "error" => "key does not exist"}, :status => :bad_request
    end
  end

  def set
    key = params[:key]
    value = params[:value]
    expiration = params[:expiration]

    if !expiration || is_numeric_string(expiration)
      Rails.cache.write(key, {value: value, expiration: expiration})

      render :nothing => true, :status => :ok
    else
      render :json => { "error" => "wrong expiration format"}, :status => :bad_request
    end

  end

  private

  def is_numeric_string(string)
    return true if string =~ /^\d+$/
    true if Float(string) rescue false
  end
end
