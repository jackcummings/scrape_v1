<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="Login" %>


<link href="/css/Login.css" rel="stylesheet" />

<asp:UpdatePanel ID="loginUpdatePanel" runat="server">
    <ContentTemplate>

        <div id="loginUserModal" uk-modal="container: false">
            <div class="uk-modal-dialog uk-modal-dialog-lightbox">
                <button class="uk-modal-close-default" type="button" uk-close></button>

                <div id="loginWrapper">
                    <div id="loginFormContent">
                        <!-- Tabs Titles -->

                        <!-- Icon -->
                        <div class="fadeIn first">
                            <img src="img/login/login_header.png" class="loginHeader" id="icon" alt="User Icon" />
                        </div>

                        <!-- Login Form -->
                        <div class="regularInputContent">
                            <div class="uk-width-1-1 uk-padding">
                                <asp:TextBox ID="username" CssClass="uk-input fadeIn second" placeholder="Username" runat="server"></asp:TextBox>
                                <hr class="fadeIn second" />
                                <asp:TextBox TextMode="Password" ID="password" CssClass="uk-input fadeIn third" placeholder="Password (at least 5 characters)" runat="server"></asp:TextBox>
                            </div>
                            <input type="button" id="loginButton" class="fadeIn fourth" runat="server" onServerClick="loginButton_Click" value="Log in " />
                        </div>

                        <!-- Remind Passowrd -->
                        <div id="formFooter">
                            <a class="underlineHover" href="#">Forgot Password?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
