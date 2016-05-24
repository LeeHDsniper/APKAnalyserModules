.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PurchaseMap"
.end annotation


# instance fields
.field final adobeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final checked:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;"
        }
    .end annotation
.end field

.field final googleMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 976
    .local p1, "input":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 977
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->checked:Ljava/util/Map;

    .line 978
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->googleMap:Ljava/util/Map;

    .line 979
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->adobeMap:Ljava/util/Map;

    .line 980
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 984
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PurchaseMap{checked: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->checked:Ljava/util/Map;

    .line 985
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", googleMap: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->googleMap:Ljava/util/Map;

    .line 987
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", adobeMap: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->adobeMap:Ljava/util/Map;

    .line 989
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
