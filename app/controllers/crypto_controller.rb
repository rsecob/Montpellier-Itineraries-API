class CryptoController < ApplicationController

  require 'digest/md5'

  def md5
    begin
      str = params[:str].to_s;
      md5Value = Digest::MD5.hexdigest(str);

      render :json => md5Value, :status => :ok
      rescue
      render :json => {"error" => "invalid argument"}, :status => :bad_request
    end

  end


  def sha1
    begin
      str = params[:str].to_s;
      sha1Value = Digest::SHA1.hexdigest(str);

      render :json => sha1Value, :status => :ok
    rescue
      render :json => {"error" => "invalid argument"}, :status => :bad_request
    end

  end

end
