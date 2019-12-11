<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopMenu.ascx.cs" Inherits="TopMenu" %>

<!-- This is the user component Login -->

<asp:UpdatePanel ID="topMenuUpdatePanel" runat="server">
    <ContentTemplate>
        <nav class="uk-navbar-container " uk-navbar>
            <div class="uk-navbar-left">
                <a class="uk-navbar-item uk-logo" href="/Default.aspx">Scrape</a>
            </div>
            <div class="uk-navbar-center">
                <ul class="uk-navbar-nav">
                    <li>
                        <a href="#">About us</a>
                    </li>
                    <li>
                        <a href="#">Public Galleries</a>
                        <div class="uk-navbar-dropdown uk-navbar-dropdown-width-2">
                            <div class="uk-navbar-dropdown-grid uk-child-width-1-2" uk-grid>
                                <div>
                                    <ul class="uk-nav uk-navbar-dropdown-nav">
                                        <li class="uk-nav-header">Browse by popular tag:</li>
                                        <li class="uk-nav-divider"></li>
                                        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: thumbnails"></span>Tag 1</a></li>
                                        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: thumbnails"></span>Tag 2</a></li>
                                        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: thumbnails"></span>Tag 3</a></li>
                                    </ul>
                                </div>
                                <div>
                                    <ul class="uk-nav uk-navbar-dropdown-nav">
                                        <li class="uk-nav-header">Browse all:</li>
                                        <li class="uk-nav-divider"></li>
                                        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: table"></span>By date</a></li>
                                        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: table"></span>Alphabetically</a></li>
                                        <li><a href="#"><span class="uk-margin-small-right" uk-icon="icon: table"></span>Random</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li id="userGalleries" runat="server">
                        <a href="/UserGallery.aspx">Your Galleries</a>
                        <div class="uk-navbar-dropdown uk-navbar-dropdown-width-2">
                            <div class="uk-navbar-dropdown-grid uk-child-width-1-1" uk-grid>
                                <div>
                                    <ul class="uk-nav uk-navbar-dropdown-nav">
                                        <li class="uk-nav-header">User Galleries:</li>
                                        <li class="uk-nav-divider"></li>
                                        <li><a href="/UserGallery.aspx"><span class="uk-margin-small-right" uk-icon="icon: thumbnails"></span>Browse Your Pictures/Galleries</a></li>
                                        <li><a href="/DeepZoom.aspx"><span class="uk-margin-small-right" uk-icon="icon: thumbnails"></span>View Your DeepZoom images</a></li>
                                        <li><a href="/UploadPicture.aspx"><span class="uk-margin-small-right" uk-icon="icon: thumbnails"></span>Upload Pictures</a></li>
                                        <li><a href="/DeepZoomUpload.aspx"><span class="uk-margin-small-right" uk-icon="icon: thumbnails"></span>Upload DeepZoom image</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>

            </div>
            <div class="uk-navbar-right" id="loginItem" runat="server">

                <!-- This links to the Login user Component, which should be used in 
          conjuction with this user component. -->
                <ul class="uk-navbar-nav">
                    <li>
                        <a href="#loginUserModal" uk-toggle>Login</a>
                    </li>
                </ul>

            </div>
            <div class="uk-navbar-right uk-margin-right-small" id="accountItem" runat="server">
                <ul class="uk-navbar-nav">
                    <li>
                        <a href="#">Account</a>
                        <div class="uk-navbar-dropdown uk-navbar-dropdown-width-2">
                            <div class="uk-navbar-dropdown-grid uk-child-width-1-1" uk-grid>
                                <div>
                                    <ul class="uk-nav uk-navbar-dropdown-nav">
                                        <li class="uk-nav-header"><a href="#" onserverclick="logOut" runat="server">Log out</a></li>
                                        <li class="uk-nav-divider"></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <hr class="uk-grid-divider uk-margin-remove-top" />
    </ContentTemplate>
</asp:UpdatePanel>
