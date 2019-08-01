class SignupController < ApplicationController

  def index
  end

  def registration
    @user = User.new

    @birthday_year_set = [["--",""],["2019", 2019],["2018", 2018],["2017", 2017],["2016", 2016],["2015", 2015],["2014", 2014],["2013", 2013],["2012", 2012],["2011", 2011],["2010", 2010],["2009", 2009],["2008", 2008],["2007", 2019],["2006", 2006],["2005", 2005],["2004", 2004],["2003", 2003],["2002", 2002],["2001", 2001],["2000", 2000],["1999", 1999],["1998", 1998],["1997", 1997],["1996", 1996],["1995", 1995],["1994", 1994],["1993", 1993],["1992", 1992],["1991", 1991],["1990", 1990],["1989", 1989],["1988", 1988],["1987", 1987],["1986", 1986],["1985", 1985],["1984", 1984],["1983", 1983],["1982", 1982],["1981", 1981],["1980", 1980]]
    @birthday_month_set = [["--",""],["1",1],["2",2],["3",3],["4",4],["5",5],["6",6],["7",7],["8",8],["9",9],["10",10],["11",11],["12",12]]
    @birthday_day_set = [["--",""],["1",1],["2",2],["3",3],["4",4],["5",5],["6",6],["7",7],["8",8],["9",9],["10",10],["11",11],["12",12],["13",13],["14",14],["15",15],["16",16],["17",17],["18",18],["19",19],["20",20],["21",21],["22",22],["23",23],["24",24],["25",25],["26",26],["27",27],["28",28],["29",29],["30",30],["31",31]]
  end

  def sms_confirmation
    @user = User.new(signup_user_params)
    @birthday_year_set = [["--",""],["2019", 2019],["2018", 2018],["2017", 2017],["2016", 2016],["2015", 2015],["2014", 2014],["2013", 2013],["2012", 2012],["2011", 2011],["2010", 2010],["2009", 2009],["2008", 2008],["2007", 2019],["2006", 2006],["2005", 2005],["2004", 2004],["2003", 2003],["2002", 2002],["2001", 2001],["2000", 2000],["1999", 1999],["1998", 1998],["1997", 1997],["1996", 1996],["1995", 1995],["1994", 1994],["1993", 1993],["1992", 1992],["1991", 1991],["1990", 1990],["1989", 1989],["1988", 1988],["1987", 1987],["1986", 1986],["1985", 1985],["1984", 1984],["1983", 1983],["1982", 1982],["1981", 1981],["1980", 1980]]
    @birthday_month_set = [["--",""],["1",1],["2",2],["3",3],["4",4],["5",5],["6",6],["7",7],["8",8],["9",9],["10",10],["11",11],["12",12]]
    @birthday_day_set = [["--",""],["1",1],["2",2],["3",3],["4",4],["5",5],["6",6],["7",7],["8",8],["9",9],["10",10],["11",11],["12",12],["13",13],["14",14],["15",15],["16",16],["17",17],["18",18],["19",19],["20",20],["21",21],["22",22],["23",23],["24",24],["25",25],["26",26],["27",27],["28",28],["29",29],["30",30],["31",31]]

    if @user.valid?
      session[:nickname] = signup_user_params[:nickname]
      session[:email] = signup_user_params[:email]
      session[:password] = signup_user_params[:password]
      session[:password_confirmation] = signup_user_params[:password_confirmation]
      session[:family_name] = signup_user_params[:family_name]
      session[:farst_name] = signup_user_params[:farst_name]
      session[:family_name_ruby] = signup_user_params[:family_name_ruby]
      session[:farst_name_ruby] = signup_user_params[:farst_name_ruby]
      session[:birthday_yiar] = signup_user_params[:birthday_yiar]
      session[:birthday_month] = signup_user_params[:birthday_month]
      session[:birthday_day] = signup_user_params[:birthday_day]
    else
      render action: :registration
    end
  end

  def address
    @address = Address.new

  end

  def how_pay
    @address = Address.new(signup_address_params)
    unless @address.valid?
      session[:postal_code] = signup_address_params[:postal_code]
      session[:region] = signup_address_params[:region]
      session[:city] = signup_address_params[:city]
      session[:address_number] = signup_address_params[:address_number]
      session[:building_name] = signup_address_params[:building_name]
      session[:phone_number] = signup_address_params[:phone_number]
    else
      render action: :address
    end
  end

  def create 
    user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      farst_name: session[:farst_name],
      family_name_ruby: session[:family_name_ruby],
      farst_name_ruby: session[:farst_name_ruby],
      birthday_yiar: session[:birthday_yiar],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day]
    )
    address = user.addresses.new(
      user_id: user.id,
      postal_code: session[:postal_code],
      region: session[:region],
      city: session[:city],
      address_number: session[:address_number],
      building_name: session[:building_name],
      phone_number: session[:phone_number]
    )
    if address.save
      # session[:id] = user.id
      redirect_to clear_compleate_signup_index_path
    else
      redirect_to "/signup"
    end
  end

  def clear_compleate
  end

  def login
  end

  private

  def signup_user_params
    params.require(:user).permit(:nickname, :family_name, :farst_name, :family_name_ruby, :farst_name_ruby, :birthday_yiar, :birthday_month, :birthday_day, :image, :profile, :email,:password, :password_confirmation, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at)
  end

  def signup_address_params
    params.require(:address).permit(:postal_code, :region, :city, :address_number, :building_name, :phone_number)
  end

end
