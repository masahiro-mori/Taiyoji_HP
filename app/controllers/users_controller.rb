class UsersController < ApplicationController
  
  def index
    @user = User.new
  end


  # def new
  #   @user = User.new
  # end

  # def next
  #   @user = User.new(user_params)
  #   # render :new if @user.invalid?
  # end
  
  def step1
    @user = User.new
  end
    
  def step2
    session[:date] = user_params[:date]
    @user = User.new
    
    # 変更
    # @user = User.new(user_params)
    # render :step1 if @user.invalid?
  end
  
  def confirm
    session[:name_kanji] = user_params[:name_kanji]
    session[:name_kana] = user_params[:name_kana]
    session[:birth] = user_params[:birth]
    session[:phonenumber] = user_params[:phonenumber]
    session[:mailaddress] = user_params[:mailaddress]
    @user = User.new
    # binding.pry
    
    # 変更
    # @user = User.new(user_params)
    # render :new and return if params[:back]
    # render :next if @user.invalid?(:confirm)
    # render :step1 and return if params[:back]
    # render :step2 if @user.invalid?(:confirm)
  end
  
    
  # def create
  #   @user = User.new(user_params)
  #   @user.save
  #   render :next and return if params[:back]
  #   render :confirm and return if !@user.save
  #   redirect_to @user
  # end


  def create
    User.create(
      date: session[:date],
      name_kanji: session[:name_kanji],
      name_kana: session[:name_kana],
      birth: session[:birth],
      phonenumber: session[:phonenumber],
      mailaddress: session[:mailaddress]
    )
    
    # 変更
    # render :step2 and return if params[:back]
    # render :confirm and return if !@user.save
    # redirect_to @user
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(
    # params.permit(
      :date, 
      :name_kanji, 
      :name_kana, 
      :birth, 
      :phonenumber, 
      :mailaddress
    )
  end
  
end
