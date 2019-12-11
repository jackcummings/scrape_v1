<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserGallery.aspx.cs" Inherits="UserGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Core CSS file -->
    <link rel="stylesheet" href="/css/photoswipe.css">

    <!-- Skin CSS file (styling of UI - buttons, caption, etc.)
     In the folder of skin CSS file there are also:
     - .png and .svg icons sprite, 
     - preloader.gif (for browsers that do not support CSS animations) -->
    <link rel="stylesheet" href="/css/default-skin/default-skin.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="userGalleryUpdatePanel" runat="server">
        <ContentTemplate>

            <div class="uk-h1 uk-text-center">Galleries</div>

            <div class=" uk-width-1-1">
                <label for="galleryDDL" class=" uk-label uk-text-center uk-align-center uk-margin-remove-bottom">Available galleries:</label>
                <asp:DropDownList CssClass="uk-form-width-large uk-align-center uk-margin-small-top" ID="galleryDDL" ClientIDMode="Static" runat="server"></asp:DropDownList>
            </div>
            <!-- Galley wrapper that contains all items -->
            <div id="gallery" class="gallery uk-child-width-1-4 uk-grid" itemscope itemtype="http://schema.org/ImageGallery" runat="server">
            </div>
            <!-- Root element of PhotoSwipe. Must have class pswp. -->
            <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

                <!-- Background of PhotoSwipe. 
         It's a separate element as animating opacity is faster than rgba(). -->
                <div class="pswp__bg"></div>

                <!-- Slides wrapper with overflow:hidden. -->
                <div class="pswp__scroll-wrap">

                    <!-- Container that holds slides. 
            PhotoSwipe keeps only 3 of them in the DOM to save memory.
            Don't modify these 3 pswp__item elements, data is added later on. -->
                    <div class="pswp__container">
                        <div class="pswp__item"></div>
                        <div class="pswp__item"></div>
                        <div class="pswp__item"></div>
                    </div>

                    <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
                    <div class="pswp__ui pswp__ui--hidden">

                        <div class="pswp__top-bar">

                            <!--  Controls are self-explanatory. Order can be changed. -->

                            <div class="pswp__counter"></div>

                            <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>

                            <button class="pswp__button pswp__button--share" title="Share"></button>


                            <button type="button" class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>

                            <!-- Preloader demo https://codepen.io/dimsemenov/pen/yyBWoR -->
                            <!-- element will get class pswp__preloader--active when preloader is running -->
                            <div class="pswp__preloader">
                                <div class="pswp__preloader__icn">
                                    <div class="pswp__preloader__cut">
                                        <div class="pswp__preloader__donut"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                            <div class="pswp__share-tooltip"></div>
                        </div>

                        <button type="button" class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)">
                        </button>

                        <button type="button" class="pswp__button pswp__button--arrow--right" title="Next (arrow right)">
                        </button>

                        <div class="pswp__caption">
                            <div class="pswp__caption__center"></div>
                        </div>

                    </div>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Core JS file -->
    <script src="/js/photoswipe.min.js"></script>

    <!-- UI JS file -->
    <script src="/js/photoswipe-ui-default.min.js"></script>

    <script>
        /* global jQuery, PhotoSwipe, PhotoSwipeUI_Default, console */

        document.picContainer = [];
        (function ($) {

            // Init empty gallery array

            // Loop over gallery items and push it to the array
            $('#gallery').find('figure').each(function () {
                var $link = $(this).find('a'),
                    item = {
                        src: $link.attr('href'),
                        w: $link.data('width'),
                        h: $link.data('height'),
                        title: $link.data('caption')
                    };
                document.picContainer.push(item);
            });



        }(jQuery));

        var bindClick = function () {
            // Define click event on gallery item
            // I have NO idea why this works --v
            $('.pic_link').unbind('click').click(function (event) {

                // Prevent location change
                event.preventDefault();

                // Define object and gallery options
                var $pswp = $('.pswp')[0],
                    options = {
                        index: $(this).parent('figure').index(),
                        bgOpacity: 0.85,
                        showHideOpacity: true
                    };

                // Initialize PhotoSwipe
                var gallery = new PhotoSwipe($pswp, PhotoSwipeUI_Default, document.picContainer, options);
                gallery.init();
            });
        }

        $(document).ready(function () {
            $("#galleryDDL").on("change", function () {
                var period = this.value;
                if (period != "-1") {
                    window.location.href = "UserGallery.aspx?galleryID=" + $("#galleryDDL").val();
                }

            });
        });

    </script>
</asp:Content>

