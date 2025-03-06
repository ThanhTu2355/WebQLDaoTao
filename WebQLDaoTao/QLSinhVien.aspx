<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLSinhVien.aspx.cs" Inherits="WebQLDaoTao.QLSinhVien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="contents\pagination.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">

    <!-- Trigger the modal with a button -->
    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Thêm sinh viên</button>

    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content--> 
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Thêm sinh viên</h4>
                </div>
                <div class="modal-body">
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Mã sinh viên</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtMaSV" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Họ sinh viên</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtHoSV" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Tên sinh viên</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtTenSV" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Giới tính</label>
                        <div class="col-sm-6">
                            <asp:RadioButton ID="rdNam" Text="Nam" GroupName="GioiTinh" Checked="true" runat="server" />
                            <asp:RadioButton ID="rdNu" Text="Nữ" GroupName="GioiTinh" runat="server" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Ngày Sinh</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtNgaySinh" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Nơi sinh</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtNoiSinh" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Địa chỉ</label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="txtDiaChi" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Mã khoa</label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlKhoa" runat="server" DataSourceID="odsKhoa"
                                              DataTextField="tenkh" DataValueField="makh"></asp:DropDownList>
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

    <div class="table-responsive">
        <asp:GridView ID="gvSinhVien" runat="server" DataSourceID="odsSinhVien"
            CssClass="table table-bordered table-hover" AutoGenerateColumns="False"
            AllowPaging="true" DataKeyNames="MaSV">
            <Columns>
                <asp:BoundField DataField="MaSV" HeaderText="Mã SV" ReadOnly="true"></asp:BoundField>
                <asp:BoundField DataField="HoSV" HeaderText="Họ SV" ControlStyle-Width="120px"></asp:BoundField>
                <asp:BoundField DataField="TenSV" HeaderText="Tên SV" ControlStyle-Width="60px"></asp:BoundField>
                <asp:CheckBoxField DataField="GioiTinh" HeaderText="Giới Tính"></asp:CheckBoxField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <%# Convert.ToBoolean(Eval("gioitinh")) ? "Nam" : "Nữ" %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="ckPhai" runat="server"/>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" ControlStyle-Width="80px" DataFormatString="{0: dd/MM/yyyy}"></asp:BoundField>
                <asp:BoundField DataField="NoiSinh" HeaderText="Nơi Sinh" ControlStyle-Width="80px"></asp:BoundField>
                <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ"></asp:BoundField>
                <asp:TemplateField HeaderText="Khoa">
                    <ItemTemplate>
                        <%# Eval("MaKH") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlMaKhoa" DataSourceID="odsKhoa" DataTextField="TenKH"
                                          DataValueField="MaKH" SelectedValue='<%#Bind("makh") %>' runat="server">
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Wrap="false" ButtonType="Button" />
            </Columns>
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    <asp:ObjectDataSource ID="odsSinhVien" runat="server"
        TypeName="WebQLDaoTao.Models.SinhVienDAO" DataObjectTypeName="WebQLDaoTao.Models.SinhVien"
        SelectMethod="getAll" UpdateMethod="Update" DeleteMethod="Delete"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="odsKhoa" runat="server" SelectMethod="getAll" TypeName="WebQLDaoTao.Models.KhoaDAO"></asp:ObjectDataSource>
</asp:Content>
