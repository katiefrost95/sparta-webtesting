require_relative 'pages/bbc_homepage'
require_relative 'pages/bbc_sign_in_page'
require_relative 'pages/bbc_sign_up_page'
require_relative 'pages/successful_register_with_bbc'
require_relative 'pages/error_register_with_bbc'

class BbcSite

  def bbc_homepage
    BbcHomepage.new
  end

  def bbc_sign_in_page
    BbcSignInPage.new
  end

  def bbc_sign_up_page
    BbcSignUpPage.new
  end

  def register_with_bbc
    RegisterWithBbc.new
  end

  def error_register_with_bbc
    ErrorRegisterWithBbc.new
  end
end
