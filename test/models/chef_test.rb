require 'test_helper'
class ChefTest<ActiveSupport::TestCase
   
    def setup
        @chef = Chef.new(name: "MyChef", email:"MyChef@MyChef.com")
    end
    test "validates chef" do
        assert @chef.valid?
    end
    
    test "name should be present" do
        @chef.name=" "
        assert_not @chef.valid?
    end
    test "name length should not be long" do
        @chef.name = "a" * 101
        assert_not @chef.valid?
    end
    test "name length should not be short" do
        @chef.name = "aaaa"
        assert_not @chef.valid?
    end
    test "email should be present" do
        @chef.email=" "
        assert_not @chef.valid?
    end
    test "email should be valid bounds" do
        @chef.email = "a" * 101+"@example.com"
        assert_not @chef.valid?
    end
   
    test "emails should be valid" do
       valid_add = %w[user@eee.com R_T-SD@eee.h.org user@example.com first.last@eeem.au Laura+Joe@monk.com]
       valid_add.each do |va|
           @chef.email=va 
           assert @chef.valid?, '#{va.inspect} should be valid'
    end
end
     test "emails should be unique" do
       dup_chef= @chef.dup
       dup_chef.email = @chef.email.upcase
       @chef.save
       assert_not dup_chef.valid?
    end

     test "emails should not be invalid" do
       invalid_add = %w[user@eee,com R_T-SD_at_eee.h.org user@example. first.last@ee_e_m.com Laura+Joe@foo+monk.com]
       invalid_add.each do |ia|
           @chef.email= ia 
           assert_not @chef.valid?, '#{ia.inspect} should not be valid'
       end
   end
   end
    