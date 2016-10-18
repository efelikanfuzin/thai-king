ActiveAdmin.register Question do
  show do
    attributes_table do
      row :text

      table_for question.answers do
        column(:answers) do |a|
          question.right_answer.id == a.id ? status_tag(a.text, :ok) : a.text
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :text
      f.has_many :answers do |a|
        a.input :text
      end
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
