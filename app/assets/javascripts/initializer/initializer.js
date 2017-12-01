var page = function () {

  var Sidemenu = function() {
    this.$body = $("body"),
    this.$openLeftBtn = $(".open-left"),
    this.$menuItem = $("#sidebar-menu a")
  };
  Sidemenu.prototype.openLeftBar = function() {
    $("#wrapper").toggleClass("enlarged");
    $("#wrapper").addClass("forced");

    if($("#wrapper").hasClass("enlarged") && $("body").hasClass("fixed-left")) {
      $("body").removeClass("fixed-left").addClass("fixed-left-void");
    } else if(!$("#wrapper").hasClass("enlarged") && $("body").hasClass("fixed-left-void")) {
      $("body").removeClass("fixed-left-void").addClass("fixed-left");
    }

    if($("#wrapper").hasClass("enlarged")) {
      $(".left ul").removeAttr("style");
    } else {
      $(".subdrop").siblings("ul:first").show();
    }

    toggle_slimscroll(".slimscrollleft");
    $("body").trigger("resize");
  },
  Sidemenu.prototype.menuItemClick = function(e) {
    if(!$("#wrapper").hasClass("enlarged")){
      if($(this).parent().hasClass("has_sub")) {
        e.preventDefault();
      }
      if(!$(this).hasClass("subdrop")) {
        $("ul",$(this).parents("ul:first")).slideUp(350);
        $("a",$(this).parents("ul:first")).removeClass("subdrop");
        $("#sidebar-menu .pull-right i").removeClass("md-remove").addClass("md-add");

        $(this).next("ul").slideDown(350);
        $(this).addClass("subdrop");
        $(".pull-right i",$(this).parents(".has_sub:last")).removeClass("md-add").addClass("md-remove");
        $(".pull-right i",$(this).siblings("ul")).removeClass("md-remove").addClass("md-add");
      }else if($(this).hasClass("subdrop")) {
        $(this).removeClass("subdrop");
        $(this).next("ul").slideUp(350);
        $(".pull-right i",$(this).parent()).removeClass("md-remove").addClass("md-add");
      }
    }
  },
  Sidemenu.prototype.init = function() {
    var $this  = this;
    $(".open-left").click(function(e) {
      e.stopPropagation();
      $this.openLeftBar();
    });

    $this.$menuItem.on('click', $this.menuItemClick);

    $("#sidebar-menu ul li.has_sub a.active").parents("li:last").children("a:first").addClass("active").trigger("click");
  },
  $.Sidemenu = new Sidemenu, $.Sidemenu.Constructor = Sidemenu;
  $.Sidemenu.init();

  var FullScreen = function() {
    this.$body = $("body"),
    this.$fullscreenBtn = $("#btn-fullscreen")
  };
  FullScreen.prototype.launchFullscreen  = function(element) {
    if(element.requestFullscreen) {
      element.requestFullscreen();
    } else if(element.mozRequestFullScreen) {
      element.mozRequestFullScreen();
    } else if(element.webkitRequestFullscreen) {
      element.webkitRequestFullscreen();
    } else if(element.msRequestFullscreen) {
      element.msRequestFullscreen();
    }
  },
  FullScreen.prototype.exitFullscreen = function() {
    if(document.exitFullscreen) {
      document.exitFullscreen();
    } else if(document.mozCancelFullScreen) {
      document.mozCancelFullScreen();
    } else if(document.webkitExitFullscreen) {
      document.webkitExitFullscreen();
    }
  },
  FullScreen.prototype.toggle_fullscreen  = function() {
    var $this = this;
    var fullscreenEnabled = document.fullscreenEnabled || document.mozFullScreenEnabled || document.webkitFullscreenEnabled;
    if(fullscreenEnabled) {
      if(!document.fullscreenElement && !document.mozFullScreenElement && !document.webkitFullscreenElement && !document.msFullscreenElement) {
        $this.launchFullscreen(document.documentElement);
      } else{
        $this.exitFullscreen();
      }
    }
  },
  FullScreen.prototype.init = function() {
    var $this  = this;
    $this.$fullscreenBtn.on('click', function() {
      $this.toggle_fullscreen();
    });
  },
  $.FullScreen = new FullScreen, $.FullScreen.Constructor = FullScreen;
  $.FullScreen.init();

  var Portlet = function() {
    this.$body = $("body"),
    this.$portletIdentifier = ".portlet",
    this.$portletCloser = '.portlet a[data-toggle="remove"]',
    this.$portletRefresher = '.portlet a[data-toggle="reload"]'
  };
  Portlet.prototype.init = function() {
    var $this = this;
    $(document).on("click",this.$portletCloser, function (ev) {
      ev.preventDefault();
      var $portlet = $(this).closest($this.$portletIdentifier);
      var $portlet_parent = $portlet.parent();
      $portlet.remove();
      if ($portlet_parent.children().length == 0) {
        $portlet_parent.remove();
      }
    });
    $(document).on("click",this.$portletRefresher, function (ev) {
      ev.preventDefault();
      var $portlet = $(this).closest($this.$portletIdentifier);
      $portlet.append('<div class="panel-disabled"><div class="loader-1"></div></div>');
      var $pd = $portlet.find('.panel-disabled');
      setTimeout(function () {
        $pd.fadeOut('fast', function () {
          $pd.remove();
        });
      }, 500 + 300 * (Math.random() * 5));
    });
  },
  $.Portlet = new Portlet, $.Portlet.Constructor = Portlet;
  $.Portlet.init();
}

$(document).on('ready', function () {
  page()
})