.class public Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
.super Ljava/lang/Object;
.source "Inventory.java"


# instance fields
.field mPurchaseMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;",
            ">;"
        }
    .end annotation
.end field

.field mSkuMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mSkuMap:Ljava/util/Map;

    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mPurchaseMap:Ljava/util/Map;

    .line 33
    return-void
.end method


# virtual methods
.method public addAll(Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;)V
    .registers 4
    .param p1, "other"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    .prologue
    .line 95
    if-eqz p1, :cond_10

    .line 96
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mSkuMap:Ljava/util/Map;

    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mSkuMap:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mPurchaseMap:Ljava/util/Map;

    iget-object v1, p1, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mPurchaseMap:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 99
    :cond_10
    return-void
.end method

.method public addPurchase(Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V
    .registers 4
    .param p1, "p"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mPurchaseMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;->getSku()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    return-void
.end method

.method public addSkuDetails(Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;)V
    .registers 4
    .param p1, "d"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mSkuMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    return-void
.end method

.method public getAllOwnedSkus()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 69
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mPurchaseMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getSkuDetails(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;
    .registers 3
    .param p1, "sku"    # Ljava/lang/String;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mSkuMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;

    return-object v0
.end method

.method public hasDetails(Ljava/lang/String;)Z
    .registers 3
    .param p1, "sku"    # Ljava/lang/String;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mSkuMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasPurchase(Ljava/lang/String;)Z
    .registers 3
    .param p1, "sku"    # Ljava/lang/String;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->mPurchaseMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
