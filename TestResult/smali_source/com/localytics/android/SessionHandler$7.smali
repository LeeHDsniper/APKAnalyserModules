.class Lcom/localytics/android/SessionHandler$7;
.super Ljava/lang/Object;
.source "SessionHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/SessionHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/SessionHandler;

.field final synthetic val$newSenderId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 616
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$7;->this$0:Lcom/localytics/android/SessionHandler;

    iput-object p2, p0, Lcom/localytics/android/SessionHandler$7;->val$newSenderId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 16

    .prologue
    const/4 v14, 0x0

    const/4 v13, 0x0

    .line 619
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$7;->this$0:Lcom/localytics/android/SessionHandler;

    # invokes: Lcom/localytics/android/SessionHandler;->isPushDisabled()Z
    invoke-static {v0}, Lcom/localytics/android/SessionHandler;->access$000(Lcom/localytics/android/SessionHandler;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 621
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_15

    .line 623
    const-string v0, "Localytics"

    const-string v1, "Push has been disabled"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 675
    :cond_15
    :goto_15
    return-void

    .line 629
    :cond_16
    const/4 v7, 0x0

    .line 631
    .local v7, "cursor":Landroid/database/Cursor;
    const/4 v11, 0x0

    .line 632
    .local v11, "senderId":Ljava/lang/String;
    const/4 v8, 0x0

    .line 633
    .local v8, "pushRegId":Ljava/lang/String;
    const/4 v9, 0x0

    .line 636
    .local v9, "pushRegVersion":Ljava/lang/String;
    :try_start_1a
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$7;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "info"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 638
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_4c

    .line 640
    const-string v0, "sender_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 641
    const-string v0, "registration_version"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 642
    const-string v0, "registration_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_4b
    .catchall {:try_start_1a .. :try_end_4b} :catchall_b2

    move-result-object v8

    .line 647
    :cond_4c
    if-eqz v7, :cond_52

    .line 649
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 650
    const/4 v7, 0x0

    .line 655
    :cond_52
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$7;->val$newSenderId:Ljava/lang/String;

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_75

    .line 657
    const/4 v8, 0x0

    .line 659
    new-instance v12, Landroid/content/ContentValues;

    invoke-direct {v12}, Landroid/content/ContentValues;-><init>()V

    .line 660
    .local v12, "values":Landroid/content/ContentValues;
    const-string v0, "sender_id"

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$7;->val$newSenderId:Ljava/lang/String;

    invoke-virtual {v12, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 661
    const-string v0, "registration_id"

    invoke-virtual {v12, v0, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$7;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "info"

    invoke-virtual {v0, v1, v12, v13, v13}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 665
    .end local v12    # "values":Landroid/content/ContentValues;
    :cond_75
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$7;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 668
    .local v6, "appVersion":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_89

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 670
    :cond_89
    new-instance v10, Landroid/content/Intent;

    const-string v0, "com.google.android.c2dm.intent.REGISTER"

    invoke-direct {v10, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 671
    .local v10, "registrationIntent":Landroid/content/Intent;
    const-string v0, "app"

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$7;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v1, v1, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-static {v1, v14, v2, v14}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 672
    const-string v0, "sender"

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$7;->val$newSenderId:Ljava/lang/String;

    invoke-virtual {v10, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 673
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$7;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v10}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto/16 :goto_15

    .line 647
    .end local v6    # "appVersion":Ljava/lang/String;
    .end local v10    # "registrationIntent":Landroid/content/Intent;
    :catchall_b2
    move-exception v0

    if-eqz v7, :cond_b9

    .line 649
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 650
    const/4 v7, 0x0

    :cond_b9
    throw v0
.end method
