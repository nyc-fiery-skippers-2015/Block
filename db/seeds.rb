User.create(name:"Don", email:"dhh@gmail.com", password:"12345")
User.create(name:"Antonio", email:"bh@gmail.com", password:"12345")
Survey.create(name:"Movies",creator_id:1,url:"tyFYTFDtf" )
Survey.create(name:"Presidents",creator_id:2,url:"graeAgaerHA" )

Question.create(body:"Dumb and Dumber",survey_id:1 )
Answer.create(answer:"1 star",question_id:1)
Answer.create(answer:"2 stars",question_id:1)
Answer.create(answer:"3 stars",question_id:1)
Answer.create(answer:"4 stars",question_id:1)

Question.create(body:"Scarface",survey_id:1 )
Answer.create(answer:"1 star",question_id:2)
Answer.create(answer:"2 stars",question_id:2)
Answer.create(answer:"3 stars",question_id:2)
Answer.create(answer:"4 stars",question_id:2)

Question.create(body:"Fight Club",survey_id:1 )
Answer.create(answer:"1 star",question_id:3)
Answer.create(answer:"2 stars",question_id:3)
Answer.create(answer:"3 stars",question_id:3)
Answer.create(answer:"4 stars",question_id:3)

Question.create(body:"The Godfather",survey_id:1 )
Answer.create(answer:"1 star",question_id:4)
Answer.create(answer:"2 stars",question_id:4)
Answer.create(answer:"3 stars",question_id:4)
Answer.create(answer:"4 stars",question_id:4)

Question.create(body:"The Big Lebowski",survey_id:1 )
Answer.create(answer:"1 star",question_id:5)
Answer.create(answer:"2 stars",question_id:5)
Answer.create(answer:"3 stars",question_id:5)
Answer.create(answer:"4 stars",question_id:5)

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

