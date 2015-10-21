require 'test_helper'
class RecipeTest<ActiveSupport::TestCase
   
    def setup
        @chef = Chef.create(name:"bowb", email:"adsd@ddsfmail.com")
        @recipe = @chef.recipes.build(name: "MyRecipe", summary: "recipe summary", description: "recipe description")
        @recipe.save
        
    end
    
     test "recipe should be valid" do
        assert_not @recipe.valid?
    end
    
    test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
    end
  
    test "name should be present" do
        @recipe.name=" "
        assert_not @recipe.valid?
    end
  
    test "name length should not be long" do
        @recipe.name = "a" * 101
        assert_not @recipe.valid?
    end
  
    test "name length should not be short" do
        @recipe.name = "aaaa"
        assert_not @recipe.valid?
    end

    test "Summary should be present" do
        @recipe.summary=" "
        assert_not @recipe.valid?
    end
 
    test "Summary should not be too long" do
        @recipe.summary="a"*101
        assert_not @recipe.valid?
    end
 
     test "Summary should not be too short" do
        @recipe.summary="aaaa"
        assert_not @recipe.valid?
    end
  
    test "Description should be present" do
        @recipe.description=" "
        assert_not @recipe.valid?
    end
   
    test "Description should not be too long" do
        @recipe.description="a"*101
        assert_not @recipe.valid?
    end
   
     test "Description should not be too short" do
        @recipe.description="aaaa"
        assert_not @recipe.valid?
    end
end

    
