document.addEventListener("turbolinks:load", function(){

  const urlParams = new URLSearchParams(window.location.search);
  const status = urlParams.get("status");

  $('.filter-button').removeClass('btn-primary').addClass('btn-secondary');

  if (status === "完了") {
    $('#project-list tr[data-status="未集荷"]').hide();
    $('#project-list tr[data-status="進行中"]').hide();
    $('#project-list tr[data-status="完了"]').show();
    $('a:contains("完了")').removeClass('btn-secondary').addClass('btn-primary');
    
  } else if (status === "進行中") {
    $('#project-list tr[data-status="未集荷"]').hide();
    $('#project-list tr[data-status="完了"]').hide();
    $('#project-list tr[data-status="進行中"]').show();
    $('a:contains("進行中")').removeClass('btn-secondary').addClass('btn-primary');

  } else {
    $('#project-list tr[data-status="完了"]').hide();
    $('#project-list tr[data-status="進行中"]').hide();
    $('#project-list tr[data-status="未集荷"]').show();
    $('a:contains("未集荷")').removeClass('btn-secondary').addClass('btn-primary');
  }
});