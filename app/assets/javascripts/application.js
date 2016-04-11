// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require turbolinks
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui/dialog
//= require jquery-ui/autocomplete
//= require jquery.remotipart
//= require bootstrap-sprockets
//= require moment
//= require fullcalendar
//= require dataTables/jquery.dataTables
//= require_tree .

jQuery(document).ready(function($){
	$(function() {
	  if ($('.pagination').length) {
	    $(window).scroll(function() {
	      var url;
	      url = $('.pagination .next_page').attr('href');
	        if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 40 && window.location.pathname == "/activities/new") 
	        {
	          $('.pagination').text("Fetching more activities...");
	          return $.getScript(url);
	        }
	    });
	    return $(window).scroll();
	  }
	});	
	$('#sidebar-collapse').click(function(){
		$('#sidebar').toggleClass('menu-compact');
		$(this).toggleClass('active');
	});

	//Chat
	$("#chat-link").click(function () {
    $('.page-chatbar').toggleClass('open');
    $(this).toggleClass('open');
	});

	$('.owl-carousel').owlCarousel({
    loop:true,
    responsive:{
      0:{
          items:1
      },
      768:{
          items:2
      },
      1024:{
          items:3
      }
    }
	});
});