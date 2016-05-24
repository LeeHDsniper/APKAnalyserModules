.class public Lcom/google/android/gms/internal/zzld;
.super Lcom/google/android/gms/internal/zzlh;

# interfaces
.implements Ljava/util/Map;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/zzlh",
        "<TK;TV;>;",
        "Ljava/util/Map",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field zzaev:Lcom/google/android/gms/internal/zzlg;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzlg",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzlh;-><init>()V

    return-void
.end method

.method private zzoV()Lcom/google/android/gms/internal/zzlg;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/zzlg",
            "<TK;TV;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzld;->zzaev:Lcom/google/android/gms/internal/zzlg;

    if-nez v0, :cond_b

    new-instance v0, Lcom/google/android/gms/internal/zzld$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzld$1;-><init>(Lcom/google/android/gms/internal/zzld;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzld;->zzaev:Lcom/google/android/gms/internal/zzlg;

    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/internal/zzld;->zzaev:Lcom/google/android/gms/internal/zzlg;

    return-object v0
.end method


# virtual methods
.method public entrySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;>;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzld;->zzoV()Lcom/google/android/gms/internal/zzlg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzlg;->getEntrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<TK;>;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzld;->zzoV()Lcom/google/android/gms/internal/zzlg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzlg;->getKeySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/internal/zzld;, "Lcom/google/android/gms/internal/zzld<TK;TV;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<+TK;+TV;>;"
    iget v0, p0, Lcom/google/android/gms/internal/zzld;->mSize:I

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzld;->ensureCapacity(I)V

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v2, v0}, Lcom/google/android/gms/internal/zzld;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    :cond_2a
    return-void
.end method

.method public values()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<TV;>;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzld;->zzoV()Lcom/google/android/gms/internal/zzlg;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzlg;->getValues()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
