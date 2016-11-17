var deleteButton = '<button class="btn btn-secondary btn-sm" id="delete-button">DELETE</button>';

$(document).on('turbolinks:load', function() {
  loadComments();
  nextGift();
});

function loadComments() {
  $.ajax({
    type: 'GET',
    url: window.location.href + "/" + "comments",
    success: function(resp){
      $.each(resp, function( i, comment ) {
        var c = '<li id=' + comment.id +'>' + comment.content + '<strong>' + " by " + comment['user'].first_name + '</strong>' + deleteButton + '</li>';
        // var del = '<a data-method="delete" href="/' +  window.location.href + "/" + "comments/" + comment.id + '">Delete</a>';
      $("#list-comments").append(c);
    });
    }
  }).done(function () {
    deleteComment();
  });
  $("#new_comment").on('submit', makeAjaxPost);
}

function deleteComment() {
  $('#list-comments').on('click', '#delete-button', function (event) {
    event.preventDefault();
    // $(this).parent().remove();
    $.ajax({
      method: 'DELETE',
      url: window.location.href + "/comments/" + $(this).parent().attr("id"),
      dataType: 'json',
      success: function (response) {
        $('#list-comments').empty();
        $.each(response.comments, function( i, comment ) {
          var c = '<li id=' + comment.id +'>' + comment.content + '<strong>' + " by " + comment['user'].first_name + '</strong>' + deleteButton + '</li>';
          // var del = '<a data-method="delete" href="/' +  window.location.href + "/" + "comments/" + comment.id + '">Delete</a>';
        $("#list-comments").append(c);
      });
      }
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
          comment = new Comment(response);
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
      constructor(attr) {
        this.id = attr.id;
        this.content = attr.content;
      }
      renderHTML() {
        var html = '<li id=' + this.id + '>' + this.content + '<strong>' + " by You" + '</strong>' + deleteButton + '</li>';
        $("#list-comments").append(html);
     }
   }

  function nextGift() {
    var wishlistId =  parseInt($("#next").attr("wishlist-id"));
    var userId = parseInt($("#next").attr("user-id"));
    $('#next').on('click', function () {
      $.ajax({
        type: 'GET',
        url: "/users/" + userId + "/wishlists/" + wishlistId +".json",
        success: function(response) {
          var g = response['gifts'].randomElement();
          $('#gift-name').text(g.name);
          $("#next").attr("gift-id", g.id);
        }
      }).done(updateComments);
    });
  }

  function updateComments() {
    $("#list-comments").text("");
    var giftId = parseInt($("#next").attr("gift-id"));
    $.ajax({
      type: 'GET',
      url: "/gifts/" + giftId + "/comments.json",
      success: function(resp){
        $.each(resp, function( i, comment ) {
          var c = '<li>' + comment.content + '<strong>' + " by " + comment['user'].first_name + '</strong>' + deleteButton +'<li>';
          // var del = '<a data-method="delete" href="/' +  window.location.href + "/" + "comments/" + comment.id + '">Delete</a>';
        $("#list-comments").append(c);
      });
      }
    });
  }

  Array.prototype.randomElement = function () {
      return this[Math.floor(Math.random() * this.length)]
  }
