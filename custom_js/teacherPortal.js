
var WorldScholars = window.WorldScholars || {};
WorldScholars.map = WorldScholars.map || {};

(function profileScopeWrapper($) {
    var authToken;
    WorldScholars.authToken.then(function setAuthToken(token) {
        if (token) {
            authToken = token;
        } else {
            if (window.location.pathname != "/signin.html" && 
                window.location.pathname != "/signup.html" && 
                window.location.pathname != "/verify.html" && 
                window.location.origin != "file://"){
                window.location.href = '/signin.html';
            }
        }
    }).catch(function handleTokenError(error) {
        alert(error);
        window.location.href = '/signin.html';
    });

    function getExamSummary() {

        $.ajax({
            method: 'GET',
            url: _config.api.invokeUrl + '/teacher/examallsummary?examNum='+getUrlParameter('examNum'),
            headers: {
                Authorization: authToken
            },
            contentType: 'application/json',
            success: examSummaryInHtml,
            error: function ajaxError(jqXHR, textStatus, errorThrown) {
                console.error('Error reading exams from database: ', textStatus, ', Details: ', errorThrown);
                console.error('Response: ', jqXHR.responseText);
                alert('An error occured when reading your exam\n' + jqXHR.responseText);
            }
        });
    }

    function examSummaryInHtml(data) {
      console.log(data);
        data.allSummaries.forEach(function(oneExam){
          slash = "/";
          newRow = ('<tr><td>' + oneExam.StudentId+ '<'+slash+'td>' +
                    '<td>' + oneExam.Section_1 + '<'+slash+'td>'+
                    '<td>' + oneExam.Section_2 + '<'+slash+'td>'+
                    '<td>' + oneExam.Section_3 + '<'+slash+'td>'+
                    '<td>' + oneExam.Section_4 + '<'+slash+'td>'+
                    '<'+slash+'tr>');
          $('tbody').append(newRow);
        });
        //data.fullSummary


    }

    $(function onDocReady() {
        var useremail = WorldScholars.user.username;
        if (window.location.pathname=="/teacherPortal.html" 
            //this is so insecure its not even funny, move this to server side
            && useremail.endsWith("-at-worldscholars.global")){
          document.getElementById('teacherWelcome').innertHTML += useremail;
          document.getElementById('whichExam').innertHTML += getUrlParameter('examNum');
          getExamSummary()
        }

    });

}(jQuery));
