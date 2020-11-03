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
    session[:book_date] = user_params[:book_date]
    @user = User.new
    
    # 変更
    # @user = User.new(user_params)
    # render :step1 if @user.invalid?
  end
  
  def confirm
    session[:name_first_kanji]  = user_params[:name_first_kanji]
    session[:name_last_kanji]   = user_params[:name_last_kanji]
    session[:name_first_kana]   = user_params[:name_first_kana]
    session[:name_last_kana]    = user_params[:name_last_kana]
    session[:birthday]          = user_params[:birthday]
    session[:phonenumber]       = user_params[:phonenumber]
    session[:mailaddress]       = user_params[:mailaddress]
    @user   = User.new
    @users  = User.all
    binding.pry
    
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
      book_date:        session[:book_date],
      name_first_kanji: session[:name_first_kanji],
      name_last_kanji:  session[:name_last_kanji],
      name_first_kana:  session[:name_first_kana],
      name_last_kana:   session[:name_last_kana],
      birthday:         session[:birthday],
      phonenumber:      session[:phonenumber],
      mailaddress:      session[:mailaddress]
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
      :book_date, 
      :name_first_kanji, 
      :name_last_kanji, 
      :name_first_kana, 
      :name_last_kana, 
      :birthday, 
      :phonenumber, 
      :mailaddress
    )
  end
  
end
