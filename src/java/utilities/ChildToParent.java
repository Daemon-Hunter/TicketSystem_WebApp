/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import events.IArtist;
import events.IChildEvent;
import events.IParentEvent;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ruth
 */
public class ChildToParent {
    
    IArtist artist;
    List<IParentEvent> parents;
    
    public ChildToParent(IArtist i)
    {
        artist = i;
        parents = new LinkedList();
    }
    
    public List<IParentEvent> getParents()
    {
        try {
            List<IChildEvent> children = artist.getChildEvents();
            for (IChildEvent child: children)
            {
                
                IParentEvent p = child.getParentEvent();
                if (!parents.contains(p))
                        parents.add(p);
            }
            
        } catch (IOException ex) {
            Logger.getLogger(ChildToParent.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return parents;
    }
    
}
