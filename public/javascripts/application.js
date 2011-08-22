var app = {
	
	setActiveNav: function() {
		var url = location.pathname,
				all_links = $('#main_nav ul li'),
				current_link = $('#main_nav ul li a[href$="' + url + '"]');
				active_link = current_link.parent("li");
		
	  if (url == "/") {
			all_links.removeClass('active');
	   	$('.home').addClass('active');
	  } else {
			all_links.removeClass('active');
	   	active_link.addClass('active');
	  }
	
	},
	
	agendaTabs: function() {
    var tabs = $("#track_tabs li a"),
       tabPanels = $(".tab_content");
       
       tabs.click(function(e) {
         var linkRef = $(this).attr("href"),
             tab = $(this).parent("li"),
             tabId = tab.attr("id"),
             tabLis = tab.siblings(),
             tab2angle = $("#tab2").find(".angle"),
             tab3angle = $("#tab3").find(".angle"),
             panel = $(linkRef);
             
       switch(tabId)
       {
       case "tab2":
         tab2angle.css({"border-bottom":"1px solid #000"});
         tab3angle.css({"border-bottom":"1px solid #fff"});
         break;
       case "tab3":
         tab2angle.css({"border-bottom":"1px solid #000"});
         tab3angle.css({"border-bottom":"1px solid #000"});
         break;
       default:
         tab2angle.css({"border-bottom":"1px solid #fff"});
         tab3angle.css({"border-bottom":"1px solid #000"});
       }
      
       tabLis.css({"border-bottom":"1px solid #000"});
       tab.css({"border-bottom":"1px solid #fff"});
       tabPanels.hide();
       panel.show();
       tabLis.removeClass("active");
       $(this).parent().addClass("active");
       e.preventDefault();
     });
	},
	
	agendaDays: function() {
    var dateNav = $(".date_nav ul li a");
        
    dateNav.click(function(e) {
      var linkRef = $(this).attr("href"),
          dateNavs = $(this).parent().siblings(),
          linkParent = $(this).parent(),
          datePanel = $(linkRef),
          datePanels = datePanel.parent().children();

      dateNavs.removeClass("active");
      linkParent.addClass("active");
      datePanels.hide();
      datePanel.show();
			e.preventDefault();
    });
	}
	
};


$(document).ready(function() {
	app.setActiveNav();
});
