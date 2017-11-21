ActiveAdmin.register Book do
  permit_params :genre, :author, :image, :title, :year, :publisher

  index do
    selectable_column
    id_column
    column :genre
    column :author
    column :title
    column :image
    column :year
    column :publisher
    actions
  end

  filter :genre
  filter :author
  filter :title
  filter :image
  filter :year
  filter :publisher

  form do |f|
    f.inputs do
      f.input :genre
      f.input :author
      f.input :title
      f.input :image
      f.input :year
      f.input :publisher
    end
    f.actions
  end
end
