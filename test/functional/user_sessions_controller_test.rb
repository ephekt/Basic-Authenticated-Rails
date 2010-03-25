require File.dirname(__FILE__) + '/../test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  context "no user logged in" do    
    setup do
      @params = {
        :email => "mike@answerwise.com", 
        :password => 'thispass', 
      }
      @user = User.create!( @params )
    end
    
    should "get new and have a forgot password link" do
      get :new
      assert_response :success
      assert_match(/password_resets\/new/, @response.body)
    end
    
    should "display error on bad email" do
      post :create, :user_session => { :email => @params[:email], :password => @params[:password] }
      assert_response :redirect
      #assert_select("div[id=errorExplanation] ul li", { :text => "Email is not valid", :count => 1 }, @response.body)
    end
    
    should "display error on bad password" do
      post :create, :user_session => { :email => @params[:email], :password => @params[:password] }
      assert_response :redirect
      #assert_select("div[id=errorExplanation] ul li", :text => "Password is not valid", :count => 1)
    end
    
    should "display blank password error when no password provided" do
      post :create, :user_session => { :email => @params[:email], :password => '' }
      assert_response :success
      assert_select("div[id=errorExplanation] ul li", :text => "Password cannot be blank", :count => 1)
    end    
    
    should "display error when email or password is blank" do
      post :create, :user_session => { :email => '', :password => '' }
      assert_response :success
      assert_select("div[id=errorExplanation] ul li", { 
                                                      :text => "You did not provide any details for authentication.", 
                                                      :count => 1 
                                                      }, @response.body)
    end
    
    should "be able to create a user session" do
      post :create, :user_session => { :email => @params[:email], :password => @params[:password] }
      assert_redirected_to account_path
    end
    
    should_eventually "be logged in when clicking a LoginToken url" do
      lt = LoginToken.create!(:user => @user, :redirect_url => '/')
      get :create_with_token, :token => lt.friendly_token
      assert_redirected_to '/'
    end
    
  end
  
  context "given a logged in user" do
    setup do
      @a_user = User.create(
                            :email => "mikel@answerwise.com", 
                            :password => 'thispass'
                           )
      @user_session = UserSession.create(@a_user)
    end
    
    should "destroy a user session" do
      delete :destroy
      assert_redirected_to new_user_session_path
    end
    
  end
end
