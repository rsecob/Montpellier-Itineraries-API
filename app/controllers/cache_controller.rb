class CacheController < ApplicationController

  def get
    key = params[:key]
    cache = Cache.where(key: key).first
    timestamp = Time.now.to_i

    if cache && cache.expiration.to_i < timestamp
        render :json => cache.value, :status => :ok
    else
      if cache
        cache.delete
      end
      render :json => { "error" => "key does not exist"}, :status => :bad_request
    end
  end

  def set
    key = params[:key]
    value = params[:value]
    expiration = params[:expiration]
    cache = Cache.where(key: key).first ||= Cache.new
    cache.key = key
    cache.value = value
    cache.expiration = expiration

    if cache.save
      render :nothing => true, :status => :ok
    else
      render :json => { "error" => "Cannot save in database" }, :status => :bad_request
    end

  end

end
