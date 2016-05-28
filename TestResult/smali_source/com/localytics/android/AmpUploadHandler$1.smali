.class Lcom/localytics/android/AmpUploadHandler$1;
.super Ljava/lang/Object;
.source "AmpUploadHandler.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/AmpUploadHandler;->saveAMPMessage(Ljava/util/Map;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AmpUploadHandler;

.field final synthetic val$ampMessage:Ljava/util/Map;

.field final synthetic val$campaignId:I


# direct methods
.method constructor <init>(Lcom/localytics/android/AmpUploadHandler;ILjava/util/Map;)V
    .registers 4

    .prologue
    .line 334
    iput-object p1, p0, Lcom/localytics/android/AmpUploadHandler$1;->this$0:Lcom/localytics/android/AmpUploadHandler;

    iput p2, p0, Lcom/localytics/android/AmpUploadHandler$1;->val$campaignId:I

    iput-object p3, p0, Lcom/localytics/android/AmpUploadHandler$1;->val$ampMessage:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v14, 0x1

    const/4 v13, 0x0

    .line 337
    const/4 v10, 0x0

    .local v10, "ruleId":I
    const/4 v8, 0x0

    .line 340
    .local v8, "localVersion":I
    const/4 v6, 0x0

    .line 343
    .local v6, "cursorRule":Landroid/database/Cursor;
    :try_start_5
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler$1;->this$0:Lcom/localytics/android/AmpUploadHandler;

    iget-object v0, v0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "amp_rules"

    # getter for: Lcom/localytics/android/AmpUploadHandler;->PROJECTION_AMP_RULE_RECORD:[Ljava/lang/String;
    invoke-static {}, Lcom/localytics/android/AmpUploadHandler;->access$000()[Ljava/lang/String;

    move-result-object v2

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v12, "campaign_id"

    aput-object v12, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget v12, p0, Lcom/localytics/android/AmpUploadHandler$1;->val$campaignId:I

    invoke-static {v12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 344
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_48

    .line 346
    const-string v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 347
    const-string v0, "version"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_47
    .catchall {:try_start_5 .. :try_end_47} :catchall_95

    move-result v8

    .line 352
    :cond_48
    if-eqz v6, :cond_4d

    .line 354
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 359
    :cond_4d
    if-lez v10, :cond_e7

    .line 361
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_6f

    .line 363
    const-string v0, "Localytics"

    const-string v1, "Existing AMP rule already exists for this campaign\n\t campaignID = %d\n\t ruleID = %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/localytics/android/AmpUploadHandler$1;->val$campaignId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v13

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v14

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 366
    :cond_6f
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler$1;->val$ampMessage:Ljava/util/Map;

    const-string v1, "version"

    invoke-static {v0, v1}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v9

    .line 367
    .local v9, "remoteVersion":I
    if-lt v8, v9, :cond_9c

    .line 369
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_90

    .line 371
    const-string v0, "Localytics"

    const-string v1, "No update needed. Campaign version has not been updated\n\t version: %d"

    new-array v2, v14, [Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v13

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    :cond_90
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 403
    .end local v9    # "remoteVersion":I
    :goto_94
    return-object v0

    .line 352
    :catchall_95
    move-exception v0

    if-eqz v6, :cond_9b

    .line 354
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_9b
    throw v0

    .line 377
    .restart local v9    # "remoteVersion":I
    :cond_9c
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler$1;->this$0:Lcom/localytics/android/AmpUploadHandler;

    iget-object v1, p0, Lcom/localytics/android/AmpUploadHandler$1;->val$ampMessage:Ljava/util/Map;

    # invokes: Lcom/localytics/android/AmpUploadHandler;->parseAmpMessage(Ljava/util/Map;)Landroid/content/ContentValues;
    invoke-static {v0, v1}, Lcom/localytics/android/AmpUploadHandler;->access$100(Lcom/localytics/android/AmpUploadHandler;Ljava/util/Map;)Landroid/content/ContentValues;

    move-result-object v11

    .line 378
    .local v11, "values":Landroid/content/ContentValues;
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler$1;->this$0:Lcom/localytics/android/AmpUploadHandler;

    iget-object v0, v0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "amp_rules"

    # getter for: Lcom/localytics/android/AmpUploadHandler;->SELECTION_UPDATE_AMP_RULE:Ljava/lang/String;
    invoke-static {}, Lcom/localytics/android/AmpUploadHandler;->access$200()Ljava/lang/String;

    move-result-object v2

    new-array v3, v14, [Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v13

    invoke-virtual {v0, v1, v11, v2, v3}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v10

    .line 392
    .end local v9    # "remoteVersion":I
    :goto_ba
    if-lez v10, :cond_e2

    .line 395
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler$1;->this$0:Lcom/localytics/android/AmpUploadHandler;

    int-to-long v2, v10

    iget-object v1, p0, Lcom/localytics/android/AmpUploadHandler$1;->val$ampMessage:Ljava/util/Map;

    const-string v4, "conditions"

    invoke-static {v1, v4}, Lcom/localytics/android/JsonHelper;->getSafeListFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    # invokes: Lcom/localytics/android/AmpUploadHandler;->saveAmpConditions(JLjava/util/List;)V
    invoke-static {v0, v2, v3, v1}, Lcom/localytics/android/AmpUploadHandler;->access$300(Lcom/localytics/android/AmpUploadHandler;JLjava/util/List;)V

    .line 399
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler$1;->val$ampMessage:Ljava/util/Map;

    const-string v1, "display_events"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/JsonHelper;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONArray;

    invoke-static {v0}, Lcom/localytics/android/JsonHelper;->toList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v7

    .line 400
    .local v7, "eventNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler$1;->this$0:Lcom/localytics/android/AmpUploadHandler;

    int-to-long v2, v10

    # invokes: Lcom/localytics/android/AmpUploadHandler;->bindRuleToEvents(JLjava/util/List;)V
    invoke-static {v0, v2, v3, v7}, Lcom/localytics/android/AmpUploadHandler;->access$400(Lcom/localytics/android/AmpUploadHandler;JLjava/util/List;)V

    .line 403
    .end local v7    # "eventNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_e2
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_94

    .line 383
    .end local v11    # "values":Landroid/content/ContentValues;
    :cond_e7
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_f2

    .line 385
    const-string v0, "Localytics"

    const-string v1, "AMP campaign not found. Creating a new one."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 388
    :cond_f2
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler$1;->this$0:Lcom/localytics/android/AmpUploadHandler;

    iget-object v1, p0, Lcom/localytics/android/AmpUploadHandler$1;->val$ampMessage:Ljava/util/Map;

    # invokes: Lcom/localytics/android/AmpUploadHandler;->parseAmpMessage(Ljava/util/Map;)Landroid/content/ContentValues;
    invoke-static {v0, v1}, Lcom/localytics/android/AmpUploadHandler;->access$100(Lcom/localytics/android/AmpUploadHandler;Ljava/util/Map;)Landroid/content/ContentValues;

    move-result-object v11

    .line 389
    .restart local v11    # "values":Landroid/content/ContentValues;
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler$1;->this$0:Lcom/localytics/android/AmpUploadHandler;

    iget-object v0, v0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "amp_rules"

    invoke-virtual {v0, v1, v11}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    long-to-int v10, v0

    goto :goto_ba
.end method
