var Product = {
  filter: function(link) {
    $(link).toggleClass('selected');
    
    var filter_links = $('#filter_links a.selected');
    var products = $('#products_list div.product');

    if (filter_links.length == 0) {
      products.show();
    } else {
      var filter_klasses = filter_links.map(function() {
        return '.' + $(this).attr('id');
      }).get().join(',');

      products.hide().each(function() {
        if ($(this).is(filter_klasses))
          $(this).show()
      })
    }
  }
};

var App = {
	loadContent: function(dom_id, url){
		$.ajax({
		   type: "GET",
		   url: "/load?url="+url,
		   success: function(data){
		     $(dom_id).html(data);
		   }
		 });
	}
};

$(document).ready(function() {
  $('a[rel*=facebox]').facebox();
  $("#slides").slides({
    play: 5000,
    pause: 2500,
    slideSpeed: 1500,
    slideEasing: "easeOutQuint"
  });
  $('.scrolldiv').tinyscrollbar();
  $('.nice-links a').hover(function() {
    if ($(this).parent().hasClass('current')) return;
    $(this).stop().animate({color: '#444'}, 1000)
  }, function() {
    if ($(this).parent().hasClass('current')) return;
    $(this).stop().animate({color: '#aaa'}, 1000)
  })
	
	App.loadContent('#news_updates', "http://heyook.com/dieselcrankshafts.com/news.html");
	
})