package QUANLYTRASUA.BUS;

import QUANLYTRASUA.DAO.GiamGiaDAO;
import QUANLYTRASUA.DTO.GiamGia;
import MyCustom.Dialog;

import java.util.ArrayList;
import java.util.Date;

public class GiamGiaBUS {

    private ArrayList<GiamGia> listGiamGia = null;
    private GiamGiaDAO giamGiaDAO = new GiamGiaDAO();

    public GiamGiaBUS() {
        docDanhSach();
    }

    public void docDanhSach() {
        this.listGiamGia = giamGiaDAO.getDanhSachMaGiam();
    }

    public ArrayList<GiamGia> getDanhSachGiamGia() {
        if (this.listGiamGia == null)
            docDanhSach();
        return this.listGiamGia;
    }

    public boolean themMaGiam(String ten, String phanTram, String dieuKien, Date ngayBD, Date ngayKT) {
        ten = ten.trim();
        phanTram = phanTram.replace("%", "");
        dieuKien = dieuKien.replace(",", "");
        if (ten.equals("")) {
            new Dialog("Hãy nhập tên chương trình khuyến mãi!", Dialog.ERROR_DIALOG);
            return false;
        }
        if (ngayBD.compareTo(ngayKT) > 0 || ngayBD.compareTo(ngayKT) == 0) {
            new Dialog("Ngày kết thúc không hợp lệ!", Dialog.ERROR_DIALOG);
            return false;
        }
        boolean flag = false;
        try {
            int phanTramGiam = Integer.parseInt(phanTram);
            int dieuKienGiam = Integer.parseInt(dieuKien);

            GiamGia gg = new GiamGia();
            gg.setTenGiamGia(ten);
            gg.setPhanTramGiam(phanTramGiam);
            gg.setDieuKien(dieuKienGiam);
            gg.setNgayBD(ngayBD);
            gg.setNgayKT(ngayKT);

            flag = giamGiaDAO.themMaGiam(gg);
        } catch (Exception e) {
            new Dialog("Hãy nhập số nguyên hợp lệ!", Dialog.ERROR_DIALOG);
            return false;
        }
        if (flag) {
            new Dialog("Thêm mới thành công!", Dialog.SUCCESS_DIALOG);
        } else {
            new Dialog("Thêm mới thất bại!", Dialog.ERROR_DIALOG);
        }
        return flag;
    }

    public boolean suaMaGiam(String ma, String ten, String phanTram, String dieuKien, Date ngayBD, Date ngayKT) {
        ten = ten.trim();
        phanTram = phanTram.replace("%", "");
        dieuKien = dieuKien.replace(",", "");
        if (ma.equals("")) {
            new Dialog("Chưa chọn mã để sửa!", Dialog.ERROR_DIALOG);
            return false;
        }
        if (ten.equals("")) {
            new Dialog("Hãy nhập tên chương trình khuyến mãi!", Dialog.ERROR_DIALOG);
            return false;
        }
        if (ngayBD.compareTo(ngayKT) > 0 || ngayBD.compareTo(ngayKT) == 0) {
            new Dialog("Ngày kết thúc không hợp lệ!", Dialog.ERROR_DIALOG);
            return false;
        }
        boolean flag = false;
        try {
            int maGiam = Integer.parseInt(ma);
            int phanTramGiam = Integer.parseInt(phanTram);
            int dieuKienGiam = Integer.parseInt(dieuKien);

            GiamGia gg = new GiamGia();
            gg.setMaGiam(maGiam);
            gg.setTenGiamGia(ten);
            gg.setPhanTramGiam(phanTramGiam);
            gg.setDieuKien(dieuKienGiam);
            gg.setNgayBD(ngayBD);
            gg.setNgayKT(ngayKT);

            flag = giamGiaDAO.suaMaGiam(gg);
        } catch (Exception e) {
            new Dialog("Hãy nhập số nguyên hợp lệ!", Dialog.ERROR_DIALOG);
            return false;
        }
        if (flag) {
            new Dialog("Sửa thành công!", Dialog.SUCCESS_DIALOG);
        } else {
            new Dialog("Sửa thất bại!", Dialog.ERROR_DIALOG);
        }
        return flag;
    }
}
