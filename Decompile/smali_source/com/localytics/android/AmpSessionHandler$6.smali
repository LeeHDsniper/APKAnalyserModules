.class Lcom/localytics/android/AmpSessionHandler$6;
.super Lcom/localytics/android/AmpCallable;
.source "AmpSessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->showAmpTest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpSessionHandler;


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpSessionHandler;)V
    .registers 2

    .prologue
    .line 403
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$6;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 407
    const/4 v8, 0x0

    .line 408
    .local v8, "registrationId":Ljava/lang/String;
    const/4 v7, 0x0

    .line 412
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_4
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$6;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "info"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 414
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 416
    const-string v0, "registration_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_21
    .catchall {:try_start_4 .. :try_end_21} :catchall_60

    move-result-object v8

    .line 421
    :cond_22
    if-eqz v7, :cond_28

    .line 423
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 424
    const/4 v7, 0x0

    .line 428
    :cond_28
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_68

    .line 430
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$6;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/localytics/android/AmpSessionHandler$6;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v1, v1, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/ClipboardManager;

    .line 431
    .local v6, "clipboard":Landroid/content/ClipboardManager;
    invoke-virtual {v6, v8}, Landroid/content/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 432
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$6;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " has been copied to the clipboard."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 439
    .end local v6    # "clipboard":Landroid/content/ClipboardManager;
    :goto_5f
    return-object v9

    .line 421
    :catchall_60
    move-exception v0

    if-eqz v7, :cond_67

    .line 423
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 424
    const/4 v7, 0x0

    :cond_67
    throw v0

    .line 436
    :cond_68
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$6;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler;->mContext:Landroid/content/Context;

    const-string v1, "No push token found. Please check your integration."

    invoke-static {v0, v1, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_5f
.end method
