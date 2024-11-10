document.addEventListener("DOMContentLoaded", function(){

  const urlParams = new URLSearchParams(window.location.search);
  const status = urlParams.get("status");

  if (status === "完了") {
    $('#project-list tr[data-status="未集荷"]').hide();
    $('#project-list tr[data-status="進行中"]').hide();
    $('#project-list tr[data-status="完了"]').show();
    $('.filter-button').removeClass('btn-primary').addClass('btn-secondary');
    $('a[href*="完了"]').removeClass('btn-secondary').addClass('btn-primary');
    
  } else if (status === "進行中") {
    $('#project-list tr[data-status="未集荷"]').hide();
    $('#project-list tr[data-status="完了"]').hide();
    $('#project-list tr[data-status="進行中"]').show();
    $('.filter-button').removeClass('btn-primary').addClass('btn-secondary');
    $('a[href*="進行中"]').removeClass('btn-secondary').addClass('btn-primary');

  } else {
    $('#project-list tr[data-status="完了"]').hide();
    $('#project-list tr[data-status="進行中"]').hide();
    $('#project-list tr[data-status="未集荷"]').show();
    $('.filter-button').removeClass('btn-primary').addClass('btn-secondary');
    $('a[href*="未集荷"]').removeClass('btn-secondary').addClass('btn-primary');
  }
});