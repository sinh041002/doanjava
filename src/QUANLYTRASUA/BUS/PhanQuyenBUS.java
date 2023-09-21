package QUANLYTRASUA.BUS;

import QUANLYTRASUA.DAO.PhanQuyenDAO;
import QUANLYTRASUA.DTO.PhanQuyen;
import MyCustom.Dialog;

import java.util.ArrayList;

public class PhanQuyenBUS {

    public static PhanQuyen quyenTK = null;
    private PhanQuyenDAO phanQuyenDAO = new PhanQuyenDAO();
    private ArrayList<PhanQuyen> listPhanQuyen = null;

    public void docDanhSachQuyen() {
        this.listPhanQuyen = phanQuyenDAO.getListQuyen();
    }

    public void kiemTraQuyen(String quyen) {
        quyenTK = phanQuyenDAO.getQuyen(quyen);
    }

    public ArrayList<PhanQuyen> getListQuyen() {
        if (listPhanQuyen == null)
            docDanhSachQuyen();
        return this.listPhanQuyen;
    }

    public boolean suaQuyen(String tenQuyen, int nhapHang, int sanPham, int nhanVien, int khachHang, int thongKe) {
        PhanQuyen phanQuyen = new PhanQuyen(tenQuyen, nhapHang, sanPham, nhanVien, khachHang, thongKe);
        boolean flag = phanQuyenDAO.suaQuyen(phanQuyen);
        if (flag) {
            new Dialog("Sửa thành công!", Dialog.SUCCESS_DIALOG);
        } else {
            new Dialog("Sửa thất bại!", Dialog.ERROR_DIALOG);
        }
        return flag;
    }

    public boolean themQuyen(String tenQuyen) {
        if (tenQuyen == null || tenQuyen.trim().equals("")) {
            return false;
        }

        if (kiemTonTaiTraQuyen(tenQuyen)) {
            new Dialog("Thêm thất bại! Quyền đã tồn tại", Dialog.ERROR_DIALOG);
            return false;
        }

        PhanQuyen phanQuyen = new PhanQuyen(tenQuyen, 0, 0, 0, 0, 0);
        boolean flag = phanQuyenDAO.themQuyen(phanQuyen);
        if (flag) {
            new Dialog("Thêm thành công! Hãy hiệu chỉnh quyền", Dialog.SUCCESS_DIALOG);
        } else {
            new Dialog("Thêm thất bại! Quyền đã tồn tại", Dialog.ERROR_DIALOG);
        }
        return flag;
    }

    private boolean kiemTonTaiTraQuyen(String tenQuyen) {
        docDanhSachQuyen();
        for (PhanQuyen q : listPhanQuyen) {
            if (q.getQuyen().equalsIgnoreCase(tenQuyen))
                return true;
        }
        return false;
    }

    public boolean xoaQuyen(String tenQuyen) {
        boolean flag = phanQuyenDAO.xoaQuyen(tenQuyen);
        if (flag) {
            new Dialog("Xoá thành công!", Dialog.SUCCESS_DIALOG);
        } else {
            new Dialog("Xoá thất bại!", Dialog.ERROR_DIALOG);
        }
        return flag;
    }
}
