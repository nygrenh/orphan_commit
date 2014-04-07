require 'spec_helper'

describe ReferencesController do

  # This should return the minimal set of attributes required to create a valid
  # Reference. As you add validations to Reference, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) { { year: 2002 } }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ReferencesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all references as @references" do
      reference = Reference.create! valid_attributes
      get :index, {}, valid_session
      assigns(:references).should eq([reference])
    end
  end

  describe "GET show" do
    it "assigns the requested reference as @reference" do
      reference = Reference.create! valid_attributes
      get :show, {:id => reference.to_param}, valid_session
      assigns(:reference).should eq(reference)
    end
  end

  describe "GET new" do
    it "assigns a new reference as @reference" do
      get :new, {}, valid_session
      assigns(:reference).should be_a_new(Reference)
    end
  end

  describe "GET edit" do
    it "assigns the requested reference as @reference" do
      reference = Reference.create! valid_attributes
      get :edit, {:id => reference.to_param}, valid_session
      assigns(:reference).should eq(reference)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Reference" do

        pending

        expect {
          post :create, {:reference => valid_attributes}, valid_session
        }.to change(Reference, :count).by(1)
      end

      it "assigns a newly created reference as @reference" do

        pending

        post :create, {:reference => valid_attributes}, valid_session
        assigns(:reference).should be_a(Reference)
        assigns(:reference).should be_persisted
      end

      it "redirects to the created reference" do

        pending

        post :create, {:reference => valid_attributes}, valid_session
        response.should redirect_to(Reference.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reference as @reference" do

        pending

        # Trigger the behavior that occurs when invalid params are submitted
        Reference.any_instance.stub(:save).and_return(false)
        post :create, {:reference => {  }}, valid_session
        assigns(:reference).should be_a_new(Reference)
      end

      it "re-renders the 'new' template" do

        pending

        # Trigger the behavior that occurs when invalid params are submitted
        Reference.any_instance.stub(:save).and_return(false)
        post :create, {:reference => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested reference" do

        pending

        reference = Reference.create! valid_attributes
        # Assuming there are no other references in the database, this
        # specifies that the Reference created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Reference.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => reference.to_param, :reference => { "these" => "params" }}, valid_session
      end

      it "assigns the requested reference as @reference" do
        reference = Reference.create! valid_attributes
        put :update, {:id => reference.to_param, :reference => valid_attributes}, valid_session
        assigns(:reference).should eq(reference)
      end

      it "redirects to the reference" do
        reference = Reference.create! valid_attributes
        put :update, {:id => reference.to_param, :reference => valid_attributes}, valid_session
        response.should redirect_to(reference)
      end
    end

    describe "with invalid params" do
      it "assigns the reference as @reference" do
        reference = Reference.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reference.any_instance.stub(:save).and_return(false)
        put :update, {:id => reference.to_param, :reference => {  }}, valid_session
        assigns(:reference).should eq(reference)
      end

      it "re-renders the 'edit' template" do
        reference = Reference.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reference.any_instance.stub(:save).and_return(false)
        put :update, {:id => reference.to_param, :reference => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reference" do
      reference = Reference.create! valid_attributes
      expect {
        delete :destroy, {:id => reference.to_param}, valid_session
      }.to change(Reference, :count).by(-1)
    end

    it "redirects to the references list" do
      reference = Reference.create! valid_attributes
      delete :destroy, {:id => reference.to_param}, valid_session
      response.should redirect_to(references_url)
    end
  end

end
