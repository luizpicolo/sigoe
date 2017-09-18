RSpec.shared_examples "permission_controller" do
  {'index' => 'read', 'new' => 'create', 'edit' => 'update'}.each do |k, v|
    describe "GET ##{k}" do
      it "returns http success if have #{v} access permission" do
        add_permission @entity, @user, "#{v}": true
        sign_in @user
        get k, params: { id: @model.id }
        expect(response).to have_http_status(:success)
      end

      it "not returns http success if not have #{v} access permission" do
        add_permission @entity, @user, "#{v}": false
        sign_in @user
        get k, params: { id: @model.id }
        expect(response).not_to have_http_status(:success)
      end
    end
  end

  describe "POST #create" do
    it "returns http success if have create access permission" do
      add_permission @entity, @user, create: true
      sign_in @user
      post :create, params: { "#{@entity.downcase}": @attr }
      expect(response).to redirect_to(@path)
    end

    it "not returns http success if not have create access permission" do
      add_permission @entity, @user, create: false
      sign_in @user
      post :create, params: { "#{@entity.downcase}": @attr }
      expect(response).not_to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "returns http success if have update access permission" do
      add_permission @entity, @user, update: true
      sign_in @user
      put :update, params: { id: @model.id, "#{@entity.downcase}": @attr }
      expect(response).to redirect_to(@path)
    end

    it "not returns http success if not have update access permission" do
      add_permission @entity, @user, update: false
      sign_in @user
      put :update, params: { id: @model.id, "#{@entity.downcase}": @attr }
      expect(response).not_to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "returns http success if have destroy access permission" do
      add_permission @entity, @user, destroy: true
      sign_in @user
      delete :destroy, params: { id: @model.id }
      expect(response).to redirect_to(@path)
    end

    it "not returns http success if not have destroy access permission" do
      add_permission @entity, @user, destroy: false
      sign_in @user
      delete :destroy, params: { id: @model.id }
      expect(response).not_to redirect_to(@path)
    end
  end
end
