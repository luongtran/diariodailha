# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#new_photo').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png|tiff)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('#new_photo').append(data.context)
        data.submit()
      else
        alert("#{file.name} não é uma imagem .gif, .jpeg, ou .png ")
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')


jQuery ->
  $('#new_photo_image').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png|tiff)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('#new_photo_image').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not a gif, jpeg, or png image file")
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')


jQuery ->
  $("#find_by_keyword").keyup ->
    $("#find_by_date").val("")

jQuery ->
  $("#find_by_date").keyup ->
    $("#find_by_keyword").val("")

jQuery ->
  $("#find_by_date").datepicker()
  $.datepicker.regional['pt-BR'] = {
    closeText: 'Fechar', prevText: '&#x3c;Anterior', 
    nextText: 'Pr&oacute;ximo&#x3e;',
    currentText: 'Hoje', 
    monthNames: ['Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho', 'Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun', 'Jul','Ago','Set','Out','Nov','Dez'], 
    dayNames: ['Domingo','Segunda-feira','Ter&ccedil;a-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sabado'], 
    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'], 
    dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'], 
    weekHeader: 'Sm', 
    dateFormat: 'dd/mm/yy', 
    firstDay: 0, 
    isRTL: false, 
    showMonthAfterYear: false, 
    yearSuffix: ''}
  $.datepicker.setDefaults($.datepicker.regional['pt-BR'])