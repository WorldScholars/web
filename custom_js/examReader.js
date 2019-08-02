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
        var correctBySection = {};
        examData.Answers.forEach(function(ans){
          //TODO hardcoding parsing of section and question, this should just be in the json object
          sectionNum = ans.name[2];
          questionNum = ans.name.substring(6);
          slash = "/";
          var bgColor;
          if (ans.value == ans.correctAnswer ||
              (ans.correctAnswer.includes(",") && ans.correctAnswer.includes(ans.value)) || 
              (ans.correctAnswer.includes("OR") && ans.correctAnswer.includes(ans.value)) 
             ) {
            bgColor = 'springgreen';
            correctBySection[sectionNum] = (correctBySection[sectionNum] || 0) + 1; 
          }
          else {
            bgColor = '#fb7a4a';
            incorrectByCategory[ans.questionType] = (incorrectByCategory[ans.questionType] || 0) + 1;
          }
          var sectionName;
          switch (sectionNum) {
            case "1":
              sectionName = "Reading";
              break;
            case "2":
              sectionName = "Writing and Language";
              break;
            case "3":
              sectionName = "Math (no calculator)";
              break;
            case "4":
              sectionName = "Math (calculator)";
              break;
            default: 
              sectionName = "Section "+sectionNum;
          }

          newRow  = '<tr style=\"background-color:' + bgColor + '\">';
          newRow += '<td>' + sectionName + '<'+slash+'td>';
          newRow += '<td>' + questionNum + '<'+slash+'td>';
          newRow += '<td>' + ans.value + '<'+slash+'td>';
          newRow += '<td>' + ans.correctAnswer + '<'+slash+'td>';
          newRow += '<td>' + ans.questionType + '<'+slash+'td>';
          newRow += '<'+slash+'tr>';
          $('tbody').append(newRow);
        });

        /*finalScore = score(
                      correctBySection["3"] + correctBySection["4"] || 0,
                      correctBySection["1"] || 0, correctBySection["2"] || 0)*/
        finalScore = score(
                      58, 52, 44)


        if (examData.ExamNumber == 3) {
           finalScore.mathScaled = Math.min(800, finalScore.mathScaled + 40)
           finalScore.writingScaled = Math.min(400, finalScore.writingScaled + 20)
           finalScore.readingScaled = Math.min(400, finalScore.readingScaled + 20)
        }

        document.getElementById('totalScore').innerHTML += (finalScore.total)+ '';
        document.getElementById('math').innerHTML += 
          "Math Score: " + (finalScore.mathScaled) // + " | Percentile: " + (finalScore.mathPercentile) + "%";
        document.getElementById('reading').innerHTML += 
          "Reading Score: " + (finalScore.readingScaled) //+ " | Percentile: " + (finalScore.readingPercentile) + "%";
        document.getElementById('writing').innerHTML += 
          "Writing score: " + (finalScore.writingScaled) //+ " | Percentile: " + (finalScore.writingPercentile) + "%";

        var incorrectSorted = [];
        console.log(incorrectByCategory)
        for (var category in incorrectByCategory) {
            incorrectSorted.push([category, incorrectByCategory[category]]);
        }

        console.log(incorrectSorted)
        incorrectSorted.sort(function(a, b) {
          return b[1] - a[1];
        });
        
        console.log(incorrectSorted)
        for (var category in incorrectSorted) {
          document.getElementById('summary').innerHTML += incorrectSorted[category][0] + ": " + incorrectSorted[category][1] + "<br>"
        }

        console.log('Succsefully read exam data from database: ', results);
    }
    
    // Register click handler for form submit button
    $(function onDocReady() {
        if(window.location.pathname=="/examsummary.html"){
            getExamResults(getUrlParameter('id'));
        }


    });

}(jQuery));


