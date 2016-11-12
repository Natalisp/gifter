$(document).on('turbolinks:load', function() {
  $.ajax({
    type: 'GET',
    url: window.location.href + "/" + "comments",
    success: function(resp){
      $.each(resp, function( i, comment ) {
        var c = '<li>' + comment.content + '</li><br>';
        var author = '<div class="center-right">' + " by " + comment['user'].first_name + </div>; 
      $("ul").append(c);
    });
    }
  });
  $("#new_comment").on('submit', makeAjaxPost);
});

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
         },
         error: function () {
           alert('ups, try again!');
         }
      });
    }


    class Comment {
      constructor(content) {
        this.content = content;
      }
      renderHTML() {
        var html = '<li>' + this.content +'</li><br>';
        $('ul').append(html);
      // $("#games").append('<li data-gameid="' + game.id + '">' + "Game Number " + game.id + '</li>');
    }
  }

// $(document).on('turbolinks:load', function() {
//
//   $("#new_comment").on("submit", function(e) {
//     e.preventDefault();
//     var comment_content = $('#comment_content').val();
//     var giftId = window.location.href.slice(-2);
//     $.ajax({
//     type: 'POST',
//     url: this.action,
//     data: {content: comment_content},
//     success: function(resp) {
//       debugger;
//         console.log(resp)
//       // $("#comment_content").html(resp);
//      }
//     });
//    });

 //   $("#comment-delete").on("click", function(e){
 //      $.ajax({
 //        url: this.href,
 //        type: 'delete',
 //        success: function(result) {
 //    // Do something with the result
 //    }
 //   });
 //  //  e.preventDefault();
 // });


  // });

// class Gift {
//   constructor(attriibutes) {
//     this.name = attributes.name
//   }
//
//   renderHTML() {
//     return (
//       "<h3>" + this.name + "</h3>"
//     )
// //   }
//
//
// }
