(function examGetScopeWrapper($) {
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

    function getExamResults(examIdfromUrl) {

        console.log(authToken);
        $.ajax({
            method: 'GET',
            url: _config.api.invokeUrl + '/examget?id='+examIdfromUrl,
            headers: {
                Authorization: authToken
            },
            //contentType: 'application/json',
            success: completeRequest,
            error: function ajaxError(jqXHR, textStatus, errorThrown) {
                console.error('Error reading exam from database: ', textStatus, ', Details: ', errorThrown);
                console.error('Response: ', jqXHR.responseText);
                alert('An error occured when reading your exam:\n' + jqXHR.responseText);
            }
        });
    }

    function completeRequest(results) {
        examData = JSON.parse(results.body);
        document.getElementById('testName').innerHTML += examData.examNumber;
        document.getElementById('submitTime').innerHTML += examData.submittedAt;

        console.log('Succsefully read exam data from database: ', results);
    }
    
    // Register click handler for form submit button
    $(function onDocReady() {
        getExamResults(getUrlParameter('exam_uuid='));

        $('#signOut').click(function() {
            WildRydes.signOut();
            alert("You have been signed out.");
            window.location = "signin.html";
        });

    });

}(jQuery));


