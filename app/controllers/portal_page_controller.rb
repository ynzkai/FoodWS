class PortalPageController < ApplicationController
  def home
    @shops = Shop.where.not(state: 0).limit(4)
    @foods = Food.where.not(state: 0).limit(4)
    @food_posts = Topic.find_by(name: '美食分享').posts.limit(5)
    @ws_posts = Topic.find_by(name: '文山新鲜事').posts.limit(5)
    @qa_posts = Topic.find_by(name: '本地问答').posts.limit(5)
  end
end
