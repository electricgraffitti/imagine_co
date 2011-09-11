module ApplicationHelper
  
  def current_user_account_name
    return current_teacher.account.name if current_teacher
    return current_student.account.name if current_student
  end
  
  def link_to_add_answers(name, f, assoc)
    new_obj = f.object.class.reflect_on_association(assoc).klass.new
    fields = f.fields_for(assoc, new_obj, :child_index => "new_#{assoc}") do |a|
      render(assoc.to_s.singularize + "_fields", :f => a)
    end
    link_to name, "#", :class => "remove_link", :fields => fields, :assoc => assoc
  end
  
end
