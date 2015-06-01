User.create(name:"Don", email:"dhh@gmail.com", password:"12345")
User.create(name:"Antonio", email:"bh@gmail.com", password:"12345")
Survey.create(name:"Presidents",creator_id:2,url:"graeAgaerHA" )

# Seed files should be refactored appropriately like other code.
Survey.create(name:"Movies",creator_id:1, url:"tyFYTFDtf" ).tap do |survey|
  ['Dumb and Dumber', 'Scarface', 'Fight Club', 'The Big Lebowski'].each do |movie|
    survey.questions.create(body: movie).tap do |q|
      5.times { |i|  q.answers.create(answer: "#{i} star") }
    end
  end
end


Question.create(body:"George Washington",survey_id:2 )
Answer.create(answer:"1 star",question_id:6)
Answer.create(answer:"2 stars",question_id:6)
Answer.create(answer:"3 stars",question_id:6)
Answer.create(answer:"4 stars",question_id:6)

Question.create(body:"Abraham Lincoln",survey_id:2 )
Answer.create(answer:"1 star",question_id:7)
Answer.create(answer:"2 stars",question_id:7)
Answer.create(answer:"3 stars",question_id:7)
Answer.create(answer:"4 stars",question_id:7)

Question.create(body:"George W. Bush",survey_id:2 )
Answer.create(answer:"1 star",question_id:8)
Answer.create(answer:"2 stars",question_id:8)
Answer.create(answer:"3 stars",question_id:8)
Answer.create(answer:"4 stars",question_id:8)

Question.create(body:"John F. Kennedy",survey_id:2 )
Answer.create(answer:"1 star",question_id:9)
Answer.create(answer:"2 stars",question_id:9)
Answer.create(answer:"3 stars",question_id:9)
Answer.create(answer:"4 stars",question_id:9)

Question.create(body:"Bill Clinton",survey_id:2 )
Answer.create(answer:"1 star",question_id:10)
Answer.create(answer:"2 stars",question_id:10)
Answer.create(answer:"3 stars",question_id:10)
Answer.create(answer:"4 stars",question_id:10)



20.times do |x|
  SurveyAnswer.create(user_id: x,survey_id:1,answer_id:(rand(1..4)))
  SurveyAnswer.create(user_id: x,survey_id:1,answer_id:(rand(5..8)))
  SurveyAnswer.create(user_id: x,survey_id:1,answer_id:(rand(9..12)))
  SurveyAnswer.create(user_id: x,survey_id:1,answer_id:(rand(13..16)))
  SurveyAnswer.create(user_id: x,survey_id:1,answer_id:(rand(17..20)))
  SurveyAnswer.create(user_id: x,survey_id:2,answer_id:(rand(21..24)))
  SurveyAnswer.create(user_id: x,survey_id:2,answer_id:(rand(25..28)))
  SurveyAnswer.create(user_id: x,survey_id:2,answer_id:(rand(29..32)))
  SurveyAnswer.create(user_id: x,survey_id:2,answer_id:(rand(33..36)))
  SurveyAnswer.create(user_id: x,survey_id:2,answer_id:(rand(37..40)))
 end

