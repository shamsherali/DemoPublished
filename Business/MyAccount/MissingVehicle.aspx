﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true"
    CodeBehind="MissingVehicle.aspx.cs" Inherits="USPDHUB.Business.MyAccount.MissingVehicle"
    ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphUser" runat="server">
    <script src="../../Scripts/flyers/jquery-1.7.2.js" type="text/javascript"></script>
    <link href="../../css/Bulletins.css" rel="stylesheet" type="text/css" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="Panel1" DefaultButton="btnSave" runat="server">
                <div id="wrapper">
                    <div class="headernav">
                        <%=BulletinName %><asp:TextBox ID="txt" runat="server" Width="0" BorderStyle="none"
                            BorderColor="white" Style="border: 0; border-color: White!important;"></asp:TextBox>
                    </div>
                    <div style="text-align: center;">
                        <asp:Label ID="lblerror" runat="server"></asp:Label>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="3">
                            <ProgressTemplate>
                                <img src="../../images/popup_ajax-loader.gif" border="0" /><b><font color="green"
                                    size="2">Processing....</font></b>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <div style="width: 250px; margin: 0 auto;">
                            <asp:ValidationSummary ID="ValidateUserDetails" runat="server" Style="text-align: left;"
                                ValidationGroup="SV" HeaderText="The following error(s) occurred:" />
                        </div>
                    </div>
                    <div>
                        <div style="margin: 0 auto; width: 100%; overflow: hidden;">
                            <asp:Label runat="server" ID="lblLogoHeader"></asp:Label>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="contentwrap">
                        <div class="largetxt">
                            Stolen Vehicle
                        </div>
                        <div class="browseimg_wrap">
                            <div class="avatar" style="text-align: center;">
                                <div id='divMissingVeh' style="width: 310px; min-height: 140px; display: block;">
                                </div>
                                <asp:HiddenField ID="hdnMissingVeh" runat="server" />
                                <asp:HiddenField ID="hdnMissingVehLink" runat="server" />
                            </div>
                            <label>
                                <img style="cursor: pointer;" onclick="EditImage('divMissingVeh');" src="../../Images/Dashboard/Browseimg.png" />
                            </label>
                            <div style="float: right; margin-left: 0px;">
                                <a href="javascript:ModalHelpPopup('Add Image to Bulletin',20,'');">
                                    <img src="<%=Page.ResolveClientUrl("~/images/Dashboard/new.png")%>" /></a>
                            </div>
                            <div id="imgDelete1" style="margin-top: 5px; display: none;">
                                <asp:Button ID="btnImgDelete1" runat="server" CausesValidation="false" border="0"
                                    CssClass="btn" Text="Delete Image" OnClientClick="return FirstImageDelete();"
                                    Width="151px" />
                            </div>
                        </div>
                        <div class="form_wrapper">
                            <div class="fields_wrap">
                                <div class="fields_wrap">
                                    <label style="color: Red; font-size: 16px; margin-left: 100px;">
                                        * Marked fields are mandatory.</label>
                                </div>
                            </div>
                            <div class="fields_wrap">
                                <div class="left_lable">
                                    <font color="red">*</font>
                                    <label>
                                        Date :</label></div>
                                <div class="right_fields">
                                    <asp:TextBox ID="txtBulletinDate" runat="server"></asp:TextBox>
                                    <cc1:TextBoxWatermarkExtender ID="MaskedEditExtender1" TargetControlID="txtBulletinDate"
                                        WatermarkText="MM/DD/YYYY" runat="server" WatermarkCssClass="watermarkbulletindate">
                                    </cc1:TextBoxWatermarkExtender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                                        ControlToValidate="txtBulletinDate" ValidationGroup="SV" ErrorMessage="Date is mandatory.">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                        ControlToValidate="txtBulletinDate" ValidationExpression="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d"
                                        ValidationGroup="SV" ErrorMessage="Invalid Date Format of Date.">*</asp:RegularExpressionValidator>
                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtBulletinDate"
                                        Format="MM/dd/yyyy" CssClass="MyCalendar" />
                                </div>
                            </div>
                            <div class="fields_wrap">
                                <div class="left_lable">
                                    <font color="red">*</font>
                                    <label>
                                        Make :</label>
                                </div>
                                <div class="right_fields">
                                    <asp:TextBox ID="txtMake" runat="server" CssClass="txtfild1"></asp:TextBox>
                                    &nbsp;<asp:RequiredFieldValidator ID="REFVMake" runat="server" ControlToValidate="txtMake"
                                        ValidationGroup="SV" ErrorMessage="Make is mandatory.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    <font color="red">*</font>
                                    <label>
                                        Model :</label></div>
                                <div class="right_fields">
                                    <asp:TextBox ID="txtModel" runat="server" CssClass="txtfild1"></asp:TextBox>
                                    &nbsp;<asp:RequiredFieldValidator ID="REFVMD" runat="server" ControlToValidate="txtModel"
                                        ValidationGroup="SV" ErrorMessage="Model is mandatory.">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    <span style="padding-left: 2px;">&nbsp;</span><label>
                                        Body Style :</label>
                                </div>
                                <div class="right_fields">
                                    <asp:DropDownList ID="ddlBodyStyles" runat="server" CssClass="select1">
                                    </asp:DropDownList>
                                    <%--<asp:TextBox ID="txtStyle" runat="server" CssClass="txtfild1"></asp:TextBox>--%>
                                </div>
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    &nbsp;<label>
                                        Year :</label></div>
                                <div class="right_fields">
                                    <asp:TextBox ID="txtMfdYear" runat="server">
                                    </asp:TextBox>
                                    &nbsp;<asp:RegularExpressionValidator ID="REVMfdYear" runat="server" Display="Dynamic"
                                        ControlToValidate="txtMfdYear" ValidationExpression="^\d{4}$" SetFocusOnError="True"
                                        ValidationGroup="SV" ErrorMessage="Invalid Year Format.">*</asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    <span style="padding-left: 2px;">&nbsp;</span><label>
                                        Color :</label></div>
                                <div class="right_fields">
                                    <asp:DropDownList ID="ddlColors" runat="server" CssClass="select1">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    <span style="padding-left: 2px;">&nbsp;</span><label>
                                        State :</label></div>
                                <div class="right_fields">
                                    <%-- <asp:TextBox ID="txtState" runat="server"></asp:TextBox>--%>
                                    <asp:DropDownList ID="ddlState" runat="server" CssClass="select1">
                                        <asp:ListItem Value=""> Select </asp:ListItem>
                                        <asp:ListItem Value="Alabama">Alabama</asp:ListItem>
                                        <asp:ListItem Value="Alaska">Alaska</asp:ListItem>
                                        <asp:ListItem Value="Arizona">Arizona</asp:ListItem>
                                        <asp:ListItem Value="Arkansas">Arkansas</asp:ListItem>
                                        <asp:ListItem Value="California">California</asp:ListItem>
                                        <asp:ListItem Value="Colorado">Colorado</asp:ListItem>
                                        <asp:ListItem Value="Connecticut">Connecticut</asp:ListItem>
                                        <asp:ListItem Value="District">District of Columbia</asp:ListItem>
                                        <asp:ListItem Value="Delaware">Delaware</asp:ListItem>
                                        <asp:ListItem Value="Florida">Florida</asp:ListItem>
                                        <asp:ListItem Value="Georgia">Georgia</asp:ListItem>
                                        <asp:ListItem Value="Hawaii">Hawaii</asp:ListItem>
                                        <asp:ListItem Value="Idaho">Idaho</asp:ListItem>
                                        <asp:ListItem Value="Illinois">Illinois</asp:ListItem>
                                        <asp:ListItem Value="Indiana">Indiana</asp:ListItem>
                                        <asp:ListItem Value="Iowa">Iowa</asp:ListItem>
                                        <asp:ListItem Value="Kansas">Kansas</asp:ListItem>
                                        <asp:ListItem Value="Kentucky">Kentucky</asp:ListItem>
                                        <asp:ListItem Value="Louisiana">Louisiana</asp:ListItem>
                                        <asp:ListItem Value="Maine">Maine</asp:ListItem>
                                        <asp:ListItem Value="Maryland">Maryland</asp:ListItem>
                                        <asp:ListItem Value="Massachusetts">Massachusetts</asp:ListItem>
                                        <asp:ListItem Value="Michigan">Michigan</asp:ListItem>
                                        <asp:ListItem Value="Minnesota">Minnesota</asp:ListItem>
                                        <asp:ListItem Value="Mississippi">Mississippi</asp:ListItem>
                                        <asp:ListItem Value="Missouri">Missouri</asp:ListItem>
                                        <asp:ListItem Value="Montana">Montana</asp:ListItem>
                                        <asp:ListItem Value="Nebraska">Nebraska</asp:ListItem>
                                        <asp:ListItem Value="Nevada">Nevada</asp:ListItem>
                                        <asp:ListItem Value="New Hampshire">New Hampshire</asp:ListItem>
                                        <asp:ListItem Value="New Jersey">New Jersey</asp:ListItem>
                                        <asp:ListItem Value="New Mexico">New Mexico</asp:ListItem>
                                        <asp:ListItem Value="New York">New York</asp:ListItem>
                                        <asp:ListItem Value="North Carolina">North Carolina</asp:ListItem>
                                        <asp:ListItem Value="North Dakota">North Dakota</asp:ListItem>
                                        <asp:ListItem Value="Ohio">Ohio</asp:ListItem>
                                        <asp:ListItem Value="Oklahoma">Oklahoma</asp:ListItem>
                                        <asp:ListItem Value="Oregon">Oregon</asp:ListItem>
                                        <asp:ListItem Value="Pennsylvania">Pennsylvania</asp:ListItem>
                                        <asp:ListItem Value="Rhode Island">Rhode Island</asp:ListItem>
                                        <asp:ListItem Value="South Carolina">South Carolina</asp:ListItem>
                                        <asp:ListItem Value="South Dakota">South Dakota</asp:ListItem>
                                        <asp:ListItem Value="Tennessee">Tennessee</asp:ListItem>
                                        <asp:ListItem Value="Texas">Texas</asp:ListItem>
                                        <asp:ListItem Value="Utah">Utah</asp:ListItem>
                                        <asp:ListItem Value="Vermont">Vermont</asp:ListItem>
                                        <asp:ListItem Value="Virginia">Virginia</asp:ListItem>
                                        <asp:ListItem Value="Washington">Washington</asp:ListItem>
                                        <asp:ListItem Value="West Virginia">West Virginia</asp:ListItem>
                                        <asp:ListItem Value="Wisconsin">Wisconsin</asp:ListItem>
                                        <asp:ListItem Value="Wyoming">Wyoming</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    &nbsp;<label>
                                        License Number :</label>
                                </div>
                                <div class="right_fields">
                                    <asp:TextBox ID="txtLcsPlate" runat="server" CssClass="txtfild2"></asp:TextBox>
                                    &nbsp;
                                </div>
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    <span style="padding-left: 2px;">&nbsp;</span><label>
                                        Distinguishing Marks :</label></div>
                                <div class="right_fields">
                                    <asp:TextBox ID="txtMarks" runat="server" TextMode="MultiLine" CssClass="txtfild1"></asp:TextBox>
                                </div>
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    <font color="red">*</font>
                                    <label>
                                        Date Last Seen :</label></div>
                                <div class="right_fields">
                                    <asp:TextBox ID="txtLSD" runat="server"></asp:TextBox>
                                    <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" TargetControlID="txtLSD"
                                        WatermarkText="MM/DD/YYYY" runat="server" WatermarkCssClass="watermarkbulletindate">
                                    </cc1:TextBoxWatermarkExtender>
                                    <asp:RequiredFieldValidator ID="REFVLSD" runat="server" Display="Dynamic" ControlToValidate="txtLSD"
                                        ValidationGroup="SV" ErrorMessage="Date of Last Seen is mandatory.">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="REVLSD" runat="server" Display="Dynamic" ControlToValidate="txtLSD"
                                        ValidationExpression="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d"
                                        SetFocusOnError="True" ValidationGroup="SV" ErrorMessage="Invalid Date Format of Date of Last Seen.">*</asp:RegularExpressionValidator>
                                    <cc1:CalendarExtender ID="CELCD" runat="server" TargetControlID="txtLSD" Format="MM/dd/yyyy"
                                        CssClass="MyCalendar" />
                                </div>
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    <span style="padding-left: 2px;">&nbsp;</span><label class="highlightLabel">
                                        Remarks :</label></div>
                                <div class="right_fields">
                                    <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" CssClass="txtfild1"></asp:TextBox>
                                </div>
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    <span style="padding-left: 2px;">&nbsp;</span><label>
                                        Expiration Date & Time:</label></div>
                                <div class="right_fields" style="width: 470px;">
                                    <table width="85%" cellpadding="0" cellspacing="0" id='tblExTime'>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtExpires" runat="server" onChange="ShowExTimeDiv();"></asp:TextBox>
                                                <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" TargetControlID="txtExpires"
                                                    WatermarkText="MM/DD/YYYY" runat="server" WatermarkCssClass="watermarkbulletindate">
                                                </cc1:TextBoxWatermarkExtender>
                                                <asp:RegularExpressionValidator ID="RegularDate" runat="server" Display="Dynamic"
                                                    ControlToValidate="txtExpires" ValidationExpression="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d"
                                                    SetFocusOnError="True" ValidationGroup="SV" ErrorMessage="Invalid Date Format">*</asp:RegularExpressionValidator>
                                                <cc1:CalendarExtender ID="calex" runat="server" TargetControlID="txtExpires" Format="MM/dd/yyyy"
                                                    CssClass="MyCalendar" />
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="txtExHours" Width="50px" Enabled="False" MaxLength="2"></asp:TextBox>
                                                <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" TargetControlID="txtExHours"
                                                    WatermarkText="Hour" runat="server" WatermarkCssClass="watermarkbulletindate">
                                                </cc1:TextBoxWatermarkExtender>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic"
                                                    ControlToValidate="txtExHours" ValidationExpression="^(1[0-2]|0?[1-9])" ValidationGroup="SV"
                                                    ErrorMessage="Invalid Time Format">*</asp:RegularExpressionValidator>
                                                &nbsp; &nbsp;
                                                <asp:TextBox runat="server" ID="txtExMinutes" Width="50px" Enabled="False" MaxLength="2"></asp:TextBox>
                                                <cc1:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender5" TargetControlID="txtExMinutes"
                                                    WatermarkText="Minutes" runat="server" WatermarkCssClass="watermarkbulletindate">
                                                </cc1:TextBoxWatermarkExtender>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" Display="Dynamic"
                                                    ControlToValidate="txtExMinutes" ValidationExpression="^[0-5]\d" ValidationGroup="SV"
                                                    ErrorMessage="Invalid Time Format">*</asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                                <asp:DropDownList runat="server" ID="ddlExSS" Enabled="False" Width="60px">
                                                    <asp:ListItem Text="AM" Value="AM" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Text="PM" Value="PM"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="fields_wrap" id="divSettings" runat="server">
                                <div class="left_lable">
                                    <label>
                                    </label>
                                </div>
                                <div class="right_fields">
                                    <label id="divCall" runat="server">
                                        <asp:CheckBox ID="chkCall" runat="server" />
                                        Display Call Button</label>
                                    <br />
                                    <label id="divContactUs" runat="server">
                                        <asp:CheckBox ID="chkContact" runat="server" />
                                        Display Contact Us Button</label>
                                    <br />
                                </div>
                            </div>
                            <div class="clear10">
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    <label>
                                    </label>
                                </div>
                                <div class="right_fields">
                                    <div style="margin: 10px 0px 0px 0px;">
                                        <asp:RadioButton ID="rbPrivate" runat="server" GroupName="Public" Checked="true"
                                            onclick="javascript:ShowPublish('1')" />
                                        <label>
                                            Private</label>
                                        <asp:RadioButton ID="rbPublic" runat="server" GroupName="Public" onclick="javascript:ShowPublish('2')" />
                                        <asp:Label ID="lblPublish" runat="server" Text="Publish" CssClass="approval"></asp:Label>
                                        <div style="margin: 10px 0px 0px 10px; display: none;" id="divpublish">
                                            <div id="divSchedulePublish" style="display: block;">
                                                <font color="red">*</font>
                                                <label style="font-size: 14px;">
                                                    Publish Date:</label>
                                                <asp:TextBox ID="txtPublishDate" runat="server" Width="75"></asp:TextBox><asp:TextBox
                                                    ID="txtPD" runat="server" Width="0" Height="0" BorderStyle="None" Style="display: none;"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="txtPD"
                                                    runat="server" ErrorMessage="Publish Date is mandatory." Display="Dynamic" ValidationGroup="SV"
                                                    SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="REPublishDate" runat="server" Display="Dynamic"
                                                    ControlToValidate="txtPublishDate" ValidationExpression="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d"
                                                    ValidationGroup="SV" ErrorMessage="Invalid Date Format">*</asp:RegularExpressionValidator>
                                                <cc1:CalendarExtender ID="calPublish" runat="server" TargetControlID="txtPublishDate"
                                                    Format="MM/dd/yyyy" CssClass="MyCalendar" />
                                            </div>
                                            <% if ((Session["C_USER_ID"] == null || Session["C_USER_ID"].ToString() == "") || hdnPermissionType.Value == "P")
                                               { %>
                                            <br />
                                            <%if (hdnFacebook.Value == "")
                                              { %>
                                            <asp:CheckBox ID="chkFbAutoPost" runat="server" Text="Auto post on facebook" Style="font-size: 14px;
                                                padding-left: 4px;" /><br />
                                            <%} %>
                                            <%if (hdnTwitter.Value == "")
                                              { %>
                                            <asp:CheckBox ID="chkTwrAutoPost" runat="server" Text="Auto post on twitter" Style="font-size: 14px;
                                                padding-left: 4px;" />
                                            <%} %>
                                            <%} %>
                                            <asp:HiddenField ID="hdnIsAlreadyPublished" runat="server" Value="0" />
                                            <asp:HiddenField ID="hdnFacebook" runat="server" />
                                            <asp:HiddenField ID="hdnTwitter" runat="server" />
                                            <asp:HiddenField ID="hdnPublishDate" runat="server" />
                                            <asp:HiddenField ID="hdnPublishTitle" runat="server" Value="Publish" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                    <span style="padding-left: 2px;">&nbsp;</span><label>
                                        Category:</label></div>
                                <div class="right_fields">
                                    <asp:DropDownList ID="ddlCategories" runat="server" Width="200px">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="fields_wrap">
                                <div class="left_lable">
                                    <span style="padding-left: 2px;">&nbsp;</span><label>
                                    </label>
                                </div>
                                <div class="right_fields">
                                    <asp:CheckBox runat="server" ID="chkCleared" Text="Located" />
                                </div>
                            </div>
                            <div class="clear">
                            </div>
                            <div class="clear10">
                            </div>
                            <div class="fields_wrap ">
                                <div class="left_lable">
                                </div>
                                <div class="right_fields" style="margin: 10px 0px 0px 0px; width: 450px;">
                                    <asp:Button ID="btnCancel" runat="server" CausesValidation="false" border="0" CssClass="btn"
                                        Text="Cancel" OnClick="btnCancel_Click" />
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" border="0" OnClick="btnSave_Click"
                                        ValidationGroup="SV" OnClientClick="BindImages(1);" />
                                    <asp:LinkButton ID="lnkPreview" runat="server" OnClick="lnkPreview_Click" OnClientClick="BindImages(2);"><img src="../../images/BulletinThumbs/preview.png" width="100" height="37"></asp:LinkButton>
                                    <input type="hidden" id="editDivCheck" value="" />
                                    <input type="hidden" id='hdnFormImgPath' />
                                    <input type="hidden" id="hdnalignindex" />
                                    <asp:HiddenField ID="hdnArchive" runat="server" />
                                    <asp:HiddenField ID="hdnPermissionType" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                    <tr>
                        <td>
                            <asp:Label ID="lblProgress" runat="server" visiable="false"></asp:Label>
                            <cc1:ModalPopupExtender ID="MPEProgress" runat="server" TargetControlID="lblProgress"
                                PopupControlID="pnlProgress" BackgroundCssClass="modal">
                            </cc1:ModalPopupExtender>
                            <asp:Panel Style="display: none;" ID="pnlProgress" runat="server" Width="500px">
                                <table class="modalpopup" cellspacing="0" cellpadding="0" width="100%" align="center"
                                    border="0">
                                    <tr>
                                        <td align="center">
                                            <asp:UpdateProgress ID="UpdateProgress8" runat="server" DisplayAfter="3">
                                                <ProgressTemplate>
                                                    <img src="../../images/popup_ajax-loader.gif" border="0" /><b><font color="green"> Your
                                                        request is in progress, please don't refresh or close window. </font></b>
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:Label ID="lblMfdDate" runat="server"></asp:Label>
                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modal"
                            PopupControlID="pnlMfdDate" TargetControlID="lblMfdDate" CancelControlID="imglogin11">
                        </cc1:ModalPopupExtender>
                        <asp:Panel ID="pnlMfdDate" runat="server" Style="display: none" Width="100%">
                            <table class="popuptable" cellspacing="0" cellpadding="0" width="600px" align="center"
                                border="0">
                                <tr>
                                    <td align="center">
                                        <asp:UpdateProgress ID="UpdateProgress10" runat="server" DisplayAfter="3">
                                            <ProgressTemplate>
                                                <img src="../../images/popup_ajax-loader.gif" border="0" /><b><font color="green">Processing....</font></b>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </td>
                                    <td align="right">
                                        <asp:ImageButton ID="imglogin11" runat="server" ImageUrl="~/images/popup_close.gif"
                                            CausesValidation="false"></asp:ImageButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="font-weight: bold; font-size: 14px; padding-bottom: 10px; color: green;
                                        padding-top: 10px" align="left" colspan="2">
                                        <asp:Label ID="lblbulletinamme" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="padding: 10px;">
                                        <div style="height: 500px; overflow-y: auto; border: solid 1px #4684C5;">
                                            <asp:Label ID="lblPreview" runat="server"></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <%--IMAGE GALLERY * RESIZE IMAGE--%>
                        <asp:Label ID="lblbulletinimage" runat="server"></asp:Label>
                        <cc1:ModalPopupExtender ID="popbulletinimage" runat="server" TargetControlID="lblbulletinimage"
                            PopupControlID="pnlbulletinimage" BackgroundCssClass="modal" BehaviorID="popupimage"
                            CancelControlID="imcloseimagepopup">
                        </cc1:ModalPopupExtender>
                        <asp:Panel ID="pnlbulletinimage" runat="server" Style="display: none" Width="800px">
                            <table cellpadding="0" cellspacing="0" width="100%" style="border: 1px solid #EEECEC;
                                background-color: #F8F6F6;">
                                <tbody>
                                    <tr>
                                        <td align="right" style="padding: 5px 10px 0px 10px;">
                                            <asp:ImageButton ID="imcloseimagepopup" runat="server" ImageUrl="~/images/popup_close.gif" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mid">
                                            <div id="DIDIFrm">
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lnkPreview" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <script type="text/javascript">
        $(document).ready(function () {
            if ('<%= IsScheduleEmails %>' == 'False') {
                if (document.getElementById('<%= hdnPermissionType.ClientID%>').value == "A")
                    document.getElementById('<%= lblPublish.ClientID%>').innerHTML = "Submit for approval";
                else
                    document.getElementById('<%= lblPublish.ClientID%>').innerHTML = "Publish Now";
            }
        });
        function ShowExTimeDiv() {
            if (document.getElementById("<%=txtExpires.ClientID %>").value == "") {
                document.getElementById("<%=txtExHours.ClientID %>").disabled = true;
                document.getElementById("<%=txtExMinutes.ClientID %>").disabled = true;
                document.getElementById("<%=ddlExSS.ClientID %>").disabled = true;
            }
            else {
                document.getElementById("<%=txtExHours.ClientID %>").disabled = false;
                document.getElementById("<%=txtExMinutes.ClientID %>").disabled = false;
                document.getElementById("<%=ddlExSS.ClientID %>").disabled = false;
            }
        }
        function GetCurrentDate() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Default.aspx/GetUserTimeZoneDashboard",
                dataType: "json",
                success: function (response) {
                    currentTime = new Date(response.d);
                    dformat = [(currentTime.getMonth() + 1).padLeft(), currentTime.getDate().padLeft(), currentTime.getFullYear()].join('/');
                    document.getElementById('<%= txtPublishDate.ClientID%>').value = dformat;
                }
            });
        }
        Number.prototype.padLeft = function (base, chr) {
            var len = (String(base || 10).length - String(this).length) + 1;
            return len > 0 ? new Array(len).join(chr || '0') + this : this;
        }
        function ValidatePublishDate() {
            if (document.getElementById('<%= rbPublic.ClientID%>').checked) {
                if (document.getElementById("<%=txtPublishDate.ClientID %>").value == "") {
                    document.getElementById("<%=txtPD.ClientID %>").value = "";
                }
                else {
                    document.getElementById("<%=txtPD.ClientID %>").value = "1";
                }
            }
            else {
                document.getElementById("<%=txtPublishDate.ClientID %>").value = "";
                document.getElementById("<%=txtPD.ClientID %>").value = "1";
            }
        }
        function ShowPublish(val) {
            if (val == "1") {
                document.getElementById('<%=btnSave.ClientID %>').value = "Save";
                document.getElementById('divpublish').style.display = "none";
                document.getElementById('<%= txtPublishDate.ClientID%>').value = '';
            } else if (val == "2") {
                document.getElementById('<%=btnSave.ClientID %>').value = "Submit";
                document.getElementById('divpublish').style.display = "block";
                if ('<%= IsScheduleEmails %>' == 'True') {
                    document.getElementById('divSchedulePublish').style.display = "block";
                } else {

                    document.getElementById('divSchedulePublish').style.display = "none";
                }
                if (document.getElementById('<%= txtPublishDate.ClientID%>').value == "")
                    GetCurrentDate();
            }
        }
        function EditImage(imgdivID) {
            document.getElementById('DIDIFrm').innerHTML = "";
            ifrm = document.createElement("IFRAME");
            imgSrc = document.getElementById(imgdivID).innerHTML.trim();

            //            ifrm.setAttribute("src", "Bulletin_ImageGallery.aspx?fitblockwidth=" + (document.getElementById(imgdivID).offsetWidth - 10) + "&imgSrc=" + imgSrc + "&folder=Forms");
            //            ifrm.style.height = "750px";
            ifrm.setAttribute("src", "BulletinsForm_ImageGallery.aspx?fitblockwidth=" + (document.getElementById(imgdivID).offsetWidth - 30) + "&imgSrc=" + imgSrc + "&folder=Forms");
            ifrm.style.height = "650px";
            ifrm.style.width = "100%";
            ifrm.style.border = "0px";
            ifrm.scrolling = "no";
            ifrm.frameBorder = "0";
            document.getElementById('DIDIFrm').appendChild(ifrm);
            document.getElementById('editDivCheck').value = imgdivID;

            var modalDialog = $find("popupimage");
            modalDialog.show();
        }
        function BindImages(typeValue) {
            if (document.getElementById('divMissingVeh').innerHTML.indexOf('img') != -1 || document.getElementById('divMissingVeh').innerHTML.indexOf('IMG') != -1) {
                document.getElementById("<%=hdnMissingVeh.ClientID %>").value = $('#divMissingVeh img').attr('src');
            }
            if (document.getElementById('divMissingVeh').innerHTML.indexOf('href=') != -1) {
                document.getElementById("<%=hdnMissingVehLink.ClientID %>").value = $('#divMissingVeh a').attr('href');
            }

            ValidatePublishDate();

            if (!Page_ClientValidate('SV')) {
                return;
            }
            //ExDate checking
            if (document.getElementById("<%=txtExpires.ClientID %>").value != "" && typeValue == 1) {
                var currentdate = new Date();
                var fromDate = document.getElementById("<%=txtExpires.ClientID %>").value;
                var selDate = new Date(fromDate);
                var selHours = 0;
                var selmins = 0;
                if (document.getElementById("<%=txtExHours.ClientID %>").value != '' && document.getElementById("<%=txtExHours.ClientID %>").value != 'Hour') {
                    selHours = parseInt(document.getElementById("<%=txtExHours.ClientID %>").value);
                    if (selHours > 12) {
                        alert("Invalid Date Format.");
                        return false;
                    }
                    if (document.getElementById("<%=ddlExSS.ClientID %>").value == 'AM' && selHours == 12)
                        selHours = 0;
                    if (document.getElementById("<%=ddlExSS.ClientID %>").value == 'PM' && selHours < 12)
                        selHours += 12;
                }
                if (document.getElementById("<%=txtExMinutes.ClientID %>").value != '' && document.getElementById("<%=txtExMinutes.ClientID %>").value != 'Minutes')
                    selmins = parseInt(document.getElementById("<%=txtExMinutes.ClientID %>").value);

                if (selmins >= 60) {
                    alert("Invalid Date Format.");
                    return false;
                }
                selDate.setHours(selHours, selmins, 0);
                if (selDate <= currentdate) {
                    alert('Expiration date should be later than current date.');
                    return false;
                }
            }
            //end exdate checking


            if (typeValue == "1") {

                $find("<%=MPEProgress.ClientID %>").show();
            }

        }
        function DisplayImage() {
            if (document.getElementById('<%= hdnPermissionType.ClientID%>') != "" && document.getElementById('<%= hdnPermissionType.ClientID%>') != null) {  //roles & permissions..
                DisplayComplete();
                if (document.getElementById("<%=hdnMissingVeh.ClientID %>").value != "") {
                    document.getElementById("imgDelete1").style.display = "block";
                    if (document.getElementById("<%=hdnMissingVehLink.ClientID %>").value == "")
                        document.getElementById('divMissingVeh').innerHTML = "<img src='" + document.getElementById("<%=hdnMissingVeh.ClientID %>").value + "' />";
                    else
                        document.getElementById('divMissingVeh').innerHTML = "<a href='" + document.getElementById("<%=hdnMissingVehLink.ClientID %>").value + "' target='_blank'><img src='" + document.getElementById("<%=hdnMissingVeh.ClientID %>").value + "' /></a>";
                }
            }
        }
        window.onload = function () {
            if (document.getElementById('<%= hdnPermissionType.ClientID%>') != "" && document.getElementById('<%= hdnPermissionType.ClientID%>') != null) //roles & permissions..
                DisplayComplete();
            if (document.getElementById('<%=rbPrivate.ClientID %>').checked) {
                document.getElementById('<%=btnSave.ClientID %>').value = "Save";
            }
            else {
                document.getElementById('<%=btnSave.ClientID %>').value = "Submit";
            }

        }
        function DisplayComplete() {
            if (document.getElementById('<%= rbPublic.ClientID%>').checked) {
                document.getElementById('divpublish').style.display = "block";
                if ('<%= IsScheduleEmails %>' == 'True') {
                    document.getElementById('divSchedulePublish').style.display = "block";
                } else {

                    document.getElementById('divSchedulePublish').style.display = "none";
                }
                ShowPublish('2');
            }
            ShowExTimeDiv();
        }

        function FirstImageDelete() {
            if (confirm("Are you sure you want to delete this image?")) {
                document.getElementById('divMissingVeh').innerHTML = "";
                document.getElementById("imgDelete1").style.display = "none";
                document.getElementById("<%=hdnMissingVeh.ClientID %>").value = "";
            }
            return false;
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" Visible="false">
        <ContentTemplate>
            <div class="largetxt">
                Stolen Vehicle
            </div>
            <br />
            <div style="color: red;" align="center">
                <asp:Label ID="lblerrormessage" runat="server"></asp:Label></div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
