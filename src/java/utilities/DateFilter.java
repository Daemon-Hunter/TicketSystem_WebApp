/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author Ruth
 */
public class DateFilter {
    
    
    public Date getDate(String date)
    {
        DateFormat format = new SimpleDateFormat("MM/dd/YYYY", Locale.ENGLISH);
        try {
            Date formattedDate = format.parse(date);
            return formattedDate;
        }
        catch (ParseException ex)
        {
            
        }
        
        return null;
    }
    
}
