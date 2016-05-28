.class Lcom/localytics/android/AmpSessionHandler$12;
.super Lcom/localytics/android/AmpCallable;
.source "AmpSessionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpSessionHandler;->getJavaScriptClientCallbacks(Ljava/util/Map;)Ljava/util/Map;
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
    .line 856
    iput-object p1, p0, Lcom/localytics/android/AmpSessionHandler$12;->this$0:Lcom/localytics/android/AmpSessionHandler;

    invoke-direct {p0}, Lcom/localytics/android/AmpCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    const/4 v13, 0x0

    .line 860
    const/4 v6, 0x0

    .line 863
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_2
    iget-object v0, p0, Lcom/localytics/android/AmpSessionHandler$12;->this$0:Lcom/localytics/android/AmpSessionHandler;

    iget-object v0, v0, Lcom/localytics/android/AmpSessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "identifiers"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 865
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_13
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_13} :catch_41
    .catchall {:try_start_2 .. :try_end_13} :catchall_60

    move-result v0

    if-nez v0, :cond_1e

    .line 894
    if-eqz v6, :cond_1c

    .line 896
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 897
    const/4 v6, 0x0

    :cond_1c
    move-object v0, v13

    :cond_1d
    :goto_1d
    return-object v0

    .line 870
    :cond_1e
    :try_start_1e
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 872
    .local v8, "jsonIdentifiers":Lorg/json/JSONObject;
    const-string v0, "key"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    .line 873
    .local v10, "keyColumn":I
    const-string v0, "value"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v12

    .line 874
    .local v12, "valueColumn":I
    :goto_2f
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_55

    .line 876
    invoke-interface {v6, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 877
    .local v9, "key":Ljava/lang/String;
    invoke-interface {v6, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 879
    .local v11, "value":Ljava/lang/String;
    invoke-virtual {v8, v9, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_40
    .catch Lorg/json/JSONException; {:try_start_1e .. :try_end_40} :catch_41
    .catchall {:try_start_1e .. :try_end_40} :catchall_60

    goto :goto_2f

    .line 884
    .end local v8    # "jsonIdentifiers":Lorg/json/JSONObject;
    .end local v9    # "key":Ljava/lang/String;
    .end local v10    # "keyColumn":I
    .end local v11    # "value":Ljava/lang/String;
    .end local v12    # "valueColumn":I
    :catch_41
    move-exception v7

    .line 886
    .local v7, "e":Lorg/json/JSONException;
    :try_start_42
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_4d

    .line 888
    const-string v0, "Localytics"

    const-string v1, "[JavaScriptClient]: Failed to get identifiers"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4d
    .catchall {:try_start_42 .. :try_end_4d} :catchall_60

    .line 894
    :cond_4d
    if-eqz v6, :cond_53

    .line 896
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 897
    const/4 v6, 0x0

    :cond_53
    move-object v0, v13

    goto :goto_1d

    .line 882
    .end local v7    # "e":Lorg/json/JSONException;
    .restart local v8    # "jsonIdentifiers":Lorg/json/JSONObject;
    .restart local v10    # "keyColumn":I
    .restart local v12    # "valueColumn":I
    :cond_55
    :try_start_55
    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_58
    .catch Lorg/json/JSONException; {:try_start_55 .. :try_end_58} :catch_41
    .catchall {:try_start_55 .. :try_end_58} :catchall_60

    move-result-object v0

    .line 894
    if-eqz v6, :cond_1d

    .line 896
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 897
    const/4 v6, 0x0

    goto :goto_1d

    .line 894
    .end local v8    # "jsonIdentifiers":Lorg/json/JSONObject;
    .end local v10    # "keyColumn":I
    .end local v12    # "valueColumn":I
    :catchall_60
    move-exception v0

    if-eqz v6, :cond_67

    .line 896
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 897
    const/4 v6, 0x0

    :cond_67
    throw v0
.end method
