package org.xianghuan.util;


import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class OnlineListener
  implements ServletContextListener, ServletContextAttributeListener, HttpSessionListener, HttpSessionAttributeListener, HttpSessionActivationListener, HttpSessionBindingListener, ServletRequestListener, ServletRequestAttributeListener
{
  private static final Logger logger = Logger.getLogger(OnlineListener.class);
  public static ApplicationContext ctx = null;
  
  public void requestDestroyed(ServletRequestEvent arg0) {}
  
  public void attributeAdded(HttpSessionBindingEvent evt)
  {
    String name = evt.getName();
    logger.debug("向session存入属性：" + name);
  }
  
  public void contextInitialized(ServletContextEvent evt)
  {
    logger.debug("服务器启动");
    ctx = WebApplicationContextUtils.getWebApplicationContext(evt.getServletContext());
  }
  
  public void sessionDidActivate(HttpSessionEvent arg0) {}
  
  public void valueBound(HttpSessionBindingEvent arg0) {}
  
  public void attributeAdded(ServletContextAttributeEvent arg0) {}
  
  public void attributeRemoved(ServletContextAttributeEvent arg0) {}
  
  public void sessionDestroyed(HttpSessionEvent evt)
  {
    HttpSession session = evt.getSession();
  }
  
  public void attributeRemoved(HttpSessionBindingEvent arg0) {}
  
  public void attributeAdded(ServletRequestAttributeEvent evt) {}
  
  public void valueUnbound(HttpSessionBindingEvent arg0) {}
  
  public void sessionWillPassivate(HttpSessionEvent arg0) {}
  
  public void sessionCreated(HttpSessionEvent arg0) {}
  
  public void attributeReplaced(HttpSessionBindingEvent arg0) {}
  
  public void attributeReplaced(ServletContextAttributeEvent arg0) {}
  
  public void attributeRemoved(ServletRequestAttributeEvent arg0) {}
  
  public void contextDestroyed(ServletContextEvent evt)
  {
    logger.debug("服务器关闭");
  }
  
  public void attributeReplaced(ServletRequestAttributeEvent arg0) {}
  
  public void requestInitialized(ServletRequestEvent arg0) {}
}
