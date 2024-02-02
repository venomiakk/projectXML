var validationMsgField = document.getElementById("validation-msg");

// pobieranie tekstu i zamiana encji
function encodeXML(id) {
  var txtarea = document.createElement("textarea");
  txtarea = document.getElementById(id).innerText;
  txtarea = txtarea.substring(txtarea.indexOf("\n") + 1);
  validationMsgField.innerHTML = "Test";
  validateXML(txtarea);
}

var xt = "",
  h3OK = 1;

function checkErrorXML(x) {
  xt = "";
  h3OK = 1;
  checkXML(x);
}

function checkXML(n) {
  var l, i, nam;
  nam = n.nodeName;
  if (nam == "h3") {
    if (h3OK == 0) {
      return;
    }
    h3OK = 0;
  }
  if (nam == "#text") {
    xt = xt + n.nodeValue + "\n";
  }
  l = n.childNodes.length;
  for (i = 0; i < l; i++) {
    checkXML(n.childNodes[i]);
  }
}

function validateXML(txt) {
  // code for IE
  if (window.ActiveXObject) {
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = false;
    xmlDoc.loadXML(txt);
    if (xmlDoc.parseError.errorCode != 0) {
      txt = "Error Code: " + xmlDoc.parseError.errorCode + "\n";
      txt = txt + "Error Reason: " + xmlDoc.parseError.reason;
      txt = txt + "Error Line: " + xmlDoc.parseError.line;
      // alert(txt);
      validationMsgField.innerHTML = txt;
    } else {
      // alert("No errors found");
      validationMsgField.innerHTML = "No errors found";
    }
  }
  // code for Mozilla, Firefox, Opera, etc.
  else if (document.implementation.createDocument) {
    try {
      var text = txt;
      var parser = new DOMParser();
      var xmlDoc = parser.parseFromString(text, "application/xml");
    } catch (err) {
      alert(err.message);
    }

    if (xmlDoc.getElementsByTagName("parsererror").length > 0) {
      checkErrorXML(xmlDoc.getElementsByTagName("parsererror")[0]);
      // alert(xt);
      validationMsgField.innerHTML = xt;
    } else {
      // alert("No errors found");
      validationMsgField.innerHTML = "No errors found";
    }
  } else {
    // alert("Your browser cannot handle XML validation");
    validationMsgField.innerHTML = "Your browser cannot handle XML validation";
  }
}
