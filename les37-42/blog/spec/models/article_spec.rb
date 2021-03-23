require 'spec_helper'
require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
    end
    describe  do
      it { should have_many :comments }
    end

  describe "#subject" do
    it "returns the article title" do
      article = create(:article, title: 'Lorem Ipsum')
      expect(article.subject).to eq 'Lorem Ipsum'
    end
  end

  describe "#last_comment" do
    it "returns the last comment" do
      # создаём статью с 3 комментариями
      article = create(:article_with_comments)
      # проверка
      expect(article.last_comment.body).to eq "Comment body 3"
    end
  end

end

