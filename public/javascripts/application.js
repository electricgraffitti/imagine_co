var flash = {

	injectFlashBox: function() {
		$('#flash').addClass("flash_wrap");
		$("#flash").hide();
	},

	setFlash: function() {
		var flash_message = $("#flash").html();
		var msg = $.trim(flash_message);
		if (msg !== "") {
			flash.activateNotice(flash_message);
		}
	},

	activateNotice: function(flash_message) {
		var $flash_div = $("#flash");
		$flash_div.html(flash_message);
		$flash_div.show("slide", {
			direction: 'up'
		});
		// Set the fadeout
		setTimeout(function() {
			$flash_div.hide("slide", {
				direction: 'up'
			},
			function() {
				$flash_div.html("");
				$flash_div.hide();
			});
		},
		2500);
	}

};

var lessonVideo = {
	
	playVideo: function(video_url) {
		var playerWindow = $("#player"),
				lessonDiv = $("#lesson_form");
				
		playerWindow.expose({
			color: '#000',
			loadSpeed: 200,
			opacity: 0.6,
			closeOnClick: false
		});
		
		$f("player", "/flowplayer/flowplayer-3.1.5.swf", {
			clip: {
				url: video_url
			},
			plugins: {
      	controls: {
        	url: '/flowplayer/flowplayer.controls-3.1.5.swf',
          playlist: false,
          backgroundColor: '#000', 
          height: 18,
          time: false,
          fullscreen: true,
          volume: false,
          bufferColor: '#666666',
          buttonColor: '#666666',
          tooltips: {
          	buttons: true, 
            fullscreen: 'Fullscreen' 
          } 
        }
			}
		});
		$f(0).play().onFinish(function() {
			this.unload();
			playerWindow.remove();
			$.mask.close();
			lessonDiv.show();
		});
	}
	
};

var overlays = {
		
		welcomeWindow: function() {
			$("#help_window").overlay({
				top: 35,
				expose: {
					color: '#000',
					loadSpeed: 200,
					opacity: 0.2
				},
				// disable this for modal dialog-type of overlays
				closeOnClick: false,
				
				load: true

				// onBeforeLoad: function() {
				// 	var wrap = this.getOverlay(),
				// 			link = this.getTrigger();
				// }
			});
		},
		
		triggerWelcomeWindow: function() {
			overlays.welcomeWindow();
		}
		
};

var triggers = {
	
	addStudent: function() {
		var addButton = $("#add_student"),
				closeForm = $("#close_form"),
				studentForm = $("#add_form");
				
		addButton.click(function(e) {
			e.preventDefault();
			studentForm.show();
		});
		closeForm.click(function(e) {
			e.preventDefault();
			studentForm.hide();
		});
	},
	
	editStudent: function() {
		var studentLink = $(".edit_student");
		
		studentLink.click(function(e) {
			var wrap = $(this).parents(".listed_student").first(),
					form = wrap.find(".edit_form"),
					editCloseLink = form.find(".edit_cancel_button");
								
			form.show();
			
			triggers.closeEditForm(editCloseLink, form);
			
			e.preventDefault();
		});
		
	},
	
	closeEditForm: function(editCloseLink, form) {
		
		editCloseLink.click(function(e) {
			console.log("in it");
				
			console.log(form);
			form.hide();
			
			e.preventDefault();
		});
	}
	
};

var form = {
	
	decorateNestedFormLinks: function() {
		var addLinks = $(".add_nested_fields"),
				removeLinks = $(".remove_nested_fields");
		
		addLinks.addClass("add_button green");
		removeLinks.addClass("remove_button red");
	}
	
	// removeFields: function() {
	// 	var removeLink = $(".remove_link");
	// 	
	// 	removeLink.live("click", function() {
	// 		var questionBlock = $(this).parents(".section").first(),
	// 				destroyParam = $(this).parents(".field").first().find("input[type='hidden']");
	// 				
	// 				destroyParam.val(1);
	// 				questionBlock.hide();
	// 	});
	// },
	// 
	// addFields: function() {
	// 	var addLink = $(".add_link");
	// 	
	// 	addLink.live("click", function() {
	// 		var assoc = $(this).attr("assoc"),
	// 				fields = $(this).attr("fields"),
	// 				newId = new Date().getTime(),
	// 				regex = new RegExp("new_" + assoc, "g");
	// 				
	// 			$(this).parent().before(content.replace(regex, newId));
	// 	});
	// 
	// 			
	// 			
	// }
	
};

