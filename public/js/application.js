$(document).ready(function() {
  $('.new_question').on('click', questionForm);
  $('.survey-show').on('submit','.new_question_form', addQuestion);
});

var questionForm = function(event) {
  event.preventDefault();
  var $target = $(event.target);
  var controllerMethod = 'get';
  var surveyId = $target.attr('id');
  var controllerRoute = '/surveys/' + surveyId + '/questions/new'

  $.ajax({
    'url': controllerRoute,
    'method': controllerMethod,
    'datatype': 'html'
  }).done(function(response) {
    $('.survey-show').append(response)
  }).fail(function(error){
    console.log(error)
  });
};

var addQuestion = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var controllerMethod = 'post';
  var controllerRoute = $target.attr('action');
  var myData = $target.serialize();

  $.ajax({
    'url': controllerRoute,
    'method': controllerMethod,
    'data': myData,
    'datatype': 'html'
  }).done(function(response){
    $('.new_question_form').toggle(false)
    $('.survey-questions').append(response)
  }).fail(function(error){
    console.log(error)
  });
};
