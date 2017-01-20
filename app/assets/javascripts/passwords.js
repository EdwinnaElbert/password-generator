$(document).on('turbolinks:load', function() {
  $(document).on('click', '#add-input', function() {
    var lastField = $('.single-word:last-of-type').clone();
    lastField.val('');
    $('.password_user_inputs').append(lastField);
  });
});
