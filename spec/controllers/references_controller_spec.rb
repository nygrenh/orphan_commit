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
