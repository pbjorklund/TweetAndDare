module DareSteps

  step "I am on the homepage" do
    visit '/'
  end
  
  step "I fill in :field with :value" do |field,value|
 
 	fill_in field, with: value
    
  end

end