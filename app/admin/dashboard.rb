ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
  end # content

  content :title => proc{ I18n.t("active_admin.dashboard") } do
        panel "Categories" do
            table_for Category.order("id asc").limit(15) do
                column :id
                column "Category Title", :name do |category|
                    link_to category.name, [:admin, category]
                end
                column :created_at
            end
        end
        strong (link_to "Show All Categories", :admin_categories)

        panel "Recent Posts" do
            table_for Post.order("id desc").limit(15) do
                column :id
                column "Post Title", :title do |post|
                    link_to post.title, [:admin, post]
                end
                column "Author", :admin_user
                column :category, :sortable => :category
                column :created_at
            end     
        end
        strong (link_to "Show All Posts", :admin_posts)
    end #content personal
end
