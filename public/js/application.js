$(document).ready(function() {
  $('.new_question').on('click', questionForm);
  $('.survey-show').on('submit','.new_question_form', addQuestion);
  $('.edit-question').on('click', editQuestionForm);
  $('.survey-show').on('submit', '.edit_question_form', editQuestion);
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

var editQuestionForm = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var surveyId = $target.data('surveyId');
  var thisDiv = $target.data('questionId');
  var controllerRoute = '/surveys/' + surveyId + '/questions/edit/' + thisDiv;
  var controllerMethod = 'get';

  $.ajax({
    'url': controllerRoute,
    'method': controllerMethod,
    'datatype': 'html'
  }).done(function(response){
    var here = '#' + thisDiv
    $(here).append(response)
  }).fail(function(error){
    console.log(error)
  });
};

var editQuestion = function(event){
  event.preventDefault();
  var $target = $(event.target);
  var myData = $target.serialize();
  var controllerMethod = 'put';
  var dest = $target.closest('.question').attr('id')
  var controllerRoute = $target.attr('action');

  $.ajax({
    'url': controllerRoute,
    'method': controllerMethod,
    'data': myData,
    'datatype': 'html'
  }).done(function(response){
    $('.edit_question_form').toggle(false)
    var quest = '#' + dest
    $(quest).replaceWith(response)
  }).fail(function(error){
    console.log(error)
  });
};