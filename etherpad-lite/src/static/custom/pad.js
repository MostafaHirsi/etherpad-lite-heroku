function customStart()
{
  //define your javascript here
  //jquery is available - except index.js
  //you can load extra scripts with $.getScript http://api.jquery.com/jQuery.getScript/
  //   var buttonIcons = $(".menu_left>li>a").not("li.separator")
  //
    $('.commenticon')
        .addClass('buttonicon');

    var element = document.getElementById('font-family').parentElement;
    element.style.display = 'inline-flex';
    element.style.padding = '12px';
    console.log(element.nodeName, element);

    var element = document.getElementById('font-color');
    element.style.display = 'inline-flex';
    element.style.padding = '12px';
    console.log(element.nodeName, element);

    var element = document.getElementById('font-size');
    element.style.width = '80px';
    console.log(element.nodeName, element);

    var firstLineNo = $("#sidedivinner > :first-child");
    console.log('firstLineNo',firstLineNo);
    var firstLine = $("#innerdocbody").children();
    $("#innerdocbody").each(function( index ) {
        console.log( index + ": " + $( this ).text() );
    });



    if($('body').hasClass("readonly"))
    {
        document.getElementById('editBar').display = 'none';
    }
    // [0].contentWindow.document.body;
    var textEditor = $('#editorcontainer > :first-child');
    textEditor.onmouseup = function(){
        console.log("TESTING");
    };
    textEditor.onkeyup = doSomethingWithSelectedText;
    textEditor.ready(function() {
        $("#sidedivinner").click = function(){
            console.log("TESTING21321321");
        };
    });
}


function getSelectedText() {
    var text = "";
    if (typeof window.getSelection != "undefined") {
        text = window.getSelection().toString();
    } else if (typeof document.selection != "undefined" && document.selection.type == "Text") {
        text = document.selection.createRange().text;
    }
    return text;
}

function doSomethingWithSelectedText() {
    var selectedText = getSelectedText();
    if (selectedText) {
        alert("Got selected text " + selectedText);
    }
}
