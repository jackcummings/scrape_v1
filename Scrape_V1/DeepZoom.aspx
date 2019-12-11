<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeepZoom.aspx.cs" Inherits="DeepZoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/openseadragon/openseadragon.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class=" uk-width-1-1">
        <label for="dziDDL" class=" uk-label uk-text-center uk-align-center uk-margin-remove-bottom">Available DeepZoom Imagess:</label>
        <asp:dropdownlist cssclass="uk-form-width-large uk-align-center uk-margin-small-top" id="dziDDL" clientidmode="Static" runat="server"></asp:dropdownlist>
    </div>

    <div id="seadragon-viewer" style="width: 800px; height: 600px;"></div>
    <script>
        $(document).ready(function () {
            $("#dziDDL").on("change", function () {
                var period = this.value;
                if (period != "-1") {
                    window.location.href = "DeepZoom.aspx?dziID=" + $("#dziDDL").val();
                }

            });
        });
    </script>
</asp:Content>

