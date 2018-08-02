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

var WorldScholars = window.WorldScholars || {};

$( "#scantronForm" ).submit(function( event ) {
  //localStorage is only removed when AWS lambda successfully executes
  //call the examWriter here some how
  writeExam(event);
  alert("done");
});

    function writeExam(e) {
        console.log($(this).attr("action"));
        console.log(localStorage.getItem('clicks');
        $.ajax({
            method: 'POST',
            url: _config.api.invokeUrl + '/writeExam',
            headers: {
                Authorization: WorldScholars.authToken
            },
            data: JSON.stringify({
               clicks: localStorage.getItem('clicks'),
               examAnswers : $(this).attr("action")
            }),
            contentType: 'application/json',
            success: completeRequest,
            error: function ajaxError(jqXHR, textStatus, errorThrown) {
                console.error('Error writng exam to database: ', textStatus, ', Details: ', errorThrown);
                console.error('Response: ', jqXHR.responseText);
                alert('An error occured when recording your exam:\n' + jqXHR.responseText);
            }
        });
    }

    function completeRequest(result) {
        console.log('Succsefully wrote exam data to database: ', result);
        localStorage.removeItem('clicks');
    }
