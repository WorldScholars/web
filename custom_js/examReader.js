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
        document.getElementById('testName').innerHTML += examData.ExamNumber;
        document.getElementById('submissionTime').innerHTML += readISODateString(examData.submitTime);
        var incorrectByCategory = {};
        examData.Answers.forEach(function(ans){
          //TODO hardcoding parsing of section and question, this should just be in the json object
          sectionNum = ans.name[2];
          questionNum = ans.name.substring(6);
          slash = "/";
          var bgColor;
          if (ans.value==ans.correctAnswer) {
            bgColor = 'springgreen';
          }
          else {
            bgColor = '#fb7a4a';
            incorrectByCategory[ans.questionType] = (incorrectByCategory[ans.questionType || 0) + 1;
          }
          newRow  = '<tr style=\"background-color:' + bgColor + '\">';
          newRow += '<td>' + sectionNum + '<'+slash+'td>';
          newRow += '<td>' + questionNum + '<'+slash+'td>';
          newRow += '<td>' + ans.value + '<'+slash+'td>';
          newRow += '<td>' + ans.correctAnswer + '<'+slash+'td>';
          newRow += '<td>' + ans.questionType + '<'+slash+'td>';
          newRow += '<'+slash+'tr>';
          $('tbody').append(newRow);
        });

        document.getElementById('summary').innertHTML += incorrectByCategory.toString();
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


