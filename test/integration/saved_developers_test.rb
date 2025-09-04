require "test_helper"

class SavedDevelopersTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  # 
  test "creates a new saved developer and redirects to the developer page if referer is set" do
    login_as users(:subscribed_business)
    developer = developers(:prospect)
    referer = developer_path(developer)
    assert_difference 'SavedDeveloper.count', 1 do
      post developer_saved_developers_path(developer), headers: { "HTTP_REFERER" => referer }
    end
    assert_redirected_to referer
  end

  test "creates a new saved developer and redirects to developers index if referer is not set" do
    login_as users(:subscribed_business)
    developer = developers(:prospect)
    assert_difference 'SavedDeveloper.count', 1 do
      post developer_saved_developers_path(developer)
    end
    assert_redirected_to developers_path
  end

  test "deletes a saved developer and redirects to the developer page if referer is set" do
    # saved developer provided by fixtures
    login_as users(:prospect_developer)
    developer = developers(:one)
    referer = developer_path(developer)

    assert_difference 'SavedDeveloper.count', -1 do
      delete developer_saved_developers_path(developer), headers: { "HTTP_REFERER" => referer }
    end
    assert_redirected_to referer
  end

  test "deletes a saved developer and redirects to developers index if referer is not set" do
    # saved developer provided by fixtures
    login_as users(:prospect_developer)
    developer = developers(:one)

    assert_difference 'SavedDeveloper.count', -1 do
      delete developer_saved_developers_path(developer)
    end
    assert_redirected_to developers_path
  end
end
