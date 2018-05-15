require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    {
      name:     Faker::LordOfTheRings.character,
      email:    Faker::Internet.free_email(Faker::LordOfTheRings.character)
    }
  }

  let(:invalid_attributes) {
    {
      name:     3,
      email:    Faker::Hobbit.quote
    }
  }

  let(:valid_session) { {} }

  let(:valid_user) {
    FactoryBot.create :user
  }

  describe "GET #index" do
    before do
      get :index, params: {}, session: valid_session
    end

    it "should return a success response." do
      expect(response).to be_success
    end

    it "should render the correct view." do
      assert_template 'users/index'
    end

    it "should get all users." do
      user1 = FactoryBot.create(:user, email: Faker::Internet.free_email)
      user2 = FactoryBot.create(:user, email: Faker::Internet.free_email)

      assert_equal User.all, assigns(:users)
      expect(User.all.count).to eq(2)
    end
  end

  describe "GET #show" do
    before do
      get :show, params: { id: valid_user.to_param }, session: valid_session
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "should render the correct view." do
      assert_template 'users/show'
    end

    it "should get the correct user." do
      assert_equal User.find(valid_user.id), assigns(:user)
    end
  end

  describe "GET #new" do
    before do
      get :new, params: {}, session: valid_session
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "should render the correct view." do
      assert_template 'users/new'
    end

    it "assigns a blank user to the view" do
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    before do
      get :edit, params: { id: valid_user.to_param }, session: valid_session
    end

    it "returns a success response" do
      expect(response).to be_success
    end

    it "should render the correct view." do
      assert_template 'users/edit'
    end

    it "should get the correct user." do
      assert_equal User.find(valid_user.id), assigns(:user)
    end
  end

  describe "POST #create" do
    context "with valid params" do

      it "should create a new User" do
        expect {
          post :create, params: { user: valid_attributes }, session: valid_session
        }.to change(User, :count).by(1)
      end

      it "should redirect to the created user" do
        another_user = FactoryBot.create :user

        post :create, params: { user: valid_attributes }, session: valid_session

        expect(response).to redirect_to(User.last)
      end

      it "should display success message" do
        post :create, params: { user: valid_attributes }, session: valid_session

        should set_flash
      end
    end

    context "with invalid params" do
      it "should render the new user view" do
        post :create, params: { user: invalid_attributes }, session: valid_session

        assert_template 'users/new'
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name:     Faker::Hobbit.character,
          email:    Faker::Internet.free_email(Faker::Hobbit.character)
        }
      }

      it "updates the requested user" do
        user = FactoryBot.create :user

        put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session

        user.reload

        expect(user.name).to eq(new_attributes[:name])
        expect(user.email).to eq(new_attributes[:email])
      end

      it "redirects to the user" do
        put :update, params: {id: valid_user.to_param, user: valid_attributes}, session: valid_session

        expect(response).to redirect_to(valid_user)
      end

      it "should display success message" do
        put :update, params: {id: valid_user.to_param, user: valid_attributes}, session: valid_session

        should set_flash
      end
    end

    context "with invalid params" do
      it "should render the edit user view" do
        put :update, params: {id: valid_user.to_param, user: invalid_attributes}, session: valid_session

        assert_template 'users/edit'
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = FactoryBot.create :user

      expect {
        delete :destroy, params: { id: user.to_param }, session: valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, params: { id: valid_user.to_param }, session: valid_session

      expect(response).to redirect_to(users_url)
    end

    it "should display success message" do
      delete :destroy, params: { id: valid_user.to_param }, session: valid_session

      should set_flash
    end
  end

  describe "test strong params" do
    it do
      params = { user: valid_attributes }

      should permit(:name, :email).for(:create, params: params).on(:user)
    end
  end
end
