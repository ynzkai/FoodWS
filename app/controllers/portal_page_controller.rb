class PortalPageController < ApplicationController
  def home
    @shops = Shop.where.not(state: 0).limit(4)
    @foods = Food.where.not(state: 0).limit(4)
    @food_posts = Topic.find_by(name: '美食分享').posts.limit(5)
    @chef_posts = Topic.find_by(name: '我是大厨').posts.limit(5)
    @manage_posts = Topic.find_by(name: '站务管理').posts.limit(5)
  end
end
