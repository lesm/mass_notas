var toggle_fullscreen = function () {
}

function executeFunctionByName(functionName, context /*, args */) {
	var args = [].slice.call(arguments).splice(2);
	var namespaces = functionName.split(".");
	var func = namespaces.pop();
	for(var i = 0; i < namespaces.length; i++) {
		context = context[namespaces[i]];
	}
	return context[func].apply(this, args);
}
var w,h,dw,dh;
var changeptype = function(){
	w = $(window).width();
	h = $(window).height();
	dw = $(document).width();
	dh = $(document).height();
	if(jQuery.browser.mobile === true){
		$("body").addClass("mobile").removeClass("fixed-left");
	}
	if(!$("#wrapper").hasClass("forced")){
		if(w > 990){
			$("body").removeClass("smallscreen").addClass("widescreen");
			$("#wrapper").removeClass("enlarged");
		}else{
			$("body").removeClass("widescreen").addClass("smallscreen");
			$("#wrapper").addClass("enlarged");
			$(".left ul").removeAttr("style");
		}
		if($("#wrapper").hasClass("enlarged") && $("body").hasClass("fixed-left")){
			$("body").removeClass("fixed-left").addClass("fixed-left-void");
		}else if(!$("#wrapper").hasClass("enlarged") && $("body").hasClass("fixed-left-void")){
			$("body").removeClass("fixed-left-void").addClass("fixed-left");
		}
	}
	toggle_slimscroll(".slimscrollleft");
}

var debounce = function(func, wait, immediate) {
	var timeout, result;
	return function() {
		var context = this, args = arguments;
		var later = function() {
			timeout = null;
			if (!immediate) result = func.apply(context, args);
		};
		var callNow = immediate && !timeout;
		clearTimeout(timeout);
		timeout = setTimeout(later, wait);
		if (callNow) result = func.apply(context, args);
		return result;
	};
}

function resizeitems(){
	if($.isArray(resizefunc)){  
		for (var i = 0; i < resizefunc.length; i++) {
			window[resizefunc[i]]();
		}
	}
}

function initscrolls(){
	if(jQuery.browser.mobile !== true){
		$('.slimscroller').slimscroll({
			height: 'auto',
			size: "5px"
		});

		$('.slimscrollleft').slimScroll({
			height: 'auto',
			position: 'right',
			size: "5px",
			color: '#7A868F',
			wheelStep: 5
		});
	}
}
function toggle_slimscroll(item){
	if($("#wrapper").hasClass("enlarged")){
		$(item).css("overflow","inherit").parent().css("overflow","inherit");
		$(item). siblings(".slimScrollBar").css("visibility","hidden");
	}else{
		$(item).css("overflow","hidden").parent().css("overflow","hidden");
		$(item). siblings(".slimScrollBar").css("visibility","visible");
	}
}

var CodigOaxaca = function() {
	this.VERSION = "1.0.0", 
	this.AUTHOR = "CodigOaxaca", 
	this.SUPPORT = "codigoaxaca@gmail.com", 
	this.pageScrollElement = "html, body", 
	this.$body = $("body")
};
CodigOaxaca.prototype.initTooltipPlugin = function() {
	$.fn.tooltip && $('[data-toggle="tooltip"]').tooltip()
},
CodigOaxaca.prototype.initPopoverPlugin = function() {
	$.fn.popover && $('[data-toggle="popover"]').popover()
},
CodigOaxaca.prototype.initNiceScrollPlugin = function() {
	$.fn.niceScroll &&  $(".nicescroll").niceScroll({ cursorcolor: '#9d9ea5', cursorborderradius: '0px'});
},
CodigOaxaca.prototype.initKnob = function() {
	if ($(".knob").length > 0) {
		$(".knob").knob();
	}
},
CodigOaxaca.prototype.onDocReady = function(e) {
	FastClick.attach(document.body);
	resizefunc.push("initscrolls");
	resizefunc.push("changeptype");
	$('.animate-number').each(function(){
		$(this).animateNumbers($(this).attr("data-value"), true, parseInt($(this).attr("data-duration"))); 
	});
	$(window).resize(debounce(resizeitems,100));
	$("body").trigger("resize");
	$('.right-bar-toggle').on('click', function(e){
		e.preventDefault();
		$('#wrapper').toggleClass('right-bar-enabled');
	}); 
},
CodigOaxaca.prototype.init = function() {
	var $this = this;
	this.initTooltipPlugin(),
	this.initPopoverPlugin(),
	this.initNiceScrollPlugin(),
	this.initKnob(),
	$(document).ready($this.onDocReady);
	// $.Portlet.init();
	// $.Sidemenu.init();
	// $.FullScreen.init();
},
$.CodigOaxaca = new CodigOaxaca, $.CodigOaxaca.Constructor = CodigOaxaca;
$.CodigOaxaca.init();

var wow = new WOW({
    boxClass: 'wow', // animated element css class (default is wow)
    animateClass: 'animated', // animation css class (default is animated)
    offset: 50, // distance to the element when triggering the animation (default is 0)
    mobile: false        // trigger animations on mobile devices (true is default)
});
wow.init();
//# sourceMappingURL=page.js.map
