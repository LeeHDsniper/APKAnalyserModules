.class Lcom/localytics/android/LocalyticsAmpSession$3$1;
.super Ljava/lang/Object;
.source "LocalyticsAmpSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/LocalyticsAmpSession$3;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/LocalyticsAmpSession$3;


# direct methods
.method constructor <init>(Lcom/localytics/android/LocalyticsAmpSession$3;)V
    .registers 2

    .prologue
    .line 429
    iput-object p1, p0, Lcom/localytics/android/LocalyticsAmpSession$3$1;->this$1:Lcom/localytics/android/LocalyticsAmpSession$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 15

    .prologue
    .line 432
    const/4 v7, 0x0

    .line 434
    .local v7, "cursor":Landroid/database/Cursor;
    const/4 v11, 0x0

    .line 437
    .local v11, "pushRegId":Ljava/lang/String;
    :try_start_2
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpSession$3$1;->this$1:Lcom/localytics/android/LocalyticsAmpSession$3;

    iget-object v0, v0, Lcom/localytics/android/LocalyticsAmpSession$3;->val$provider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "info"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 439
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 441
    const-string v0, "registration_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_1f
    .catchall {:try_start_2 .. :try_end_1f} :catchall_9c

    move-result-object v11

    .line 446
    :cond_20
    if-eqz v7, :cond_26

    .line 448
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 449
    const/4 v7, 0x0

    .line 453
    :cond_26
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpSession$3$1;->this$1:Lcom/localytics/android/LocalyticsAmpSession$3;

    iget-object v0, v0, Lcom/localytics/android/LocalyticsAmpSession$3;->val$provider:Lcom/localytics/android/LocalyticsProvider;

    iget-object v1, p0, Lcom/localytics/android/LocalyticsAmpSession$3$1;->this$1:Lcom/localytics/android/LocalyticsAmpSession$3;

    iget-object v1, v1, Lcom/localytics/android/LocalyticsAmpSession$3;->val$apiKey:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/localytics/android/SessionHandler;->getInstallationId(Lcom/localytics/android/LocalyticsProvider;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 454
    .local v10, "installID":Ljava/lang/String;
    iget-object v0, p0, Lcom/localytics/android/LocalyticsAmpSession$3$1;->this$1:Lcom/localytics/android/LocalyticsAmpSession$3;

    iget-object v0, v0, Lcom/localytics/android/LocalyticsAmpSession$3;->val$provider:Lcom/localytics/android/LocalyticsProvider;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsProvider;->getUserIdAndType()Ljava/util/Map;

    move-result-object v0

    const-string v1, "id"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 455
    .local v8, "customerID":Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9b

    .line 457
    const-string v0, "http://pushapi.localytics.com/push_test?platform=android&type=prod&campaign=%s&creative=%s&token=%s&install_id=%s"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/localytics/android/LocalyticsAmpSession$3$1;->this$1:Lcom/localytics/android/LocalyticsAmpSession$3;

    iget-object v3, v3, Lcom/localytics/android/LocalyticsAmpSession$3;->val$campaign:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/localytics/android/LocalyticsAmpSession$3$1;->this$1:Lcom/localytics/android/LocalyticsAmpSession$3;

    iget-object v3, v3, Lcom/localytics/android/LocalyticsAmpSession$3;->val$creative:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v11, v1, v2

    const/4 v2, 0x3

    aput-object v10, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 460
    .local v13, "url":Ljava/lang/String;
    :try_start_65
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 461
    .local v6, "client":Lorg/apache/http/client/HttpClient;
    new-instance v12, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v12, v13}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 462
    .local v12, "request":Lorg/apache/http/client/methods/HttpGet;
    const-string v0, "x-install-id"

    invoke-virtual {v12, v0, v10}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    const-string v0, "x-app-id"

    iget-object v1, p0, Lcom/localytics/android/LocalyticsAmpSession$3$1;->this$1:Lcom/localytics/android/LocalyticsAmpSession$3;

    iget-object v1, v1, Lcom/localytics/android/LocalyticsAmpSession$3;->val$apiKey:Ljava/lang/String;

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    const-string v0, "x-client-version"

    const-string v1, "androida_2.70"

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 465
    const-string v0, "x-app-version"

    iget-object v1, p0, Lcom/localytics/android/LocalyticsAmpSession$3$1;->this$1:Lcom/localytics/android/LocalyticsAmpSession$3;

    iget-object v1, v1, Lcom/localytics/android/LocalyticsAmpSession$3;->this$0:Lcom/localytics/android/LocalyticsAmpSession;

    iget-object v1, v1, Lcom/localytics/android/LocalyticsAmpSession;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/localytics/android/DatapointHelper;->getAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v12, v0, v1}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 466
    const-string v0, "x-customer-id"

    invoke-virtual {v12, v0, v8}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    invoke-interface {v6, v12}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_9b
    .catch Ljava/io/IOException; {:try_start_65 .. :try_end_9b} :catch_a4

    .line 474
    .end local v6    # "client":Lorg/apache/http/client/HttpClient;
    .end local v12    # "request":Lorg/apache/http/client/methods/HttpGet;
    .end local v13    # "url":Ljava/lang/String;
    :cond_9b
    :goto_9b
    return-void

    .line 446
    .end local v8    # "customerID":Ljava/lang/String;
    .end local v10    # "installID":Ljava/lang/String;
    :catchall_9c
    move-exception v0

    if-eqz v7, :cond_a3

    .line 448
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 449
    const/4 v7, 0x0

    :cond_a3
    throw v0

    .line 469
    .restart local v8    # "customerID":Ljava/lang/String;
    .restart local v10    # "installID":Ljava/lang/String;
    .restart local v13    # "url":Ljava/lang/String;
    :catch_a4
    move-exception v9

    .line 471
    .local v9, "e":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_9b
.end method
