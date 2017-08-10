Then /^"(.*?)" should be author of (\d+) article$/ do |arg1, arg2|
  assert Article.find_all_by_author(arg1).count == arg2.to_i
end

Given /^articles "([^"]*)" and "([^"]*?)" were merged/ do |article_1, article_2|
    article = Article.find_by_title(article_1)
    article.merge_with(Article.find_by_title(article_2).id)
end
