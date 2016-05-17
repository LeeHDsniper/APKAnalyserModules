import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class rfa
  extends rez
{
  static final long d = 2000L;
  static final long e = 60000L;
  static final long f = 10000L;
  public long c;
  public boolean d;
  public int j;
  public int k;
  public int l;
  public int m;
  
  public rfa(float paramFloat1, int paramInt1, int paramInt2, float paramFloat2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
  {
    super(paramFloat1, paramInt1, paramInt2, paramFloat2, paramInt3, paramInt4, paramInt5, paramInt6);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    d = false;
    j = 80;
    k = 70;
    l = 5;
    c = 0L;
    l = (paramInt1 % 1000);
    k = (paramInt1 / 1000 % 1000);
    j = (paramInt1 / 1000 / 1000 % 1000);
  }
  
  void a(int[] paramArrayOfInt)
  {
    boolean bool = true;
    j = paramArrayOfInt[0];
    k = paramArrayOfInt[1];
    l = paramArrayOfInt[2];
    if (paramArrayOfInt[3] == 1) {}
    for (;;)
    {
      d = bool;
      return;
      bool = false;
    }
  }
}
