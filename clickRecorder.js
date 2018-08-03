var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

function uuidv4() {
  return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
  )
}

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
    var authToken;
    console.log(window.location.origin == "file://")
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
        console.log(JSON.stringify($('#scantronForm').serializeArray()));
        console.log(localStorage.getItem('clicks'));
        console.log(authToken);

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
        document.getElementById('testName').innerHTML += getUrlParameter('tNum');
        $('#scantronFormSubmitButton').click(writeExam);
        $('#signOut').click(function() {
            WildRydes.signOut();
            alert("You have been signed out.");
            window.location = "signin.html";
        });

    });

}(jQuery));


