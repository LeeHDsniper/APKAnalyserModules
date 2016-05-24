.class public final Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
.super Ljava/lang/Object;
.source "AdobeInventory.java"


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field mPurchaseArray:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 20
    const-class v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->mPurchaseArray:[Ljava/lang/String;

    .line 22
    return-void
.end method


# virtual methods
.method addAll(Ljava/util/HashMap;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "addAll"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 39
    new-instance v1, Ljava/util/HashSet;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->mPurchaseArray:[Ljava/lang/String;

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 41
    .local v1, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 42
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_1a

    .line 45
    .end local v0    # "key":Ljava/lang/String;
    :cond_34
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 46
    .local v2, "sortedList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 48
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->mPurchaseArray:[Ljava/lang/String;

    .line 53
    return-void
.end method

.method clear()V
    .registers 3

    .prologue
    .line 56
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "clear"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 57
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->mPurchaseArray:[Ljava/lang/String;

    .line 58
    return-void
.end method

.method public getAllOwnedSkus()Ljava/util/List;
    .registers 2
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
    .line 29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->mPurchaseArray:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public hasPurchase(Ljava/lang/String;)Z
    .registers 4
    .param p1, "sku"    # Ljava/lang/String;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->mPurchaseArray:[Ljava/lang/String;

    invoke-static {v0, p1}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-le v0, v1, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AdobeInventory{size:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->mPurchaseArray:[Ljava/lang/String;

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
