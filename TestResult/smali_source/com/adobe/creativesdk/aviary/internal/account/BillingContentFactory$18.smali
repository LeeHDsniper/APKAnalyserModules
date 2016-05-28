.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->filterPurchaseMap(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;
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
        "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

.field final synthetic val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 659
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 659
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 662
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;>;"
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "filterPurchaseMap {%s}"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v2, v3, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 663
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "input: %s, current cache: %d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;
    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v2, v3, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 665
    invoke-virtual/range {p1 .. p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 740
    :cond_3b
    :goto_3b
    return-void

    .line 669
    :cond_3c
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 671
    const/4 v2, 0x4

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "pack_id"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "content_isFree"

    aput-object v3, v4, v2

    const/4 v2, 0x2

    const-string v3, "content_isFreeWithLogin"

    aput-object v3, v4, v2

    const/4 v2, 0x3

    const-string v3, "content_purchased"

    aput-object v3, v4, v2

    .line 678
    .local v4, "projection":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->googleMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .line 679
    .local v13, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Ljava/lang/String;>;>;"
    :goto_64
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c6

    .line 680
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map$Entry;

    .line 681
    .local v10, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Ljava/lang/String;>;"
    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v16

    .line 682
    .local v16, "packId":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mDownloadCacheMap:Ljava/util/Map;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$1000(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;

    move-result-object v2

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/Integer;

    .line 684
    .local v18, "status":Ljava/lang/Integer;
    if-eqz v18, :cond_b4

    .line 685
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->fromDownloadManagerStatus(I)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    move-result-object v14

    .line 686
    .local v14, "option":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    if-eqz v14, :cond_ad

    .line 687
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->checked:Ljava/util/Map;

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v14}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v5

    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 688
    invoke-interface {v13}, Ljava/util/Iterator;->remove()V

    goto :goto_64

    .line 691
    :cond_ad
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "option from download cache map is undefined"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 695
    .end local v14    # "option":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;
    :cond_b4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;

    move-result-object v2

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .line 696
    .local v8, "cachedItem":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    if-eqz v8, :cond_d9

    .line 697
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->checked:Ljava/util/Map;

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    invoke-interface {v13}, Ljava/util/Iterator;->remove()V

    goto :goto_64

    .line 700
    :cond_d9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 701
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .line 704
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pack/id/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, v16

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/content"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 702
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 708
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_13a

    .line 709
    const/4 v2, 0x1

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_13f

    const/4 v11, 0x1

    .line 710
    .local v11, "isFree":Z
    :goto_122
    const/4 v2, 0x2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_141

    const/4 v12, 0x1

    .line 711
    .local v12, "isFreeWithLogin":Z
    :goto_12b
    const/4 v2, 0x3

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_143

    const/4 v15, 0x1

    .line 713
    .local v15, "owned":Z
    :goto_134
    if-nez v11, :cond_145

    if-nez v12, :cond_145

    if-nez v15, :cond_145

    .line 731
    .end local v11    # "isFree":Z
    .end local v12    # "isFreeWithLogin":Z
    .end local v15    # "owned":Z
    :cond_13a
    :goto_13a
    invoke-static {v9}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    goto/16 :goto_64

    .line 709
    :cond_13f
    const/4 v11, 0x0

    goto :goto_122

    .line 710
    .restart local v11    # "isFree":Z
    :cond_141
    const/4 v12, 0x0

    goto :goto_12b

    .line 711
    .restart local v12    # "isFreeWithLogin":Z
    :cond_143
    const/4 v15, 0x0

    goto :goto_134

    .line 716
    .restart local v15    # "owned":Z
    :cond_145
    if-eqz v15, :cond_16b

    .line 717
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->checked:Ljava/util/Map;

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->OWNED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v5

    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 718
    invoke-interface {v13}, Ljava/util/Iterator;->remove()V

    .line 719
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->adobeMap:Ljava/util/Map;

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_13a

    .line 720
    :cond_16b
    if-eqz v11, :cond_199

    .line 721
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->checked:Ljava/util/Map;

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v5

    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 722
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;

    move-result-object v2

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v5

    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 723
    invoke-interface {v13}, Ljava/util/Iterator;->remove()V

    goto :goto_13a

    .line 725
    :cond_199
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->checked:Ljava/util/Map;

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE_WITH_LOGIN:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v5

    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 726
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;

    move-result-object v2

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->FREE_WITH_LOGIN:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v5

    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 727
    invoke-interface {v13}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_13a

    .line 735
    .end local v8    # "cachedItem":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    .end local v9    # "cursor":Landroid/database/Cursor;
    .end local v10    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Ljava/lang/String;>;"
    .end local v11    # "isFree":Z
    .end local v12    # "isFreeWithLogin":Z
    .end local v15    # "owned":Z
    .end local v16    # "packId":J
    .end local v18    # "status":Ljava/lang/Integer;
    :cond_1c6
    invoke-virtual/range {p1 .. p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_3b

    .line 736
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "map is now: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    aput-object v7, v5, v6

    invoke-interface {v2, v3, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 737
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$18;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 738
    invoke-virtual/range {p1 .. p1}, Lrx/Subscriber;->onCompleted()V

    goto/16 :goto_3b
.end method
