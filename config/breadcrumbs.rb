crumb :root do
  link "メルカリ", root_path
end

# 以下マイページ関連のパン
# マイページのトップのパン
crumb :mypage_top do
  link "マイページ", "/users/#{current_user.id}"
  # parent: root
end

# マイページの２ページ目、顔でかいやつ
# まだ書けない

# プロフィールページ用のパン
crumb :profile do
  link "プロフィール", "/users/#{current_user.id}/profile"
  parent :mypage_top
end

# 出品した商品ページのぱん
crumb :exhibition_list do
  link "出品した商品、出品中", "/users/#{current_user.id}/listing/list"
  parent :mypage_top
end

# 本人情報の登録ページのパン
crumb :personal_information_registration do
  link "本人情報の登録", "/users/#{current_user.id}/identification"
  parent :mypage_top
end

# 支払い方法の追加のページのぱん
crumb :payment_information do
  link "支払い方法", "/users/#{current_user.id}/card" 
  parent :mypage_top
end

# クレジットカード情報入力
crumb :credit_card_data_input do
  link "クレジットカード情報入力", "/users/#{current_user.id}/card/create"
  parent :payment_information
end
# ログアウトページのぱん
crumb :user_logout do
  link "ログアウト", "/users/logout"
  parent :mypage_top
end

# 以下からアイテム関連のパン
# アイテム詳細ページのパン
crumb :item_show_page do
  item = Item.find_by(id: params[:id])
  link item.name, "/items/#{item.id}", data: {"turbolinks": false}
end








# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

# - breadcrumb :mypage

# = breadcrumbs pretext: "You are here:",separator: " &rsaquo; "
