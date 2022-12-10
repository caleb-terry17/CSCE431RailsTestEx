require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    @author1 = Author.create!(
        name: "John Doe",
    )

    @author2 = Author.create!(
        name: "Jane Doe"
    )

    assign(:books, [
      Book.create!(
        title: "Title of my book 1",
        author_id: @author1.id
      ),
      Book.create!(
        title: "Title of my book 2",
        author_id: @author2.id
      )
    ])
  end

  it "renders a list of books" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title of my book 1".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Title of my book 2".to_s), count: 1
    assert_select cell_selector, text: Regexp.new(@author1.id.to_s), count: 1
    assert_select cell_selector, text: Regexp.new(@author2.id.to_s), count: 1
  end
end
