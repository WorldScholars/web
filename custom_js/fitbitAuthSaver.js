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

    function saveFitbitCreds(user_id, token, expiresIn) {
        console.log(user_id);
        console.log(token);
        console.log(expiresIn);

        $.ajax({
            method: 'POST',
            url: _config.api.invokeUrl + '/fitbit/handleauthresponse',
            headers: {
                Authorization: authToken
            },
            data: JSON.stringify({
               //studentId will be present inside the aws lambda call as a result of the authentication we pass in this header
               fitbitUserId: user_id,
               fitbitAuthToken: token,
               fitbitAuthTokenExpiresIn: expiresIn
            }),
            contentType: 'application/json',
            success: completeRequest,
            error: function ajaxError(jqXHR, textStatus, errorThrown) {
                console.error('Error saving fitbit credentials to database: ', textStatus, ', Details: ', errorThrown);
                console.error('Response: ', jqXHR.responseText);
                alert('An error occured when authorizing Fitbit access. Please try again.');
            }
        });
    }

    function completeRequest(result) {
        console.log('Succsefully saved fitbit credentials to database: ', result);
        window.location.href = "/profile.html";
    }
    
    // Register click handler for form submit button
    $(function onDocReady() {
        if(window.location.pathname=="/fitbit_auth.html"){
          saveFitbitCreds (getUrlFitbit('user_id'), getUrlFitbit('access_token'), getUrlFitbit('expires_in'));
        }

    });

}(jQuery));


