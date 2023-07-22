//Open or close menu
let btn = document.querySelector('#btn');
let sidebar = document.querySelector('.sidebar');

btn.onclick = function(){
    sidebar.classList.toggle('active');
}

//Scroll de la sección  de Listado de mensajes
var objDiv = document.getElementById("contenedor-principal");
objDiv.scrollTop = objDiv.scrollHeight;

