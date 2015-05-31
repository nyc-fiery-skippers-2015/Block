User.create(name:"Don Holness", email:"dhh@gmail.com", password:"1234567")
User.create(name:"bhh", email:"bh@gmail.com", password:"1234567")
Survey.create(name:"Test_survey",creator_id:1,url:"test1" )

Question.create(body:"who am I?",survey_id:1 )
Answer.create(answer:"Don",question_id:1)
Answer.create(answer:"testans2",question_id:1)
Answer.create(answer:"testans2",question_id:1)
Answer.create(answer:"testans3",question_id:1)

Question.create(body:"where am I?",survey_id:1 )
Answer.create(answer:"NY",question_id:2)
Answer.create(answer:"testans2",question_id:2)
Answer.create(answer:"testans2",question_id:2)
Answer.create(answer:"testans3",question_id:2)

Question.create(body:"what time is it?",survey_id:1 )
Answer.create(answer:"5pm",question_id:3)
Answer.create(answer:"testans2",question_id:3)
Answer.create(answer:"testans2",question_id:3)
Answer.create(answer:"testans3",question_id:3)



20.times do |x|
  SurveyAnswer.create(user_id: x,survey_id:1,answer_id:(rand(1..4)))
  SurveyAnswer.create(user_id: x,survey_id:1,answer_id:(rand(5..8)))
  SurveyAnswer.create(user_id: x,survey_id:1,answer_id:(rand(9..12)))
 end

