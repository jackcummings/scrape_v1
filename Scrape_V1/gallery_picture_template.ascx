<%@ Control Language="C#" AutoEventWireup="true" CodeFile="gallery_picture_template.ascx.cs" Inherits="gallery_picture_template" %>

<!-- Use figure for a more semantic html -->
<figure id="pic_template" itemprop="associatedMedia" itemscope itemtype="http://schema.org/ImageObject" runat="server">
    <!-- Link to the big image, not mandatory, but usefull when there is no JS -->
    <a href="" id="pic_link" class="pic_link" data-caption="" data-width="" data-height="" itemprop="contentUrl" runat="server">
        <!-- Thumbnail -->
        <img src="" id="thumb" itemprop="thumbnail" alt="Image description" runat="server">
    </a>
</figure>
