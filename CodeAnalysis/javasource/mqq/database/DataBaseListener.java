package mqq.database;

public abstract interface DataBaseListener
{
  public abstract void onCreate(EncryptedDatabase paramEncryptedDatabase);
  
  public abstract void onOpen(EncryptedDatabase paramEncryptedDatabase);
  
  public abstract void onUpgrade(EncryptedDatabase paramEncryptedDatabase, int paramInt1, int paramInt2);
}
