var onloader = document.getElementsByClassName("onloader");
if(onloader.length > 0){
    for(var i=0;i<onloader.length;i++){
        onloader[i].onclick = onLoading;
    }
}
function onLoading(){
    document.getElementsByClassName("loaderWeb")[0].style.display = 'unset';
}