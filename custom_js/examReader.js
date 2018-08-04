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

        $.ajax({
            method: 'GET',
            url: _config.api.invokeUrl + '/examget',
            headers: {
                Authorization: authToken
            },
            contentType: 'application/json',
            success: completeRequest,
            error: function ajaxError(jqXHR, textStatus, errorThrown) {
                console.error('Error reading exam to database: ', textStatus, ', Details: ', errorThrown);
                console.error('Response: ', jqXHR.responseText);
                alert('An error occured when reading your exam:\n' + jqXHR.responseText);
            }
        });
    }

    function completeRequest(results) {
        document.getElementById('testName').innerHTML += results.examNumber;
        document.getElementById('submitTime').innerHTML += results.submittedAt;

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


