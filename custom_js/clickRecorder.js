$('#scantronForm input').click(function () {
  //Localstorage only stores strings, so we convert between json
  var clicks = JSON.parse(localStorage.getItem('clicks')) || [] ;

  var ans;
  if ($(this).val()) {
    ans = $(this).val()
  }
  else{
    ans = "none"
  }

  var oneClick = {
    question: $(this).attr('name'),
    answer: ans,
    timestamp: Date.now()
  }
  
  clicks.push(oneClick)
  localStorage.setItem('clicks', JSON.stringify(clicks));
});

(function rideScopeWrapper($) {
    // TODO how can i break this part into a sepearate file? it is repeated across the code base atm
    var authToken;
    WorldScholars.authToken.then(function setAuthToken(token) {
        if (token || (window.location.origin == "file://")) {
            authToken = token;
        } else {
            window.location.href = '/signin.html';
        }
    }).catch(function handleTokenError(error) {
        alert(error);
        window.location.href = '/signin.html';
    });

    function writeExam(event) {
        event.preventDefault();
        //console.log(JSON.stringify($('#scantronForm').serializeArray()));
        //console.log(localStorage.getItem('clicks'));
        //console.log(authToken);

        $.ajax({
            method: 'POST',
            url: _config.api.invokeUrl + '/examwrite',
            headers: {
                Authorization: authToken
            },
            data: JSON.stringify({
               examId: uuidv4(),
               examNumber: getUrlParameter('tNum'),
               clicks: JSON.parse(localStorage.getItem('clicks')),
               examAnswers : $('#scantronForm').serializeArray()
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
    
    // Register click handler for form submit button
    $(function onDocReady() {
        if(window.location.pathname=="/scantron.html"){
          document.getElementById('testName').innerHTML += getUrlParameter('tNum');
          $('#scantronFormSubmitButton').click(writeExam);
        }
        $('#signOut').click(function() {
            WildRydes.signOut();
            alert("You have been signed out.");
            window.location = "signin.html";
        });

    });

}(jQuery));


