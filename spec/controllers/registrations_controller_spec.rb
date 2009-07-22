require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Prison::RegistrationsController do
  
  mock_models :user
  
  describe :get => :new do
    before { Prison.should_receive('new_registration_model').and_return(mock_user) }
    
    it { should respond_with(:success) }
    it { should assign_to(:registration, :with => mock_user) }
    it { should render_template('registrations/new') }
  end
  
  describe :post => :create do
    before { Prison.should_receive('new_registration_model').and_return(mock_user) }
    
    describe 'with valid params' do
      before { mock_user.should_receive(:save).and_return(true) }
      before { PrisonMailer.should_receive(:deliver_confirmation).with('test.host', mock_user) }
      
      it { should set_the_flash(:notice) }
      it { should redirect_to(new_session_url) }
    end
    
    describe 'with invalid params' do
      before { mock_user.should_receive(:save).and_return(false) }
      
      it { should respond_with(:success) }
      it { should assign_to(:registration, :with => mock_user) }
      it { should render_template('registrations/new') }
    end
  end
  
end