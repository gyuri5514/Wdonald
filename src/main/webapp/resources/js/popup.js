function openPopup(url, name, options){
    var form = document.createElement("form");
    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post"); 
    form.setAttribute("action", url);
    form.setAttribute("target", name);

    document.body.appendChild(form);
    window.open('', name, options);
    form.submit()

    document.body.removeChild(form);
}