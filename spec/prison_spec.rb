require File.join(File.dirname(__FILE__), 'spec_helper')

class Quog
  attr_reader :attributes
  def initialize(attributes={})
    @attributes = attributes
  end
end

describe Prison do
  
  before do
    Prison.registration_model = Quog
  end
  
  describe '#registration_model' do
    it "should constantize an assigned string on retrieval" do
      Prison.registration_model = 'Foo'
      class Foo; end
      Prison.registration_model.should == Foo
    end
    
    it "should work with assigning existing constants" do
      class Bar; end
      Prison.registration_model = Bar
      Prison.registration_model.should == Bar
    end
  end
  
  describe '#new_registration_model' do
    it "should return a new registration model" do
      Prison.new_registration_model.should be_an_instance_of(Quog)
    end
    
    it "should pass parameters" do
      Prison.new_registration_model(:foo => :bar).attributes.should == { :foo => :bar }
    end
  end
  
end