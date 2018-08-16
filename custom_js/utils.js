var getUrlParameter = function getUrlParameter(sParam) {
  return getUrlData('&',sParam);
}

var getUrlFitbit = function getUrlFitbit(sParam) {
  return getUrlData('#',sParam);
}

var getUrlData = function getUrlData(delim, sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split(delim),
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


function readISODateString(d) {
  return (new Date(d)).toString();
}
