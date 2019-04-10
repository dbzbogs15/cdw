<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="mainbaner">
    <link rel="stylesheet" href="/resources/layouts/fontpage/css/jquery.bxslider.css" type="text/css"/>
    <script type="text/javascript" src="/resources/layouts/fontpage/js/jquery.bxslider.js"></script>
    <div id="slider-wrapper">
        <ul class="bxslider">
            <li>
                <a href="/resources/banners/view/122/doc-gia.html" target="_self">
                    <img height="397"
                         src="/resources/stores/banners/doc-gia-2019.jpg"
                         title="độc giả">
                </a>
            </li>
            <li>
                <a href="/resources/banners/view/121/sci-tap-4.html" target="_self">
                    <img height="397"
                         src="/resources/stores/banners/sci-tap-4.jpg"
                         title="sci tap 4">
                </a>
            </li>
            <li>
                <a href="/resources/banners/view/120/artmis.html"
                   target="_self">
                    <img height="397"
                         src="/resources/stores/banners/atta.jpg"
                         title="artmis">
                </a>
            </li>
            <li>
                <a href="/resources/banners/view/119/luc-xu.html" target="_self">
                    <img height="397"
                         src="/resources/stores/banners/luc-xu-qc.jpg"
                         title="luc xu">
                </a>
            </li>
            <li>
                <a href="/resources/banners/view/118/thoi-gian-vun-vo.html"
                   target="_self">
                    <img height="397"
                         src="/resources/stores/banners/thoi-gian-vun-vo.jpg"
                         title="Thời Gian Vụn Vỡ">
                </a>
            </li>
            <li>
                <a href="/resources/banners/view/117/song-ngam.html" target="_self">
                    <img height="397"
                         src="/resources/stores/banners/song-ngam.jpg"
                         title="song ngam">
                </a>
            </li>
        </ul>
    </div>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.bxslider').bxSlider({
                auto: true,
                infiniteLoop: true
            });
        });
    </script>
</div>