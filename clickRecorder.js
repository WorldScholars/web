$('#scantronForm input').click(function () {
  //Localstorage only stores strings, so we convert between json
  var clicks = JSON.parse(localStorage.getItem('clicks')) || [] ;

  var oneClick = {
    question: $(this).attr('name'),
    answer: $(this).val(),
    timestamp: Date.now()
  }
  
  clicks.push(oneClick)
  localStorage.setItem('clicks', JSON.stringify(clicks));
});

$( "#scantronForm" ).submit(function( event ) {
  localStorage.removeItem('clicks');
});
