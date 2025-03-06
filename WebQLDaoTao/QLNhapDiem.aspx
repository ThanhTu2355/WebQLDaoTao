<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLNhapDiem.aspx.cs" Inherits="WebQLDaoTao.QLNhapDiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="contents\pagination.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <h1>NHẬP ĐIỂM</h1>
    <div class="form-inline">
        Chọn môn <asp:DropDownList ID="ddlKhoa" AutoPostBack="true" DataSourceID="odsMonHoc" DataTextField="TenMH" DataValueField="MaMH" runat="server"></asp:DropDownList>
    </div>
    <asp:GridView ID="gvDiem" runat="server" AutoGenerateColumns="False" DataSourceID="odsDiem"
        AllowPaging="true" PageSize="10" CssClass="table table-bordered table-hover"
        DataKeyNames="id" Width="70%" ShowFooter="true">
        <Columns>
            <asp:BoundField DataField="MaSV" HeaderText="Mã sinh viên" ReadOnly="true"></asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:TextBox ID="txtDiem" runat="server" Text='<%# Eval("Diem") %>'></asp:TextBox>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnLuu" runat="server" Text="Lưu" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>

        <EmptyDataTemplate>
            <div class="alert alert-warning"> Không có dữ liệu</div>
        </EmptyDataTemplate>

        <PagerStyle HorizontalAlign="Center" CssClass="pagination-ys" />
    </asp:GridView>
    <asp:ObjectDataSource ID="odsDiem" runat="server" SelectMethod="getByMaMH" TypeName="WebQLDaoTao.Models.KetQuaDAO">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlKhoa" PropertyName="SelectedValue" Name="mamh" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsMonHoc" runat="server" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.MonHocDAO"></asp:ObjectDataSource>
</asp:Content>
