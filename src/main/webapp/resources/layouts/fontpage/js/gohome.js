var keytop = 0;
var keyleft = 0;

function gonextprepage(valuepage)
{
    var contain = $("#contain").offset().top;
    var start = $("#draggable").offset().top;

    curentpage = 0;

    i = 1;
    while (gde("page" + i) != null)
    {
        var page = $("#page"+i).offset().top;

        if(page > (contain - 100) && curentpage == 0)
        {
            curentpage = i;
        }
        i++;
    }

    i--;

    gotopage = curentpage + valuepage;

    if(gotopage < 1)
    {
        gotopage = 1;
    }

    if(gotopage > i)
    {
        gotopage = i;
    }

    var page = $("#page"+gotopage).offset().top;
    goto = page - start;
    $("div#contain").scrollTop(goto);
}

function goonpage(i)
{
    var start = $("#draggable").offset().top;
    var page = $("#page"+i).offset().top;

    goto = page - start;

    $("div#contain").scrollTop(goto);
}

function InitDragDrop()
{
    document.onmousedown = OnMouseDown;
    document.onmouseup = OnMouseUp;
}

function OnMouseDown(e)
{
    if (e == null) var e = window.event;

    var target = e.target != null ? e.target : e.srcElement;
    if ((e.button == 1 && window.event != null || e.button == 0) && (target.nodeName == 'IMG'))
    {
        x = e.clientX;
        y = e.clientY;
        keytop = y;
        keyleft = x;

        document.onmousemove = OnMouseMove;
        document.onselectstart = function () { return false; };
        target.ondragstart = function() { return false; };
        return false;
    }
}

function OnMouseUp()
{
    document.onmousemove = null;
    document.onselectstart = null;
}

function OnMouseMove(e)
{
    if (e == null)
        var e = window.event;

    x = e.clientX;
    y = e.clientY;

    totop = keytop - y;
    toleft = keyleft - x;

    keytop = y;
    keyleft = x;

    scrolltop = $("div#contain").scrollTop() + totop;
    scrollleft = $("div#contain").scrollLeft() + toleft;

    $("div#contain").scrollTop(scrolltop);
    $("div#contain").scrollLeft(scrollleft);
}

InitDragDrop();