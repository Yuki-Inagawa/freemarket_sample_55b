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
  @user = User.new(signup_params)
  binding.pry
  end

  def address
  end

  def how_pay
  end

  def create 
  end

  def clear_compleate
  end

  def login
  end

  private

  def signup_params
    params.require(:user).permit(:nickname, :family_name, :farst_name, :family_name_ruby, :farst_name_ruby, :birthday_yiar, :birthday_month, :birthday_day, :image, :profile, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at)
  end

end
