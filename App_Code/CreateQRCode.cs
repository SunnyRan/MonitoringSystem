using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Drawing2D;
using ThoughtWorks.QRCode.Codec;
using System.Web.UI.WebControls;
using System.Text;

/// <summary>
///CreateQRCode 的摘要说明
/// </summary>
public class CreateQRCode
{
	public CreateQRCode()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    /// <summary>
    /// 生成二维码
    /// </summary>
    /// <param name="FileUpload_QRCode">上传图片控件</param>
    /// <param name="str">生成二维码网址</param>
    /// <param name="filename">保存二维码图片地址</param>
    /// <returns></returns>
    public static bool ToQRCode(FileUpload FileUpload_QRCode, string str, string filename)
    {
        QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
        qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE;
        qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.M;
        qrCodeEncoder.QRCodeVersion = 8;
        qrCodeEncoder.QRCodeScale = 4;
        //二维码
        Bitmap image = qrCodeEncoder.Encode(str, Encoding.Default);
        if (FileUpload_QRCode.HasFile)
        {
            string CodeLogo = FileUpload_QRCode.FileName;
            MyHelper.SaveAs(FileUpload_QRCode, System.Web.HttpContext.Current.Server.MapPath("../upload/"), CodeLogo);
            System.Drawing.Image bt = CombinImage(image, System.Web.HttpContext.Current.Server.MapPath(string.Format("../upload/{0}", CodeLogo)));
        }
        //将image保存到filename
        image.Save(filename);
        return true;
    }
    public static System.Drawing.Image CombinImage(System.Drawing.Image imgBack, string destImg)
    {
        System.Drawing.Image img = System.Drawing.Image.FromFile(destImg);        //照片图片     
        if (img.Height != 65 || img.Width != 65)
        {
            img = KiResizeImage(img, 65, 65, 0);
        }
        Graphics g = Graphics.FromImage(imgBack);

        g.DrawImage(imgBack, 0, 0, imgBack.Width, imgBack.Height);      //g.DrawImage(imgBack, 0, 0, 相框宽, 相框高);     

        //g.FillRectangle(System.Drawing.Brushes.White, imgBack.Width / 2 - img.Width / 2 - 1, imgBack.Width / 2 - img.Width / 2 - 1,1,1);//相片四周刷一层黑色边框    

        //g.DrawImage(img, 照片与相框的左边距, 照片与相框的上边距, 照片宽, 照片高);    

        g.DrawImage(img, imgBack.Width / 2 - img.Width / 2, imgBack.Width / 2 - img.Width / 2, img.Width, img.Height);
        GC.Collect();
        return imgBack;
    }


    /// <summary>    
    /// Resize图片    
    /// </summary>    
    /// <param name="bmp">原始Bitmap</param>    
    /// <param name="newW">新的宽度</param>    
    /// <param name="newH">新的高度</param>    
    /// <param name="Mode">保留着，暂时未用</param>    
    /// <returns>处理以后的图片</returns>    
    public static System.Drawing.Image KiResizeImage(System.Drawing.Image bmp, int newW, int newH, int Mode)
    {
        try
        {
            System.Drawing.Image b = new Bitmap(newW, newH);
            Graphics g = Graphics.FromImage(b);
            // 插值算法的质量    
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;
            g.DrawImage(bmp, new Rectangle(0, 0, newW, newH), new Rectangle(0, 0, bmp.Width, bmp.Height), GraphicsUnit.Pixel);
            g.Dispose();
            return b;
        }
        catch
        {
            return null;
        }
    }   
}