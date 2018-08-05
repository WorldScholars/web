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
            url: _config.api.invokeUrl + '/examget?id=' + examIdfromUrl,
            headers: {
                Authorization: authToken
            },
            contentType: 'application/json',
            success: completeRequest,
            error: function ajaxError(jqXHR, textStatus, errorThrown) {
                console.error('Error reading exam from database: ', textStatus, ', Details: ', errorThrown);
                console.error('Response: ', jqXHR.responseText);
                alert('An error occured when reading your exam:\n' + jqXHR.responseText);
            }
        });
    }

    function completeRequest(results) {
        examData = results;
        console.log(examData);
        document.getElementById('testName').innerHTML += examData.ExamNumber;
        document.getElementById('submissionTime').innerHTML += readISODateString(examData.submitTime);
        examData.Answers.forEach(function(ans){
          //TODO hardcoding parsing of section and question, this should just be in the json object
          sectionNum = ans.name[2];
          questionNum = ans.name.substring(6);
          slash = "/";
          if (ans.value!="0.00"){
            newRow = ('<tr><td>' + sectionNum + '<'+slash+'td><td>' + questionNum + '<'+slash+'td><td>' + ans.value + '<'+slash+'td><'+slash+'tr>');
            $('tbody').append(newRow);
          }
        });

        console.log('Succsefully read exam data from database: ', results);
    }
    
    // Register click handler for form submit button
    $(function onDocReady() {
        if(window.location.pathname=="/examsummary.html"){
            getExamResults(getUrlParameter('id'));
        }

        $('#signOut').click(function() {
            WildRydes.signOut();
            alert("You have been signed out.");
            window.location = "signin.html";
        });

    });

}(jQuery));


