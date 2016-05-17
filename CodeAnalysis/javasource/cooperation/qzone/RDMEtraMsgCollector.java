package cooperation.qzone;

import android.view.View;
import android.view.ViewGroup;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class RDMEtraMsgCollector
{
  public static final int a = 5;
  private static RDMEtraMsgCollector a;
  public static final int b = 10;
  public static final int c = 10;
  public LoopQueue a;
  public LoopQueue b;
  public LoopQueue c;
  
  private RDMEtraMsgCollector()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_CooperationQzoneLoopQueue = new LoopQueue(5);
    b = new LoopQueue(10);
    c = new LoopQueue(10);
  }
  
  public static RDMEtraMsgCollector a()
  {
    try
    {
      if (jdField_a_of_type_CooperationQzoneRDMEtraMsgCollector == null) {
        jdField_a_of_type_CooperationQzoneRDMEtraMsgCollector = new RDMEtraMsgCollector();
      }
      RDMEtraMsgCollector localRDMEtraMsgCollector = jdField_a_of_type_CooperationQzoneRDMEtraMsgCollector;
      return localRDMEtraMsgCollector;
    }
    finally {}
  }
  
  public String a()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("activityNameQueue:\n");
    if (jdField_a_of_type_CooperationQzoneLoopQueue != null) {
      localStringBuilder.append(jdField_a_of_type_CooperationQzoneLoopQueue).append("\n");
    }
    localStringBuilder.append(" \n activityEventQueue:\n");
    if (b != null) {
      localStringBuilder.append(b);
    }
    localStringBuilder.append(" \n userActionQueue:\n");
    if (c != null) {
      localStringBuilder.append(c);
    }
    return localStringBuilder.toString();
  }
  
  public void a()
  {
    if (jdField_a_of_type_CooperationQzoneLoopQueue != null)
    {
      jdField_a_of_type_CooperationQzoneLoopQueue.a();
      jdField_a_of_type_CooperationQzoneLoopQueue = null;
    }
    if (b != null)
    {
      b.a();
      b = null;
    }
    if (c != null)
    {
      c.a();
      c = null;
    }
    jdField_a_of_type_CooperationQzoneRDMEtraMsgCollector = null;
  }
  
  public void a(String paramString)
  {
    if ((paramString != null) && (jdField_a_of_type_CooperationQzoneLoopQueue != null))
    {
      if (jdField_a_of_type_CooperationQzoneLoopQueue.a()) {
        jdField_a_of_type_CooperationQzoneLoopQueue.a();
      }
      jdField_a_of_type_CooperationQzoneLoopQueue.a(paramString);
    }
  }
  
  public void a(String paramString, View paramView)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[Actvity] ").append(paramString);
    if (paramView != null) {
      localStringBuilder.append("  click view  id:0x").append(Integer.toHexString(paramView.getId()));
    }
    c(localStringBuilder.toString());
  }
  
  public void a(String paramString, View paramView, int paramInt)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[Actvity] ").append(paramString);
    if (paramView != null) {
      localStringBuilder.append("  actionSheet click view  id:0x").append(Integer.toHexString(paramView.getId()));
    }
    localStringBuilder.append(" which:").append(paramInt);
    a().c(localStringBuilder.toString());
  }
  
  public void a(String paramString, ViewGroup paramViewGroup, View paramView, int paramInt, long paramLong)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[Actvity] ").append(paramString);
    if (paramViewGroup != null) {
      localStringBuilder.append("parent id: ").append(paramViewGroup.getId());
    }
    if (paramView != null) {
      localStringBuilder.append("view id: ").append(paramView.getId());
    }
    localStringBuilder.append(" onItemclick view  position:0x").append(Integer.toHexString(paramInt));
    localStringBuilder.append(" id").append(paramLong);
    a().c(localStringBuilder.toString());
  }
  
  public void b(String paramString)
  {
    if ((paramString != null) && (b != null))
    {
      if (b.a()) {
        b.a();
      }
      b.a(paramString);
    }
  }
  
  public void c(String paramString)
  {
    if ((paramString != null) && (c != null))
    {
      if (c.a()) {
        c.a();
      }
      c.a(paramString);
    }
  }
}