var app = {
	
	jensButton: function() {
		var button = $("#jen_button"),
				accounts = $("#accounts"),
				revTag = $("#rev_tag"),
				pag = $(".pagination"),
				stats = $("#stats");
		
		button.click(function() {
			accounts.hide();
			pag.hide();
			revTag.text("Accounts Deleted! Revenue Destroyed!");
			stats.html("I Told You Not To Click The Button!!!!");
		});
	},
	
	initGame: function(sessionId,chatOption) {
		app.deactivateLaunchLink(sessionId,chatOption);
	},
	
	setMainGame: function() {
		var lessons = $("#listed_lessons");
		
		lessons.hide();
		
	},
	
	initGameExpose: function() {
		var playerWrapper = $("#game_window");
		
		playerWrapper.expose({
			color: '#000',
			loadSpeed: 200,
			opacity: 0.6,
			closeOnClick: false
		});
		
	},
	
	deactivateLaunchLink: function(sessionId,chatOption) {
		var link = $('.game_launch'),
				playerWrapper = $("#game_window"),
				playerWindow = playerWrapper.find("#inserted_game"),
				kolaunchgame = playerWrapper.find("#kolaunch"),
				lessons = $("#listed_lessons"),
				koLaunchLink = $("a.kolaunch_close"),
		 		orangeButton = $('.link_block');

		playerWindow.hide();

		koLaunchLink.click(function(e) {
			playerWrapper.html("");
			playerWrapper.append(kolaunchgame);
			kolaunchgame.append($(this));
			kolaunchgame.hide();
			playerWrapper.append(playerWindow);
			$.mask.close();
			lessons.show();
			e.preventDefault();
		});
		
		link.click(function(e) {
			var mod = $(this).attr("module"),
					existingCloseLink = $(".close_link"),
					greenButton = $(".green_button");
					
			existingCloseLink.remove();
			playerWrapper.html("");
			playerWrapper.append(kolaunchgame);
			kolaunchgame.append(koLaunchLink);
			kolaunchgame.hide();
			playerWrapper.append(playerWindow);
			orangeButton.show();
			greenButton.hide();
			lessons.hide();
			e.preventDefault();
			app.loadGame(mod, sessionId, chatOption, playerWrapper, playerWindow, orangeButton, greenButton, lessons);
		});
	},
	
	loadGame: function(mod, sessionId, chatOption, playerWrapper, playerWindow, orangeButton, greenButton, lessons) {
		var closeLink = '<a class="close_link circle_close" href="">Close</a>',
				flashvars = {
					session_id: sessionId,
					chat_disabled: chatOption
				},
				params = {
					base: "/game"
				},
				attributes = {};
				
		swfobject.embedSWF("/game/" + mod + ".swf", "inserted_game", "800", "600", "9.0.0", "expressInstall.swf", flashvars, params, attributes);
		playerWrapper.append(closeLink);
		playerWindow.slideDown();
		playerWrapper.expose({
			color: '#000',
			loadSpeed: 200,
			opacity: 0.6,
			closeOnClick: false
		});
		app.closeWindow(playerWrapper, playerWindow, orangeButton, greenButton, lessons);
	},
	
	closeWindow: function(playerWrapper, playerWindow, orangeButton, greenButton, lessons) {
		var closeLink = $("a.close_link");
		
		closeLink.live("click", function(e) {
			playerWrapper.html("");
			playerWrapper.append(playerWindow);
			$.mask.close();
			orangeButton.hide();
			greenButton.show();
			lessons.show();
			e.preventDefault();
		});
	}
	
};

//**********Initialize Document**********//
$(document).ready(function() {
	// injects flash div into dom
	flash.injectFlashBox();
	flash.setFlash();
});

