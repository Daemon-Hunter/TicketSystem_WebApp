/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.IOException;
import net.coobird.thumbnailator.Thumbnails;

/**
 *
 * @author Ruth
 */
public class ImageScale {
    
    public static BufferedImage resize(BufferedImage img, int newWidth, int newHeight)
    {
        try {
        return Thumbnails.of(img).size(newWidth, newHeight).asBufferedImage();
        }
        catch(IOException ex)
        {
            return null;
        }
    }
    
}
