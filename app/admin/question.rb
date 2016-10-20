ActiveAdmin.register Question do
  show do
    attributes_table do
      row(:question) { |question| question.text }
      row :status

      table_for question.answers do
        column(:answers) do |a|
          a.is_right ? status_tag(a.text, :ok) : a.text
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :text
      f.input :status
      f.has_many :answers do |a|
        a.input :text
        a.input :is_right
      end
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end

    def scoped_collection
      super.includes :answers
    end
  end
end
