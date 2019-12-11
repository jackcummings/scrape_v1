<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UploadPicture.aspx.cs" Inherits="UploadPicture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/js/dropzone.js"></script>
    <link href="/css/dropzone.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="uploadPictureUpdatePanel" runat="server">
        <ContentTemplate>
            <div class="uk-grid uk-margin-auto-left uk-margin-medium-right" id="content">
                <div class="uk-width-1-1">
                    <div class="uk-text-center uk-heading-small">Upload new pictures</div>
                    <hr class="uk-grid-divider uk-margin-bottom" />
                </div>
                <div class="uk-width-1-1">
                    <div class="dropzone dropzone-previews" id="my-awesome-dropzone"></div>
                </div>
                <div id="picture_info_container" class="uk-width-1-1">
                    <div id="picture_info_0" class="uk-disabled">
                        <div class="uk-width-1-2">
                            <div class="uk-margin">
                                <label class="uk-form-label" for="picture_name_text" id="picture_name_text_lbl">Name for picture:</label>
                                <asp:TextBox CssClass="uk-input" ID="picture_name_text" ClientIDMode="Static" placeholder="<None>" runat="server" />
                            </div>
                        </div>
                        <div class="uk-width-1-2">
                            <div class="uk-margin">
                                <label class="uk-form-label" for="picture_description_text">Description of picture:</label>
                                <asp:TextBox CssClass="uk-textarea" TextMode="MultiLine" Rows="10" ID="picture_description_text" ClientIDMode="Static" placeholder="<None>" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="uk-width-1-1 uk-margin-small-top">
                    <hr />
                </div>
                <div class="uk-width-1-2">
                    <div class="uk-margin">
                        <asp:DropDownList runat="server" CssClass="uk-width-1-1 uk-dropdown-grid" Style="background-color: darkgoldenrod; padding: 8px;" ID="galleryDDL" ClientIDMode="Static"></asp:DropDownList>
                    </div>

                    <asp:UpdatePanel ID="GalleryCreateUpdatePanel" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <div id="createGalleryModal" uk-modal="container:content ">
                                <div class="uk-modal-dialog" style="width: 80%">
                                    <button class="uk-modal-close-default" type="button" uk-close></button>
                                    <div class="uk-modal-header">
                                        <h2 class="uk-modal-title">Create new Gallery</h2>
                                    </div>
                                    <div class="uk-modal-body">
                                        <asp:HiddenField ID="isPublicGalleryBool" runat="server" Value="0" />
                                        <div class="uk-grid">
                                            <div class="uk-width-1-2">
                                                <label class="uk-form-label" for="gallery_name_text">Gallery name:</label>
                                                <asp:TextBox CssClass="uk-input" ID="galleryNameText" placeholder="" runat="server" />
                                                <div class="uk-margin">
                                                    <label class="uk-form-label" for="tags_text">Tags:</label>
                                                    <asp:TextBox CssClass="uk-input" ID="tags_text" placeholder="<Seperate tags with a space>" runat="server" />
                                                </div>
                                                <div class="uk-align-center">
                                                    <ul class=" uk-nav uk-subnav-pill uk-child-width-1-1" uk-switcher>
                                                        <li><a href="#">Private Gallery</a></li>
                                                        <li><a href="#">Public Gallery</a></li>
                                                    </ul>
                                                    <ul class="uk-switcher" id="isPublicGallery">
                                                        <li></li>
                                                        <li></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="uk-width-1-2">
                                                <label class="uk-form-label" for="gallery_description_text">Description of Gallery:</label>
                                                <asp:TextBox CssClass="uk-textarea" TextMode="MultiLine" Rows="9" ID="gallery_description_text" ClientIDMode="Static" placeholder="<None>" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="uk-modal-footer uk-text-right">

                                        <asp:Button CssClass="uk-button-primary" ID="createGalleryBtn" runat="server" OnClick="createGalleryBtn_Click" Text="Create"></asp:Button>
                                        <asp:Button CssClass="uk-button-danger uk-modal-close" Text="Cancel" runat="server"></asp:Button>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="uk-width-1-1 uk-align-center uk-text-center">

                    <button id="uploadSubmitButton" class="uk-button uk-form-width-large uk-button-primary">Submit</button>


                </div>
            </div>
            <script>
                Dropzone.autoDiscover = false;
                $(document).ready(function () {
                    document.picture_info_count = 0;
                    document.swicher_index = 0;

                    $("#my-awesome-dropzone").dropzone({
                        url: 'hn_FileUpload.ashx',
                        previewsContainer: ".dropzone-previews",
                        uploadMultiple: true,
                        addRemoveLinks: true,
                        autoProcessQueue: false,
                        parallelUploads: 100,
                        maxFiles: 100,

                        // The setting up of the dropzone
                        init: function () {
                            var myDropzone = this;

                            // Submit button handler
                            $("#uploadSubmitButton").click(function (e) {
                                e.preventDefault();
                                e.stopPropagation();
                                myDropzone.processQueue();
                            });

                            this.on("thumbnail", function (file) {
                                console.log(file); // will send to console all available props
                                file.previewElement.addEventListener("click", function () {
                                    //alert(file.form_id);
                                    var nodes = document.getElementById('picture_info_container').childNodes;
                                    for (var i = 0; i < nodes.length; i++) {
                                        if (nodes[i].nodeName.toLowerCase() == 'div') {
                                            nodes[i].style.display = 'none';
                                        }
                                    }

                                    document.getElementById("picture_info_" + file.form_id).style.display = 'block';
                                });
                            });

                            this.on("addedfiles", function (files) {
                                //alert(files.length);
                                for (var i = 0; i < files.length; i++) {
                                    document.picture_info_count++;

                                    // Get the last <li> element ("Milk") of <ul> with id="myList2"
                                    var p_template = document.getElementById("picture_info_0");

                                    // Copy the <li> element and its child nodes
                                    var cln = p_template.cloneNode(true);

                                    cln.classList.remove("uk-disabled");
                                    cln.setAttribute("id", "picture_info_" + document.picture_info_count);
                                    cln.style.display = 'none';
                                    cln.querySelector('#picture_name_text_lbl').innerHTML = "Name for picture #" + document.picture_info_count + ":";
                                    // Append the cloned <li> element to <ul> with id="myList1"
                                    document.getElementById("picture_info_container").appendChild(cln);
                                    files[i].form_id = document.picture_info_count;
                                }
                                console.log(files.length + ' files added');
                            });

                            this.on("removedfile", function (file) {
                                var element = document.getElementById("picture_info_" + file.form_id);
                                element.parentNode.removeChild(element);

                                if (document.getElementById("picture_info_container").childElementCount == 1) {
                                    document.getElementById("picture_info_0").style.display = 'block';
                                    document.picture_info_count = 0;
                                }
                            });

                            this.on("sending", function (file, xhr, formData) {
                                //alert(file);

                                pics = document.getElementById("picture_info_" + file.form_id);

                                formData.append("name", pics.querySelector("#picture_name_text").value);
                                formData.append("description", pics.querySelector("#picture_description_text").value);
                                formData.append("gallery_id", document.getElementById("galleryDDL").value);

                                console.log(formData);

                            });
                        }

                    });

                    $("#<%= galleryDDL.ClientID %>").on("change", function () {
                        var period = this.value;
                        if (period == "-1") {
                            UIkit.modal('#createGalleryModal').show(); //you can use toggle or open here
                        }

                    });

                    $(document).on('show', $('#isPublicGallery'), function (e) {
                        var switcher_index = UIkit.util.index(e.target);
                        $('#<%= isPublicGalleryBool.ClientID %>').val(switcher_index);
                        console.log($('#<%= isPublicGalleryBool.ClientID %>').val());
                        console.log(switcher_index);
                    });
                });

                var prm = Sys.WebForms.PageRequestManager.getInstance();

                prm.add_endRequest(function () {
                    Dropzone.autoDiscover = false;
                    document.picture_info_count = 0;
                    document.swicher_index = 0;

                    $("#my-awesome-dropzone").dropzone({
                        url: 'hn_FileUpload.ashx',
                        previewsContainer: ".dropzone-previews",
                        uploadMultiple: true,
                        addRemoveLinks: true,
                        autoProcessQueue: false,
                        parallelUploads: 100,
                        maxFiles: 100,

                        // The setting up of the dropzone
                        init: function () {
                            var myDropzone = this;

                            // Submit button handler
                            $("#uploadSubmitButton").click(function (e) {
                                e.preventDefault();
                                e.stopPropagation();
                                myDropzone.processQueue();
                            });

                            this.on("thumbnail", function (file) {
                                console.log(file); // will send to console all available props
                                file.previewElement.addEventListener("click", function () {
                                    //alert(file.form_id);
                                    var nodes = document.getElementById('picture_info_container').childNodes;
                                    for (var i = 0; i < nodes.length; i++) {
                                        if (nodes[i].nodeName.toLowerCase() == 'div') {
                                            nodes[i].style.display = 'none';
                                        }
                                    }

                                    document.getElementById("picture_info_" + file.form_id).style.display = 'block';
                                });
                            });

                            this.on("addedfiles", function (files) {
                                //alert(files.length);
                                for (var i = 0; i < files.length; i++) {
                                    document.picture_info_count++;

                                    // Get the last <li> element ("Milk") of <ul> with id="myList2"
                                    var p_template = document.getElementById("picture_info_0");

                                    // Copy the <li> element and its child nodes
                                    var cln = p_template.cloneNode(true);

                                    cln.classList.remove("uk-disabled");
                                    cln.setAttribute("id", "picture_info_" + document.picture_info_count);
                                    cln.style.display = 'none';
                                    cln.querySelector('#picture_name_text_lbl').innerHTML = "Name for picture #" + document.picture_info_count + ":";
                                    // Append the cloned <li> element to <ul> with id="myList1"
                                    document.getElementById("picture_info_container").appendChild(cln);
                                    files[i].form_id = document.picture_info_count;
                                }
                                console.log(files.length + ' files added');
                            });

                            this.on("removedfile", function (file) {
                                var element = document.getElementById("picture_info_" + file.form_id);
                                element.parentNode.removeChild(element);

                                if (document.getElementById("picture_info_container").childElementCount == 1) {
                                    document.getElementById("picture_info_0").style.display = 'block';
                                    document.picture_info_count = 0;
                                }
                            });

                            this.on("sending", function (file, xhr, formData) {
                                //alert(file);
                                pics = document.getElementById("picture_info_" + file.form_id);
                                
                                formData.append("name", pics.querySelector("#picture_name_text").value);
                                formData.append("description", pics.querySelector("#picture_description_text").value);
                                formData.append("gallery_id", document.getElementById("galleryDDL").value);

                                console.log(formData);

                            });
                        }

                    });

                    $("#<%= galleryDDL.ClientID %>").on("change", function () {
                        var period = this.value;
                        if (period == "-1") {
                            UIkit.modal('#createGalleryModal').show(); //you can use toggle or open here
                        }

                    });

                    $(document).on('show', $('#isPublicGallery'), function (e) {
                        var switcher_index = UIkit.util.index(e.target);
                        $('#<%= isPublicGalleryBool.ClientID %>').val(switcher_index);
                        console.log($('#<%= isPublicGalleryBool.ClientID %>').val());
                        console.log(switcher_index);
                    });
                });

            </script>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<%--            <script type="text/javascript">
                Dropzone.autoDiscover = false;
                $(document).ready(function () {
                    //Simple Dropzonejs 
                    $("#dZUpload").dropzone({
                        url: "hn_FileUpload.ashx",
                        addRemoveLinks: true,
                        autoProcessQueue: false,
                        success: function (file, response) {
                            var imgName = response;
                            file.previewElement.classList.add("dz-success");
                            console.log("Successfully uploaded :" + imgName);
                        },
                        error: function (file, response) {
                            file.previewElement.classList.add("dz-error");
                        }
                    });
                });
            </script>
    
                    var $myDropZone;
                $myDropZone = new Dropzone('div#myDropzone', {
                    addRemoveLinks: true, //to remove
                    dictRemoveFile: '<i class="fa fa-times-circle" style="font-weight: 900; cursor: pointer; "></i>', //I used an icon and styled as button so to give a user experience to remove it
                    // The configuration we've talked about above
                    autoProcessQueue: false,
                    uploadMultiple: true,
                    parallelUploads: 25,
                    maxFiles: 25,
                    previewsContainer: ".dropzone-previews",

                    // The setting up of the dropzone
                    init: function () {
                        var myDropzone = this;

                        // Here's the change from enyo's tutorial...

                        $("#submit-all").click(function (e) {
                            e.preventDefault();
                            e.stopPropagation();
                            myDropzone.processQueue();
                        });
                    }
                }
    
--%>