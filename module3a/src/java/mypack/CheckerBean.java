
package mypack;


public class CheckerBean {
    String n1,n2,n3,n4,n5,error;
    public void CheckerBean()
    {
        error="";
    }
    public void setN1(String n)
    {
        n1=n;
    }
    public void setN2 (String n)
    {
        n2=n;
    }
    public void setN3(String n)
    {
        n3=n;
    }
    public void setN4(String n)
    {
        n4=n;
    }
    public void setN5(String n)
    {
        n5=n;
    }
    public void setError(String n)
    {
        error=n;
    }
    
    public String getN1()
    {
        return n1;
    }
    public String getN2()
    {
        return n2;
    }
    public String getN3()
    {
        return n3;
    }
    public String getN4()
    {
        return n4;
    }
    public String getN5()
    {
        return n5;
    }
    public String getError()
    {
        return error;
    }
    public boolean validate()
    {
        boolean res=true;
        if(n1.trim().equals("") || (n1==null))
        {
            error+="<br>Enter First Name";
            res=false;
        }
        if(n2.length() > 2 || (n2==null))
        {
            error+="<br>Age Invalid";
            res=false;
        }
        return res;
    }
}
