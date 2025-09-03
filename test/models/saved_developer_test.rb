require "test_helper"

class SavedDeveloperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "creates a new saved developer" do
    developer = developers(:one)
    assert developer.save
    user = User.new(email: "john.doe@example.com", password: "password")
    assert user.save
    saved_developer = SavedDeveloper.new(user: user, developer: developer)
    assert saved_developer.save
  end
  test "cannot create duplicate saved developers" do
    developer = developers(:one)
    user = users(:business)
    saved_developer = SavedDeveloper.new(user: user, developer: developer)
    assert saved_developer.save
    duplicate_saved_developer = SavedDeveloper.new(user: user, developer: developer)
    assert_not duplicate_saved_developer.save
  end

  test "cannot create a saved developer without a user" do
    developer = developers(:one)
    saved_developer = SavedDeveloper.new(developer: developer)
    assert_not saved_developer.save
  end

  test "a saved developer appears in a user's saved developers list" do
    developer = developers(:one)
    user = users(:business)
    saved_developer = SavedDeveloper.new(user: user, developer: developer)
    assert saved_developer.save
    assert_includes user.saved_developers, saved_developer
  end

  test "a developer appears in a user's saved developer profiles list (using fixtures)" do
    user = users(:prospect_developer)
    developer = developers(:one)
    assert_includes user.saved_developer_profiles, developer
  end
end
