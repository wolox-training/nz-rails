ActiveAdmin.register Rent do
  permit_params :user_id, :book_id, :to, :from

  index do
    selectable_column
    id_column
    column :user
    column :book_id
    column :from
    column :to
    actions
  end

  filter :user
  filter :book
  filter :from
  filter :to

  form do |f|
    f.inputs do
      f.input :user
      f.input :book
      f.input :from, as: :datepicker,
                     datepicker_options: {
                       min_date: '2013-10-8',
                       max_date: '+3D'
                     }

      f.input :to, as: :datepicker,
                   datepicker_options: {
                     min_date: '2013-10-8'
                   }
    end
    f.actions
  end
end
