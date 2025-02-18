<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLKhoa.aspx.cs" Inherits="WebQLDaoTao.QLKhoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="contents\pagination.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

    <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Thêm môn học</button>

    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm khoa</h4>
                </div>
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label for="lblMaKH" class="col-sm-2 col-form-label">Mã khoa</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtMaKH" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="lblTenKhoa" class="col-sm-2 col-form-label">Tên khoa</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtTenKhoa" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnLuu" OnClick="btnLuu_Click" runat="server" Text="Lưu" CssClass="btn btn-primary" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

    <asp:GridView ID="gvKhoa" runat="server" CssClass="table table-bordered table-hover" DataSourceID="odsKhoa" AutoGenerateColumns="False" DataKeyNames="MaKH"
        AllowPaging="true" PageSize="5">
        <Columns>
            <asp:BoundField DataField="MaKH" HeaderText="Mã Khoa" SortExpression="MaKH" ReadOnly="true"></asp:BoundField>
            <asp:BoundField DataField="TenKH" HeaderText="Tên Khoa" SortExpression="TenKH"></asp:BoundField>
            <asp:CommandField HeaderText="Chức năng" ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button"></asp:CommandField>
        </Columns>
        <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
    </asp:GridView>

    <asp:ObjectDataSource ID="odsKhoa" runat="server"
        SelectMethod="getAll"
        TypeName="WebQLDaoTao.Models.KhoaDAO" DataObjectTypeName="WebQLDaoTao.Models.Khoa"
        DeleteMethod="Delete"
        InsertMethod="Insert"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="makh" Type="String"></asp:Parameter>
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
