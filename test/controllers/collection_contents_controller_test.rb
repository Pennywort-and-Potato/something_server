require "test_helper"

class CollectionContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collection_content = collection_contents(:one)
  end

  test "should get index" do
    get collection_contents_url, as: :json
    assert_response :success
  end

  test "should create collection_content" do
    assert_difference("CollectionContent.count") do
      post collection_contents_url, params: { collection_content: { collection_id: @collection_content.collection_id, post_id: @collection_content.post_id } }, as: :json
    end

    assert_response :created
  end

  test "should show collection_content" do
    get collection_content_url(@collection_content), as: :json
    assert_response :success
  end

  test "should update collection_content" do
    patch collection_content_url(@collection_content), params: { collection_content: { collection_id: @collection_content.collection_id, post_id: @collection_content.post_id } }, as: :json
    assert_response :success
  end

  test "should destroy collection_content" do
    assert_difference("CollectionContent.count", -1) do
      delete collection_content_url(@collection_content), as: :json
    end

    assert_response :no_content
  end
end
