class SettingController < ApplicationController
  def show
    @settings = Setting.first
  end
end
