var getUrlParameter = function getUrlParameter(sParam) {
  sPageURL = decodeURIComponent(window.location.search.substring(1));
  return getUrlData(sParam,sPageURL);
}

var getUrlFitbit = function getUrlFitbit(sParam) {
  sPageURL = decodeURIComponent(window.location.hash.substring(1));
  return getUrlData(sParam,sPageURL);
}

var getUrlData = function getUrlData(sParam,sPageURL) {
    var sURLVariables = sPageURL.split('&'),
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
