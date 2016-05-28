.class Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;
.super Ljava/lang/Object;
.source "AdobeBillingContentManager.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->queryInternal(Ljava/util/List;)Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

.field final synthetic val$skus:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Ljava/util/List;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .prologue
    .line 208
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 208
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;>;"
    const/4 v7, 0x1

    const/4 v3, 0x0

    .line 211
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "queryInternal. list size: %d, thread: %s"

    const/4 v2, 0x2

    new-array v6, v2, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    if-eqz v2, :cond_44

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    .line 213
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    :goto_13
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    aput-object v2, v6, v7

    .line 211
    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 214
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 216
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mManager:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$100(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->isAuthenticated()Z

    move-result v2

    if-nez v2, :cond_46

    .line 217
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_43

    .line 218
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    move-result-object v2

    invoke-virtual {p1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 219
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    .line 262
    :cond_43
    :goto_43
    return-void

    :cond_44
    move v2, v3

    .line 213
    goto :goto_13

    .line 224
    :cond_46
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    if-eqz v2, :cond_66

    .line 225
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->filterList(Ljava/util/List;)V
    invoke-static {v2, v4}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$400(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Ljava/util/List;)V

    .line 226
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "list size is now: %d"

    new-array v5, v7, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-interface {v2, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 230
    :cond_66
    :try_start_66
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    if-eqz v2, :cond_81

    .line 231
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "checking %d skus"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 234
    :cond_81
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    if-eqz v2, :cond_8d

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I
    :try_end_8a
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_8a} :catch_e1

    move-result v2

    if-lez v2, :cond_ce

    .line 235
    :cond_8d
    const/4 v1, 0x0

    .line 237
    .local v1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    :try_start_8e
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->getUserId()Ljava/lang/String;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$500(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_b0

    .line 238
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    .line 240
    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mContext:Landroid/content/Context;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->getUserId()Ljava/lang/String;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$500(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->queryPurchases(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;
    :try_end_af
    .catch Ljava/lang/Exception; {:try_start_8e .. :try_end_af} :catch_dc

    move-result-object v1

    .line 246
    :cond_b0
    :goto_b0
    if-eqz v1, :cond_ce

    .line 247
    :try_start_b2
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    move-result-object v3

    monitor-enter v3
    :try_end_b9
    .catch Ljava/lang/Exception; {:try_start_b2 .. :try_end_b9} :catch_e1

    .line 248
    :try_start_b9
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    if-eqz v2, :cond_e6

    .line 249
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->val$skus:Ljava/util/List;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mergeArray(Ljava/util/Collection;)V
    invoke-static {v2, v4}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$600(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Ljava/util/Collection;)V

    .line 253
    :goto_c4
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->addAll(Ljava/util/HashMap;)V

    .line 254
    monitor-exit v3
    :try_end_ce
    .catchall {:try_start_b9 .. :try_end_ce} :catchall_f0

    .line 260
    .end local v1    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    :cond_ce
    :goto_ce
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    move-result-object v2

    invoke-virtual {p1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 261
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    goto/16 :goto_43

    .line 242
    .restart local v1    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    :catch_dc
    move-exception v0

    .line 243
    .local v0, "e":Ljava/lang/Exception;
    :try_start_dd
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_e0
    .catch Ljava/lang/Exception; {:try_start_dd .. :try_end_e0} :catch_e1

    goto :goto_b0

    .line 257
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    :catch_e1
    move-exception v0

    .line 258
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_ce

    .line 251
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    :cond_e6
    :try_start_e6
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v4

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->mergeArrays(Ljava/util/Collection;)V
    invoke-static {v2, v4}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;->access$700(Lcom/adobe/creativesdk/aviary/internal/account/AdobeBillingContentManager;Ljava/util/Collection;)V

    goto :goto_c4

    .line 254
    :catchall_f0
    move-exception v2

    monitor-exit v3
    :try_end_f2
    .catchall {:try_start_e6 .. :try_end_f2} :catchall_f0

    :try_start_f2
    throw v2
    :try_end_f3
    .catch Ljava/lang/Exception; {:try_start_f2 .. :try_end_f3} :catch_e1
.end method
