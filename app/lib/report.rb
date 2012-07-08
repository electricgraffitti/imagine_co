require 'csv'

class Report

  def self.run
    # schools = %W(
    #   gilavista.kosjourney.com 
    #   hollenbeck.kosjourney.com 
    #   telesis.kosjourney.com 
    #   thurgoodmarshall.kosjourney.com 
    #   flvs.kosjourney.com 
    #   questapilot.kosjourney.com 
    #   kirtland.kosjourney.com 
    #   tsebitai.kosjourney.com 
    #   saintandrews.kosjourney.com 
    #   IS30MWOS.kosjourney.com
    # )
    schools = Account.all # .find(:all, :conditions => ["name IN(?)", schools])
    pre_test_template = LessonTemplate.find_by_id(41)
    post_test_template = LessonTemplate.find_by_id(51)

    puts "Beginning generation of CSV report file..."
    CSV.open("#{Rails.root}/burro_report.csv", "w") do |csv|
      csv << [
        "School ID", "School Name", "Teacher ID", "Teacher Name", "Student ID", "Student Name", "Gender", "Ethnicity",
        "Pre-Test Complete",
        "Pre-Test Q1 Result", "Pre-Test Q1 Answer", "Pre-Test Q2 Result", "Pre-Test Q2 Answer", "Pre-Test Q3 Result", "Pre-Test Q3 Answer", "Pre-Test Q4 Result", "Pre-Test Q4 Answer", 
        "Pre-Test Q5 Result", "Pre-Test Q5 Answer", "Pre-Test Q6 Result", "Pre-Test Q6 Answer", "Pre-Test Q7 Result", "Pre-Test Q7 Answer", "Pre-Test Q8 Result", "Pre-Test Q8 Answer", 
        "Pre-Test Q9 Result", "Pre-Test Q9 Answer", "Pre-Test Q10 Result", "Pre-Test Q10 Answer", "Pre-Test Q11 Result", "Pre-Test Q11 Answer", "Pre-Test Q12 Result", "Pre-Test Q12 Answer",
        "Pre-Test Q13 Result", "Pre-Test Q13 Answer", "Pre-Test Q14 Result", "Pre-Test Q14 Answer", "Pre-Test Q15 Result", "Pre-Test Q15 Answer", "Pre-Test Q16 Result", "Pre-Test Q16 Answer", 
        "Pre-Test Q17 Result", "Pre-Test Q17 Answer", "Pre-Test Q18 Result", "Pre-Test Q18 Answer", "Pre-Test Q19 Result", "Pre-Test Q19 Answer", "Pre-Test Q20 Result", "Pre-Test Q20 Answer",
        "Post-Test Complete",
        "Post-Test Q1 Result", "Post-Test Q1 Answer", "Post-Test Q2 Result", "Post-Test Q2 Answer", "Post-Test Q3 Result", "Post-Test Q3 Answer", "Post-Test Q4 Result", "Post-Test Q4 Answer", 
        "Post-Test Q5 Result", "Post-Test Q5 Answer", "Post-Test Q6 Result", "Post-Test Q6 Answer", "Post-Test Q7 Result", "Post-Test Q7 Answer", "Post-Test Q8 Result", "Post-Test Q8 Answer", 
        "Post-Test Q9 Result", "Post-Test Q9 Answer", "Post-Test Q10 Result", "Post-Test Q10 Answer", "Post-Test Q11 Result", "Post-Test Q11 Answer", "Post-Test Q12 Result", "Post-Test Q12 Answer",
        "Post-Test Q13 Result", "Post-Test Q13 Answer", "Post-Test Q14 Result", "Post-Test Q14 Answer", "Post-Test Q15 Result", "Post-Test Q15 Answer", "Post-Test Q16 Result", "Post-Test Q16 Answer", 
        "Post-Test Q17 Result", "Post-Test Q17 Answer", "Post-Test Q18 Result", "Post-Test Q18 Answer", "Post-Test Q19 Result", "Post-Test Q19 Answer", "Post-Test Q20 Result", "Post-Test Q20 Answer"
      ]
      schools.each do |school|
        puts "   #{school.name}"
        school.teachers.each do |teacher|
          unless teacher.students.blank?  
            teacher.students.each do |student|
            row = [school.id, school.name, teacher.id, teacher.full_name, student.id, student.full_name, "", ""]
            pre_test = pre_test_template ? student.lessons.find_by_lesson_template_id(pre_test_template.id) : nil
            post_test = post_test_template ? student.lessons.find_by_lesson_template_id(post_test_template.id) : nil
            [pre_test, post_test].each do |test|
              unless test.blank?
                row << (test.complete ? 1 : 0)
                test.lesson_results.all(:include => :question, :order => "questions.order", :group => "questions.order").each do |result|
                  case result.question.question_type
                  when "Short_Answer"
                    row << result.question.check_short_answer(result.student_answer)
                    row << result.student_answer.to_s
                  when "Multiple_Choice"
                    row << result.question.check_multiple_choice(result.student_answer)
                    row << Answer.find(result.student_answer).answer.to_s
                  end
                end
              else
                row << 0
              end
            end
            csv << row unless row.blank?
            end 
          end
        end
      end
      puts "DONE."
    end
    
  end
  
  def self.questions
    pre_test_template = LessonTemplate.find_by_name("Common Core Pre-Test")
    # post_test_template = LessonTemplate.find_by_name("Common Core Post-Test")
    puts "Pre-Test (Burro)"
    pre_test_template.questions.all(:order => "`order`").each { |q| puts "#{q.order} #{q.question}\n\n" }
    # puts "Post-Test (Burro)"
    # post_test_template.questions.all(:order => "`order`").each { |q| puts "#{q.order} #{q.question}\n\n" }
  end

end