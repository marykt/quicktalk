.pragma library
var Component_Ready =1;

function  createxx(file,parent)
{
    var component = Qt.createComponent(file);
    if (component.status == Component_Ready) {
        var button = component.createObject(parent);
        return  button;
    }

    return null;
}
function readValues(anArray) {
    for (var i=0; i<anArray.length; i++)
        console.log("Array item:", anArray[i])


}
