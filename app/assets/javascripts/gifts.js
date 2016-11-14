 var deleting = '<div class="center-right"><button type="button" id="delete" comment-id="" class="btn btn-link">Delete</button></div></li><br>';


$(document).on('turbolinks:load', function() {
  loadComments();
});

function loadComments() {
  $.ajax({
    type: 'GET',
    url: window.location.href + "/" + "comments",
    success: function(resp){
      $.each(resp, function( i, comment ) {
        var c = '<li id=' + comment.id +'>' + comment.content + '<strong>' + " by " + comment['user'].first_name + '</strong>';
        // var del = '<a data-method="delete" href="/' +  window.location.href + "/" + "comments/" + comment.id + '">Delete</a>';
      $("ul").append(c + deleting);
      $("button[type=button]").attr("comment-id", comment.id);
    });
    }
  }).done(function () {
    deleteComment();
  });
  $("#new_comment").on('submit', makeAjaxPost);
}

function deleteComment() {
  $(document).ready(function(){
    $(this).find("button[type=button]").on('click', function(){
      debugger
    });
  });
}


function makeAjaxPost(event) {
   event.preventDefault();
   var action = this.action;
   var method = this.method;
   var comment_content = $(this).find('#comment_content').val();
    $.ajax({
         method: method,
         url: action,
         data: {content: comment_content},
         success: function(response) {
          //  console.log(response);
          // //  debugger;
          comment = new Comment(response.content);
          comment.renderHTML();
          $('#comment_content').val('');
          $("input[type=submit]").removeAttr("disabled");
         },
         error: function () {
           alert('ups, try again!');
         }
      }).done(function () {
         $(this).find('#comment_content').val('');
      }) ;
    }


    class Comment {
      constructor(content) {
        this.content = content;
      }
      renderHTML() {
        var html = '<li>' + this.content + '<strong>' + " by You" + '</strong>' + '</li><br>';
        $('ul').append(html + deleting);
     }
   }
