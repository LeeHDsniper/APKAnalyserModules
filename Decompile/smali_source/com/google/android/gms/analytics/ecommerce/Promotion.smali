.class public Lcom/google/android/gms/analytics/ecommerce/Promotion;
.super Ljava/lang/Object;


# instance fields
.field zzLj:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/ecommerce/Promotion;->zzLj:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method put(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    const-string v0, "Name should be non-null"

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/analytics/ecommerce/Promotion;->zzLj:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setCreative(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Promotion;
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const-string v0, "cr"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/ecommerce/Promotion;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Promotion;
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const-string v0, "id"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/ecommerce/Promotion;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Promotion;
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const-string v0, "nm"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/ecommerce/Promotion;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public setPosition(Ljava/lang/String;)Lcom/google/android/gms/analytics/ecommerce/Promotion;
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const-string v0, "ps"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/ecommerce/Promotion;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/ecommerce/Promotion;->zzLj:Ljava/util/Map;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzod;->zzF(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzaV(Ljava/lang/String;)Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/ecommerce/Promotion;->zzLj:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v2, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_f

    :cond_3a
    return-object v2
.end method
