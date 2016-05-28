.class Lcom/google/android/gms/tagmanager/zzcw;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/zzl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tagmanager/zzl",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private final zzaSl:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private final zzaSm:I

.field private final zzaSn:Lcom/google/android/gms/tagmanager/zzm$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tagmanager/zzm$zza",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private zzaSo:I


# direct methods
.method constructor <init>(ILcom/google/android/gms/tagmanager/zzm$zza;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/tagmanager/zzm$zza",
            "<TK;TV;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSl:Ljava/util/Map;

    iput p1, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSm:I

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSn:Lcom/google/android/gms/tagmanager/zzm$zza;

    return-void
.end method


# virtual methods
.method public declared-synchronized get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/google/android/gms/tagmanager/zzcw;, "Lcom/google/android/gms/tagmanager/zzcw<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSl:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized zzf(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    monitor-enter p0

    if-eqz p1, :cond_5

    if-nez p2, :cond_10

    :cond_5
    :try_start_5
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "key == null || value == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_d

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_10
    :try_start_10
    iget v0, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSo:I

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSn:Lcom/google/android/gms/tagmanager/zzm$zza;

    invoke-interface {v1, p1, p2}, Lcom/google/android/gms/tagmanager/zzm$zza;->sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSo:I

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSo:I

    iget v1, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSm:I

    if-le v0, v1, :cond_54

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSl:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_54

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    iget v2, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSo:I

    iget-object v3, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSn:Lcom/google/android/gms/tagmanager/zzm$zza;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v3, v4, v0}, Lcom/google/android/gms/tagmanager/zzm$zza;->sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    sub-int v0, v2, v0

    iput v0, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSo:I

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSo:I

    iget v2, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSm:I

    if-gt v0, v2, :cond_2b

    :cond_54
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcw;->zzaSl:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_59
    .catchall {:try_start_10 .. :try_end_59} :catchall_d

    monitor-exit p0

    return-void
.end method
