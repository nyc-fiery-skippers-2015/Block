

User.create(name:"Don Holness", email:"dhh@gmail.com", password_hash:"dh")
User.create(name:"bh", email:"bh@gmail.com", password_hash:"bh")
 Survey.create(name:"Test_survey",creator_id:1,url:"test1" )
   Question.create(body:"who am I?",survey_id:1 )
     Answer.create(answer:"Don",question_id:1)
     SurveyAnswer.create(user_id:2,survey_id:1,answer_id:1)
   Question.create(body:"where am I?",survey_id:1 )
     Answer.create(answer:"NY",question_id:1)
       SurveyAnswer.create(user_id:2,survey_id:1,answer_id:2)
   Question.create(body:"what time is it?",survey_id:1 )
     Answer.create(answer:"5pm",question_id:1)
      SurveyAnswer.create(user_id:2,survey_id:1,answer_id:3)
