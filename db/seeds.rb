# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all
shops = %w(火锅店 大排档 自助餐 小吃店 快餐店 中餐厅 西餐厅 甜品店 街头店 咖啡厅 酒吧 酒楼 茶楼 农家乐 山庄 水果店 食品店 杂货店 超市 其它)
shops.each do |shop|
  # kind 1 means shop category
  Category.create name: shop, kind: 1
end

Area.destroy_all
areas = %w(文山 砚山 丘北 广南 富宁 麻栗坡 马关 西畴)
areas.each do |area|
  Area.create name: area
end

Post.destroy_all
Topic.destroy_all
topics = %w(文山新鲜事 美食分享 我是大厨 本地问答 站务管理)
topics.each do |topic|
  Topic.create name: topic
end

admin = User.find_by(username: 'admin')
admin.destroy unless admin.nil?
User.create username: 'admin', email: 'admin@foodws.com', role: 5, password: 'zk11z35', password_confirmation: 'zk11z35'

