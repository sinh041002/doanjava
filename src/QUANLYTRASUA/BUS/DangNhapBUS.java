package QUANLYTRASUA.BUS;

import QUANLYTRASUA.DAO.DangNhapDAO;
import QUANLYTRASUA.DTO.PhanQuyen;
import QUANLYTRASUA.DTO.TaiKhoan;
import MyCustom.Dialog;

import java.io.*;

public class DangNhapBUS {

    private final static int EMPTY_ERROR = 1;
    private final static int WRONG_ERROR = 2;
    public static TaiKhoan taiKhoanLogin = null;

    public TaiKhoan getTaiKhoanDangNhap(String user, String password, boolean selected) {
        if (kiemTraDangNhap(user, password) == EMPTY_ERROR) {
            new Dialog("Không được để trống thông tin!", Dialog.ERROR_DIALOG);
            return null;
        }
        TaiKhoan tk = new TaiKhoan();
        tk.setTenDangNhap(user);
        tk.setMatKhau(password);

        DangNhapDAO dangNhapDAO = new DangNhapDAO();
        TaiKhoan account = dangNhapDAO.dangNhap(tk);
        taiKhoanLogin = account;

        if (account == null) {
            new Dialog("Sai thông tin đăng nhập hoặc tài khoản đã bị khoá!", Dialog.ERROR_DIALOG);
        } else {
            PhanQuyenBUS phanQuyenBUS = new PhanQuyenBUS();
            phanQuyenBUS.kiemTraQuyen(account.getQuyen());
            xuLyGhiNhoDangNhap(user, password, selected);
            new Dialog("Đăng nhập thành công!", Dialog.SUCCESS_DIALOG);
//            new Dialog("Vì tình hình dịch Covid phức tạp, cửa hàng chỉ thực hiện bán mang về!", Dialog.INFO_DIALOG);
        }
        return account;
    }

    public String getTaiKhoanGhiNho() {
        try {
            FileInputStream fis = new FileInputStream("remember.dat");
            BufferedReader br = new BufferedReader(new InputStreamReader(fis));
            String line = br.readLine();
            br.close();
            return line;
        }catch (Exception e) {
        }
        return "";
    }

    private void xuLyGhiNhoDangNhap(String user, String password, boolean selected) {
        try {
            if (!selected) {
                user = "";
                password = "";
            }
            FileWriter fw = new FileWriter("remember.dat");
            fw.write(user + " | " + password);
            fw.close();
        } catch (Exception e) {
        }
    }

    private int kiemTraDangNhap(String user, String password) {
        user = user.replaceAll("\\s+", "");
        password = password.replaceAll("\\s+", "");
        int result = 0;

        TaiKhoan tk = new TaiKhoan();
        tk.setTenDangNhap(user);
        tk.setMatKhau(password);

        DangNhapDAO dangNhapDAO = new DangNhapDAO();
        TaiKhoan account = dangNhapDAO.dangNhap(tk);

        if (user.length() <= 0 || password.length() <= 0) {
            result = EMPTY_ERROR;
        } else if (account == null) {
            result = WRONG_ERROR;
        }
        return result;
    }

}
