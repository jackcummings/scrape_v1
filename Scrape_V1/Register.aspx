<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="registerUpdatePanel" runat="server">
        <ContentTemplate>

            <div class="uk-grid uk-margin-auto-left uk-margin-medium-right">
                <div class="uk-width-1-1">
                    <div class="uk-text-center uk-heading-small">Register a new account</div>
                    <hr class="uk-grid-divider uk-margin-bottom">
                </div>
                <div class="uk-width-1-2">
                    <div>
                        <fieldset class="uk-fieldset">
                            <div class="uk-margin">
                                <label class="uk-form-label" for="first_name_text">First name:</label>
                                <input class="uk-input" type="text" id="first_name_text" ClientIDMode="Static" placeholder="" runat="server" />
                            </div>

                            <div class="uk-margin">
                                <label class="uk-form-label" for="last_name_text">Last name:</label>
                                <input class="uk-input" type="text" id="last_name_text" ClientIDMode="Static" placeholder="" runat="server" />
                            </div>

                            <div class="uk-margin">
                                <label class="uk-form-label" for="email_text">E-mail Address:</label>
                                <input class="uk-input" type="text" id="email_text" ClientIDMode="Static" placeholder="your@email.com" runat="server" />
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="uk-width-1-2">
                    <div>
                        <fieldset class="uk-fieldset">

                            <div class="uk-margin">
                                <label class="uk-form-label" for="username_text">Username:</label>
                                <asp:TextBox CssClass="uk-input" ClientIDMode="Static" ID="username_text" runat="server" />
                            </div>

                            <div class="uk-margin">
                                <label class="uk-form-label" for="password_text">Password:</label>
                                <input class="uk-input" type="password" ClientIDMode="Static" id="password_text" placeholder="At least 5 characters" runat="server" />
                            </div>

                        </fieldset>
                    </div>

                </div>
                <div class="uk-width-1-1 uk-align-center uk-text-center">
                    <asp:Button ID="registerSubmitBtn" ClientIDMode="Static" CssClass="uk-button uk-form-width-large uk-button-primary" runat="server" Text="Submit" OnClick="registerSubmitBtn_Click"></asp:Button>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script>
        $(document).ready(function () {
            $("#registerSubmitBtn").click(function () {
                showError = false;
                errorMsg = "";

                if ($('#first_name_text').val().length == 0) {
                    errorMsg += "Please enter your first name!<br />";
                    showError = true;
                }

                if ($('#last_name_text').val().length == 0) {
                    errorMsg += "Please enter your last name!<br />";
                    showError = true;
                }

                if ($('#email_text').val().length == 0) {
                    errorMsg += "Please enter a email address!<br />";
                    showError = true;
                }

                if ($('#username_text').val().length == 0) {
                    errorMsg += "Please enter a username!<br />";
                    showError = true;
                }

                if ($('#password_text').val().length < 5) {
                    errorMsg += "Please enter a password at least 5 characters long!<br />";
                    showError = true;
                }

                if (showError == true) {
                    UIkit.notification(errorMsg);
                    return false;

                }
            });
        });

    </script>
</asp:Content>

