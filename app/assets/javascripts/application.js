// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require jquery.ui.core
//= require jquery.ui.datepicker
//= require_tree .
//= require ckeditor/init

var calculateTotal = function() {
    var digital = $("#digital").val();
    var small = $("#small").val();
    var medium = $("#medium").val();
    var big = $("#big").val();
    var total = 0;
    
    $("[name^='digital']:checked").each(function() {
        total = total + (parseInt(1) * digital);
    });
    $("[name^='small']").each(function() {
        total = total + (parseInt(this.value) * small);
    });
    $("[name^='medium']").each(function() {
        total = total + (parseInt(this.value) * medium);
    });
    $("[name^='big']").each(function() {
        total = total + (parseInt(this.value) * big);
    });

    $("#total").text(total);
}