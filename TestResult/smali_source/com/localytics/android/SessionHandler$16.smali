.class Lcom/localytics/android/SessionHandler$16;
.super Ljava/lang/Object;
.source "SessionHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/SessionHandler;->setCustomDimension(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/SessionHandler;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/SessionHandler;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 2306
    iput-object p1, p0, Lcom/localytics/android/SessionHandler$16;->this$0:Lcom/localytics/android/SessionHandler;

    iput-object p2, p0, Lcom/localytics/android/SessionHandler$16;->val$key:Ljava/lang/String;

    iput-object p3, p0, Lcom/localytics/android/SessionHandler$16;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 10

    .prologue
    .line 2309
    const/4 v6, 0x0

    .line 2312
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_1
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$16;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "custom_dimensions"

    # getter for: Lcom/localytics/android/SessionHandler;->PROJECTION_SET_CUSTOM_DIMENSION:[Ljava/lang/String;
    invoke-static {}, Lcom/localytics/android/SessionHandler;->access$100()[Ljava/lang/String;

    move-result-object v2

    # getter for: Lcom/localytics/android/SessionHandler;->SELECTION_SET_CUSTOM_DIMENSION:Ljava/lang/String;
    invoke-static {}, Lcom/localytics/android/SessionHandler;->access$200()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    iget-object v8, p0, Lcom/localytics/android/SessionHandler$16;->val$key:Ljava/lang/String;

    aput-object v8, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 2314
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_7d

    .line 2316
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$16;->val$value:Ljava/lang/String;

    if-nez v0, :cond_4c

    .line 2318
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$16;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "custom_dimensions"

    const-string v2, "%s = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "custom_dimension_key"

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/localytics/android/SessionHandler$16;->val$key:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_45
    .catchall {:try_start_1 .. :try_end_45} :catchall_75

    .line 2342
    :cond_45
    :goto_45
    if-eqz v6, :cond_4b

    .line 2344
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2345
    const/4 v6, 0x0

    .line 2348
    :cond_4b
    return-void

    .line 2322
    :cond_4c
    :try_start_4c
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 2323
    .local v7, "values":Landroid/content/ContentValues;
    const-string v0, "custom_dimension_key"

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$16;->val$key:Ljava/lang/String;

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2324
    const-string v0, "custom_dimension_value"

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$16;->val$value:Ljava/lang/String;

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2325
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$16;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "custom_dimensions"

    # getter for: Lcom/localytics/android/SessionHandler;->SELECTION_SET_CUSTOM_DIMENSION:Ljava/lang/String;
    invoke-static {}, Lcom/localytics/android/SessionHandler;->access$200()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/localytics/android/SessionHandler$16;->val$key:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v7, v2, v3}, Lcom/localytics/android/LocalyticsProvider;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_74
    .catchall {:try_start_4c .. :try_end_74} :catchall_75

    goto :goto_45

    .line 2342
    .end local v7    # "values":Landroid/content/ContentValues;
    :catchall_75
    move-exception v0

    if-eqz v6, :cond_7c

    .line 2344
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2345
    const/4 v6, 0x0

    :cond_7c
    throw v0

    .line 2330
    :cond_7d
    :try_start_7d
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$16;->val$value:Ljava/lang/String;

    if-eqz v0, :cond_45

    .line 2332
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 2333
    .restart local v7    # "values":Landroid/content/ContentValues;
    const-string v0, "custom_dimension_key"

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$16;->val$key:Ljava/lang/String;

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2334
    const-string v0, "custom_dimension_value"

    iget-object v1, p0, Lcom/localytics/android/SessionHandler$16;->val$value:Ljava/lang/String;

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2335
    iget-object v0, p0, Lcom/localytics/android/SessionHandler$16;->this$0:Lcom/localytics/android/SessionHandler;

    iget-object v0, v0, Lcom/localytics/android/SessionHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "custom_dimensions"

    invoke-virtual {v0, v1, v7}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_9d
    .catchall {:try_start_7d .. :try_end_9d} :catchall_75

    goto :goto_45
.end method
