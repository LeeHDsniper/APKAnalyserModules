.class public final Lcom/google/android/gms/internal/zzon;
.super Lcom/google/android/gms/internal/zzod;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzod",
        "<",
        "Lcom/google/android/gms/internal/zzon;",
        ">;"
    }
.end annotation


# instance fields
.field private zzKC:Lcom/google/android/gms/analytics/ecommerce/ProductAction;

.field private final zzKD:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/ecommerce/Product;",
            ">;>;"
        }
    .end annotation
.end field

.field private final zzKE:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/ecommerce/Promotion;",
            ">;"
        }
    .end annotation
.end field

.field private final zzKF:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/ecommerce/Product;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzod;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKF:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKE:Ljava/util/List;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKD:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzon;->zzKF:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_14

    const-string v1, "products"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzon;->zzKF:Ljava/util/List;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14
    iget-object v1, p0, Lcom/google/android/gms/internal/zzon;->zzKE:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_23

    const-string v1, "promotions"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzon;->zzKE:Ljava/util/List;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_23
    iget-object v1, p0, Lcom/google/android/gms/internal/zzon;->zzKD:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_32

    const-string v1, "impressions"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzon;->zzKD:Ljava/util/Map;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_32
    const-string v1, "productAction"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzon;->zzKC:Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzon;->zzA(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/analytics/ecommerce/Product;Ljava/lang/String;)V
    .registers 5

    if-nez p1, :cond_3

    :goto_2
    return-void

    :cond_3
    if-nez p2, :cond_7

    const-string p2, ""

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKD:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKD:Ljava/util/Map;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_19
    iget-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKD:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method public bridge synthetic zza(Lcom/google/android/gms/internal/zzod;)V
    .registers 2

    check-cast p1, Lcom/google/android/gms/internal/zzon;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzon;->zza(Lcom/google/android/gms/internal/zzon;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzon;)V
    .registers 6

    iget-object v0, p1, Lcom/google/android/gms/internal/zzon;->zzKF:Ljava/util/List;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzon;->zzKF:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p1, Lcom/google/android/gms/internal/zzon;->zzKE:Ljava/util/List;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzon;->zzKE:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKD:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_18
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_44

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_34
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/analytics/ecommerce/Product;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzon;->zza(Lcom/google/android/gms/analytics/ecommerce/Product;Ljava/lang/String;)V

    goto :goto_34

    :cond_44
    iget-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKC:Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKC:Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    iput-object v0, p1, Lcom/google/android/gms/internal/zzon;->zzKC:Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    :cond_4c
    return-void
.end method

.method public zzxM()Lcom/google/android/gms/analytics/ecommerce/ProductAction;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKC:Lcom/google/android/gms/analytics/ecommerce/ProductAction;

    return-object v0
.end method

.method public zzxN()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/ecommerce/Product;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKF:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public zzxO()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/ecommerce/Product;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKD:Ljava/util/Map;

    return-object v0
.end method

.method public zzxP()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/analytics/ecommerce/Promotion;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzon;->zzKE:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
