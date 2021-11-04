require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:admin) { create(:user, :admin) }

  describe 'GET #index' do
    before { sign_in admin }

    it 'returns http success' do
      get :index
      expect(response.status).to eq(200) 
    end
  end
  
  describe 'GET #new' do
    before { sign_in admin }

    it 'returns http success' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #create' do
    before { sign_in admin }

    context 'invalid' do
      it 'returns http success' do
        post :create, params: { user: { first_name: '' } }
        expect(flash[:danger]).to eq 'User not saved...'
      end
    end

    # TODO - after fix devise create
    # context 'valid' do
    #   it 'returns http redirect' do
    #     post :create, params: { user: { first_name: '' } }
    #     expect(response.status).to eq(302)
    #     expect(flash[:success]).to eq 'User saved...'
    #   end
    # end
  end

  describe 'GET #edit' do
    before { sign_in admin }

    it 'returns http success' do
      get :edit, params: { id: admin.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #update' do
    before { sign_in admin }

    context 'invalid' do
      it 'returns http success' do
        patch :update, params: { id: admin.id, user: { first_name: '' } }
        expect(flash[:danger]).to eq 'User not updated...'
      end
    end

    context 'valid' do
      it 'returns http redirect' do
        post :update, params: { id: admin.id, user: { first_name: 'Maximilian', last_name: 'Mäsiar' } }
        user = User.last
        expect(response.status).to eq(302)
        expect(flash[:success]).to eq "User updated (#{user.first_name} #{user.last_name})..."
      end
    end
  end

  describe 'GET #show' do
    before { sign_in admin }

    it 'returns http success' do
      get :show, params: { id: admin.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE #destroy' do
    let!(:another_user) { create(:user) }

    before { sign_in admin }

    it 'returns http success' do
      delete :destroy, xhr: true, params: { id: another_user.id } 
      expect(response.status).to eq(200)
      expect(flash[:success]).to eq "User destroyed..."
      expect(User.exists?(another_user.id)).to be_falsey
    end
  end

  describe 'GET #wakeup' do
    before { sign_in admin }

    it 'returns http success' do
      expect { get :wakeup, params: { id: admin.id } }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
