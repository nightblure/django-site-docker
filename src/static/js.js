
//$(document).on('submit','#auth_token_form',function(e){
//        e.preventDefault();
//        //var friendForm = $(this);
//        //var x = friendForm.attr('login')
//        $value = $(this).val()
//        //alert('aa')
//        $.ajax({
//
//            type:'POST',
//            url:'{% url "auth_token_route" %}',
//            data:
//            {
//                d: $('input[name=password]').val(),
//                task: 'hhh',
//                csrfmiddlewaretoken: '{% csrf_token %}'
//                //test2: friendForm
//            },
//            success:function() {
//
//            }
//        })
//
//});