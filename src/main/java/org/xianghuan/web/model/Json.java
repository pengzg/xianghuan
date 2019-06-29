package org.xianghuan.web.model;

public class Json
{
  private boolean success = false;
  private String msg = "";
  private Object obj = null;
  
  public Json() {}
  
  public Json(boolean success)
  {
    this.success = success;
  }
  
  public boolean isSuccess()
  {
    return this.success;
  }
  
  public void setSuccess(boolean success)
  {
    this.success = success;
  }
  
  public String getMsg()
  {
    return this.msg;
  }
  
  public void setMsg(String msg)
  {
    this.msg = msg;
  }
  
  public Object getObj()
  {
    return this.obj;
  }
  
  public void setObj(Object obj)
  {
    this.obj = obj;
  }
}
