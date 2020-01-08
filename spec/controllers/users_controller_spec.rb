require 'rails_helper'

# create
# new
# show
# update
# edit
# destroy
# index

RSpec.describe UsersController, type: :controller do

    describe "GET #index" do
        it "displays all the users created" do
            get :index
            expect(response).to render_template("index")
            expect(response).to have_http_status(200)
        end
    end

    describe "POST #create" do
        context "with valid params" do
            # let!(:user) { FactoryBot.create(:user) }
            it "redirect to user page" do
                # debugger
                post :create, params: {user: { email: "asd@asd.com", password: "hunter12" } }
                expect(response).to redirect_to(user_url(User.find_by(email: "asd@asd.com")))
            end
        end

        context "with invalid params" do
            it "render to new template" do
                post :create, params: { user: { email: "asv@asd.com" } }
                expect(response).to render_template(:new) 
            end
        end
    end

    describe "GET #show" do

    end

    describe "PUT #update" do

    end

    describe "DELETE #destroy" do

    end
end
