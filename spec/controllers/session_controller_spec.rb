require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Prison::SessionController do
  
  mock_models :user
  
  describe :get => :new do
    it { should respond_with(:success) }
    it { should render_template('session/new') }
  end
  
end