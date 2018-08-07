
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

    function wrongBySec(oneExam) {
          slash = "/";
          newRow = ('<tr><td>' + oneExam.studentId+ '<'+slash+'td>' +
                    '<td>' + oneExam.Section_1 + '<'+slash+'td>'+
                    '<td>' + oneExam.Section_2 + '<'+slash+'td>'+
                    '<td>' + oneExam.Section_3 + '<'+slash+'td>'+
                    '<td>' + oneExam.Section_4 + '<'+slash+'td>'+
                    '<'+slash+'tr>');
          $('tbody').append(newRow);
    }

    function makeGeneralTable(data,headers) {
        var myTable = '<table><tr>'
        headers.forEach(function(header) {
            myTable += '<td>' + header + '<'+slash+'td>'
        });
        myTable += '<'+slash+'tr>'+'<tr>'
        headers.forEach(function(header) {
            myTable += '<td>' + data[header] + '<'+slash+'td>'
        });
        myTable += '<'+slash+'tr>'+'<'+slash+'table><hr>';
        document.getElementById('tables').innerHTML += myTable
    }

    function examSummaryInHtml(data) {
        data.allSummaries.forEach(wrongBySec);
        wrongBySec(data.fullSummary);
        
        var sortedKeys = Object.keys(data.fullSummary).sort(function(a,b){return data.fullSummary[a] - data.fullSummary[b]}
        var qTypes = sortedKeys.filter(k => (!k.startsWith("Section")) && (!k.startsWith("s_")));
        var qNames1 = sortedKeys.filter(k => k.startsWith("s_1"));
        var qNames2 = sortedKeys.filter(k => k.startsWith("s_2"));
        var qNames3 = sortedKeys.filter(k => k.startsWith("s_3"));
        var qNames4 = sortedKeys.filter(k => k.startsWith("s_4"));

        makeGeneralTable(data.fullSummary,qTypes);
        makeGeneralTable(data.fullSummary,qNames1);
        makeGeneralTable(data.fullSummary,qNames2);
        makeGeneralTable(data.fullSummary,qNames3);
        makeGeneralTable(data.fullSummary,qNames4);
    }

    $(function onDocReady() {
        var useremail = WorldScholars.user.username;
        if (window.location.pathname=="/teacherPortal.html" 
            //this is so insecure its not even funny, move this to server side
            && useremail.endsWith("-at-worldscholars.global")){
          document.getElementById('teacherWelcome').innerHTML += useremail;
          document.getElementById('whichExam').innerHTML += getUrlParameter('examNum');
          getExamSummary()
        }

    });

}(jQuery));