class Reports::FoodHandlerReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_hander_report, only: %i[ show edit update destroy ]

  def index
    report_type = params[:type]
    case report_type
    when "list"
      if params[:organization] == "true"
        @food_handler_cards = FoodHandlerCard.all
      elsif params[:searchData][:store_id].to_i > 0
        @food_handler_cards = FoodHandlerCard.where(store_id: params[:searchData][:store_id])
      elsif params[:searchData][:supervisor_id].to_i > 0
        @food_handler_cards = FoodHandlerCard.where(store_id: User.find(params[:searchData][:supervisor_id]).store_ids)
      elsif params[:searchData][:om_id].to_i > 0
        @food_handler_cards = FoodHandlerCard.where(store_id: User.find(params[:searchData][:om_id]).store_ids)
      else

      end
    when "expiration"
      if params[:organization] == "true"
        @food_handler_cards = FoodHandlerCard.where(expiration_date: Date.today..Date.today+60.days)
      elsif params[:searchData][:store_id].to_i > 0
        @food_handler_cards = FoodHandlerCard.where(expiration_date: Date.today..Date.today+60.days, store_id: params[:searchData][:store_id])
      elsif params[:searchData][:supervisor_id].to_i > 0
        @food_handler_cards = FoodHandlerCard.where(expiration_date: Date.today..Date.today+60.days, store_id: User.find(params[:searchData][:supervisor_id]).store_ids)
      elsif params[:searchData[:om_id]].to_i > 0
        @food_handler_cards = FoodHandlerCard.where(expiration_date: Date.today..Date.today+60.days, store_id: User.find(params[:searchData][:om_id]).store_ids)
      else

      end
    when "missing"
      if params[:organization] == "true"
        @users = run_list(true, "org")
      elsif params[:searchData][:store_id].to_i > 0
        @users = run_list(params[:searchData][:store_id], "store")
      elsif params[:searchData][:supervisor_id].to_i > 0
        @users = run_list(params[:searchData][:supervisor_id], "sup")
      elsif params[:searchData][:om_id].to_i > 0
        @users = run_list(params[:searchData][:om_id], "om")
      else

      end

    end
  end

  def new

  end

  private

  def run_list(value, level)
    list = []
    case level
    when "org"
      User.where(organization_id: current_user.organization.id, active: true).order(first_name: :asc).each do |user|
        if user.stores.any? && user.food_handler_card.nil?
          list.push(user)
        end
      end
    when "store"
      User.where(active: true).order(first_name: :asc).each do |user|
        if (user.store_ids.include? value.to_i) && (user.food_handler_card.nil?)
          list.push(user)
        end
      end
    when "sup"
      sup = User.find(value)
      User.where(active: true).order(first_name: :asc).each do |user|
        if (sup.store_ids.include? user.store_ids[0]) && (user.food_handler_card.nil?)
          list.push(user)
        end
      end
    when "om"
      om = User.find(value)
      User.where(active: true).order(first_name: :asc).each do |user|
        if (om.store_ids.include? user.stores[0].id) && (user.food_handler_card.nil?)
          list.push(user)
        end
      end
    end
    puts "THIS IS THE LIST SIZE #{value}  AND #{level}"
    list
  end
end
