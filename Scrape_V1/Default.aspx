<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="mainPageContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="mainUpdatePanel" runat="server">
        <ContentTemplate>

            <div id="js-lightbox-animation" class="uk-child-width-1-5@m" uk-grid uk-lightbox>
                <div>

                    <a class="uk-inline uk-panel uk-link-muted uk-text-center" href="https://picsum.photos/640/480" caption="640x480" data-alt="The value for the image alt attribute">
                        <figure>
                            <img src="https://picsum.photos/400" width="400" alt="">
                            <figcaption class="uk-margin-small-top">640x480</figcaption>
                        </figure>
                    </a>

                </div>
                <div>

                    <a class="uk-inline uk-panel uk-link-muted uk-text-center" href="https://picsum.photos/700/500.jpg" caption="700x500">
                        <figure>
                            <img src="https://picsum.photos/400" width="400" alt="">
                            <figcaption class="uk-margin-small-top">700x500</figcaption>
                        </figure>
                    </a>

                </div>
                <div>

                    <a class="uk-inline uk-panel uk-link-muted uk-text-center" href="https://picsum.photos/180/120" caption="180x120">
                        <figure>
                            <img src="https://picsum.photos/400" width="400" alt="">
                            <figcaption class="uk-margin-small-top">180x120</figcaption>
                        </figure>
                    </a>

                </div>
                <div>

                    <a class="uk-inline uk-panel uk-link-muted uk-text-center" href="https://picsum.photos/720/480" caption="720x480">
                        <figure>
                            <img src="https://picsum.photos/400" width="400" alt="">
                            <figcaption class="uk-margin-small-top">720x480</figcaption>
                        </figure>
                    </a>

                </div>
                <div>

                    <a class="uk-inline uk-panel uk-link-muted uk-text-center" href="https://picsum.photos/500" caption="500x500">
                        <figure>
                            <img src="https://picsum.photos/400" width="400" alt="">
                            <figcaption class="uk-margin-small-top">500x500</figcaption>
                        </figure>
                    </a>

                </div>
            </div>

            <h2>Content Sources</h2>

            <div class="uk-child-width-1-5@m" uk-grid uk-lightbox>
                <div>

                    <a class="uk-inline uk-panel uk-link-muted uk-text-center" href="https://picsum.photos/1.jpg" caption="Image">
                        <figure>
                            <img src="https://picsum.photos/400" width="400" alt="">
                            <figcaption class="uk-margin-small-top">Image</figcaption>
                        </figure>
                    </a>

                </div>
                <div>

                    <a class="uk-inline uk-panel uk-link-muted uk-text-center" href="https://yootheme.com/site/images/media/yootheme-pro.mp4" caption="Video" poster="https://picsum.photos/400">
                        <figure>
                            <img src="https://picsum.photos/400" width="400" alt="">
                            <figcaption class="uk-margin-small-top">Video</figcaption>
                        </figure>
                    </a>

                </div>
                <div>

                    <a class="uk-inline uk-panel uk-link-muted uk-text-center" href="https://www.youtube-nocookie.com/watch?v=c2pz2mlSfXA" caption="YouTube">
                        <figure>
                            <img src="https://picsum.photos/400" width="400" alt="">
                            <figcaption class="uk-margin-small-top">YouTube</figcaption>
                        </figure>
                    </a>

                </div>
                <div>

                    <a class="uk-inline uk-panel uk-link-muted uk-text-center" href="https://vimeo.com/1084537" caption="Vimeo">
                        <figure>
                            <img src="https://picsum.photos/400" width="400" alt="">
                            <figcaption class="uk-margin-small-top">Vimeo</figcaption>
                        </figure>
                    </a>

                </div>
                <div>

                    <a class="uk-inline uk-panel uk-link-muted uk-text-center" href="https://google.com/maps/embed?pb=!1m18!1m12!1m3!1d4740.819266853735!2d9.99008871708242!3d53.550454675412404!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x3f9d24afe84a0263!2sRathaus!5e0!3m2!1sde!2sde!4v1499675200938" caption="Iframe" type="iframe">
                        <figure>
                            <img src="https://picsum.photos/400" width="400" alt="">
                            <figcaption class="uk-margin-small-top">Iframe</figcaption>
                        </figure>
                    </a>

                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
