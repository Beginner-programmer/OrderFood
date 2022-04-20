import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

/**
 * @Author Wangbaba
 * @Date 2021/12/10 20:19
 * @Version 1.0
 */
@WebServlet("/updatafood")
public class UpdataFoodServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();
        String id = "";
        String foodname = "";
        String foodinf = "";
        String price = "";
        String foodtype = "";
        String img = "";

        //创建一个实体类
        //创建两个变量保存
        String value = "";
        String uploadfile = "";//上传的文件名
        String fileName = "";//普通的文件名
        //定义上传的的文件位置，默认上传到服务器里面的file文件夹中
        //上传到服务器地址
        //  String filePath = req.getSession().getServletContext().getRealPath("/images");
        //上传到本地文件夹地址
        String filePath = "F:/IJfile/orderfood/src/main/webapp/images";
        //检验页面中是否是按照二进制的形式上传
        boolean isMultipar = ServletFileUpload.isMultipartContent(req);
        if (isMultipar) {
            //创建一个FileItemeFacteri
            FileItemFactory fac = new DiskFileItemFactory();
            //通过这个工厂对象来创建一个执行文件上传的对象
            ServletFileUpload upload = new ServletFileUpload(fac);
            //获得上传表单并进行解析
            try {
                List<FileItem> items = upload.parseRequest(req);
                //创建一个遍历集合的迭代器
                Iterator<FileItem> its = items.iterator();
                while (its.hasNext()) {
                    FileItem fileItem = (FileItem) its.next();
                    //判断该元素是否是普通元素
                    if (fileItem.isFormField()) {
                        //获得表单中的name值
                        fileName = fileItem.getFieldName();
                        ///获得表单中里面的属性值
                        if (fileName.equals("foodid")) {
                            value = fileItem.getString("UTF-8");
                            id = value;
                        } else if (fileName.equals("foodname")) {
                            value = fileItem.getString("UTF-8");
                            foodname = value;
                        } else if (fileName.equals("foodinf")) {
                            value = fileItem.getString("UTF-8");
                            foodinf = value;
                        } else if (fileName.equals("price")) {
                            value = fileItem.getString("UTF-8");
                            price = value;
                        } else if (fileName.equals("foodtype")) {
                            value = fileItem.getString("UTF-8");
                            foodtype = value;
                        }
                    } else {
                        //上传文件
                        //获得上传文件的名称
                        String uploadName = fileItem.getName();
                        System.out.println(uploadName);
                        //判断上传表单元素是否为空
                        if (uploadName == null || "".equals(uploadName)) {
                            uploadfile="";
                        }else {
                            File fullFile = new File(uploadName);
                            //需要将这个文件对象保存到服务器中
                            File saveFile = new File(filePath, fullFile.getName());
                            //将这个文件对象写入到指定位置里
                            fileItem.write(saveFile);
                            uploadfile = fullFile.getName();
                            System.out.println("上传文件成功，它的位置是：" + uploadfile);
                            System.out.println("上传的保存路径：" + filePath);
                        }
                    }
                }
            } catch (FileUploadException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            foodService food = new foodService();
            int f = 0;
            if (foodname != null && foodinf != null && price != null && foodtype != null) {
                if (uploadfile != null) {
                    img = "images/" + uploadfile;
                }
                foodEntity fe = new foodEntity();
                fe.setId(Integer.valueOf(id));
                fe.setFoodname(foodname);
                fe.setFoodinf(foodinf);
                fe.setFoodtypeid(Integer.valueOf(foodtype));
                fe.setPrice(Float.valueOf(price));
                fe.setPicture(img);
                try {
                    f = food.updataf(fe);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (f == 1) {
                    //修改成功
                    session.setAttribute("backmsg", 3);
                    resp.sendRedirect("back.jsp");
                } else {
                    //修改失败
                    session.setAttribute("backmsg", 4);
                    resp.sendRedirect("back.jsp");
                }
            } else {
                //为空返回
                session.setAttribute("backmsg", 0);
                resp.sendRedirect("back.jsp");
            }
        }
    }
}
