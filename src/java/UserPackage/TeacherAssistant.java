package UserPackage;
/**
 * class representing a Teacher Assistant
 * extends the User superclass
 * @author Leo
 */
public class TeacherAssistant extends User {
    
    private Course assistantFor;
    
    /**
     * constructor for the TeacherAssistant class
     */
    public TeacherAssistant(){
        super();
    }
    
    /**
     * method to view submissions.
     * @return 
     */
    public Assignment viewSubmissions(){
        return null;
    }
    
    /**
     * method to mark assignments
     * @param as
     * @param i 
     */
    public void markAssignment(Assignment as, int i){
        
    }
    
    /**
     * method to leave a comment on an assignment
     * @param as
     * @param s 
     */
    public void leaveComment(Assignment as, String s){
        
    }
    
    
}
