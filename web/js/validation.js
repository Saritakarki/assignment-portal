$(function() {
     $("#login-form").validate({
        rules: {
            uname: "required",
            pass: "required"
        }
    });
  // Initialize form validation on the registration form.
  // It has the name attribute "registration"
  $("form[name='registration']").validate({
    // Specify validation rules
    rules: {
      // The key name on the left side is the name attribute
      // of an input field. Validation rules are defined
      // on the right side
      fname: "required",
      lname: "required",
      uname:"required",
      email: {
        required: true,
        // Specify that email should be validated
        // by the built-in "email" rule
        email: true
      },
      pass: {
        required: true,
        minlength: 5
      },
      cpass:{
                required: true,
                equalTo: '#pass'
            }
    },
    // Specify validation error messages
    messages: {
      fname: "Please enter your firstname",
      lname: "Please enter your lastname",
      uname:"Please enter your user name",
      cpass: "Passwords do not match!",
      pass: {
        required: "Please provide a password",
        minlength: "Your password must be at least 5 characters long"
      },
      email: {
                required: 'Please enter an email address',
                email: 'Please enter a valid email address'
            },
      
    },
    

    // Make sure the form is submitted to the destination defined
    // in the "action" attribute of the form when valid
    submitHandler: function(form) {
      form.submit();
    }
  });
 
});