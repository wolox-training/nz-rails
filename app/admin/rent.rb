ActiveAdmin.register Rent do
  permit_params :user, :book, :to, :from

  index do
    selectable_column
    id_column
    column :user
    column :book
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
      f.input :user_id
      f.input :book_id
      f.input :from, as: :datepicker,
                      datepicker_options: {
                        min_date: "2013-10-8",
                        max_date: "+3D"
                      }

      f.input :to, as: :datepicker,
                    datepicker_options: {
                      min_date: "2013-10-8"
                    }
    end
    f.actions
  end

end
