/**
 * Created by eugenepark on 05/04/2019.
 */
$(document).ready(function() {

    // loginForm
    $('#new-blog').formValidation({
        framework: 'bootstrap',
        fields: {
            title: {
                validators: {
                    notEmpty: {
                        message: '제목을 입력해 주십시오.'
                    }
                }
            },
            content: {
                validators: {
                    notEmpty: {
                        message: '내용을 입력해 주십시오.'
                    }
                }
            }
        }
    });

    // loginForm
    $('#edit-blog').formValidation({
        framework: 'bootstrap',
        fields: {
            title: {
                validators: {
                    notEmpty: {
                        message: '제목을 입력해 주십시오.'
                    }
                }
            },
            content: {
                validators: {
                    notEmpty: {
                        message: '내용을 입력해 주십시오.'
                    }
                }
            }
        }
    });

});
