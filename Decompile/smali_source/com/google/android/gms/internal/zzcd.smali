.class public Lcom/google/android/gms/internal/zzcd;
.super Ljava/lang/Object;


# instance fields
.field private final zzpc:Ljava/lang/Object;

.field zzvf:Z

.field private final zzvr:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzcc;",
            ">;"
        }
    .end annotation
.end field

.field private final zzvs:Ljava/util/Map;
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

.field private zzvt:Ljava/lang/String;

.field private zzvu:Lcom/google/android/gms/internal/zzcc;


# direct methods
.method public constructor <init>(ZLjava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvr:Ljava/util/List;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvs:Ljava/util/Map;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzpc:Ljava/lang/Object;

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzcd;->zzvf:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvs:Ljava/util/Map;

    const-string v1, "action"

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvs:Ljava/util/Map;

    const-string v1, "ad_format"

    invoke-interface {v0, v1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private varargs zza(Lcom/google/android/gms/internal/zzcc;J[Ljava/lang/String;)Z
    .registers 11

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcd;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    array-length v2, p4

    const/4 v0, 0x0

    :goto_5
    if-ge v0, v2, :cond_16

    aget-object v3, p4, v0

    new-instance v4, Lcom/google/android/gms/internal/zzcc;

    invoke-direct {v4, p2, p3, v3, p1}, Lcom/google/android/gms/internal/zzcc;-><init>(JLjava/lang/String;Lcom/google/android/gms/internal/zzcc;)V

    iget-object v3, p0, Lcom/google/android/gms/internal/zzcd;->zzvr:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_16
    const/4 v0, 0x1

    monitor-exit v1

    return v0

    :catchall_19
    move-exception v0

    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw v0
.end method


# virtual methods
.method public zzR(Ljava/lang/String;)V
    .registers 4

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvf:Z

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzcd;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_8
    iput-object p1, p0, Lcom/google/android/gms/internal/zzcd;->zzvt:Ljava/lang/String;

    monitor-exit v1

    goto :goto_4

    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_8 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public varargs zza(Lcom/google/android/gms/internal/zzcc;[Ljava/lang/String;)Z
    .registers 5

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvf:Z

    if-eqz v0, :cond_6

    if-nez p1, :cond_8

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0

    :cond_8
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbB()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->elapsedRealtime()J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/google/android/gms/internal/zzcd;->zza(Lcom/google/android/gms/internal/zzcc;J[Ljava/lang/String;)Z

    move-result v0

    goto :goto_7
.end method

.method public zzb(J)Lcom/google/android/gms/internal/zzcc;
    .registers 6

    const/4 v0, 0x0

    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzcd;->zzvf:Z

    if-nez v1, :cond_6

    :goto_5
    return-object v0

    :cond_6
    new-instance v1, Lcom/google/android/gms/internal/zzcc;

    invoke-direct {v1, p1, p2, v0, v0}, Lcom/google/android/gms/internal/zzcc;-><init>(JLjava/lang/String;Lcom/google/android/gms/internal/zzcc;)V

    move-object v0, v1

    goto :goto_5
.end method

.method public zzd(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvf:Z

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v1, p0, Lcom/google/android/gms/internal/zzcd;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_8
    iget-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvs:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1

    goto :goto_4

    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_f

    throw v0
.end method

.method public zzdl()Lcom/google/android/gms/internal/zzcc;
    .registers 3

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbB()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->elapsedRealtime()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzcd;->zzb(J)Lcom/google/android/gms/internal/zzcc;

    move-result-object v0

    return-object v0
.end method

.method public zzdm()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcd;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzcd;->zzdl()Lcom/google/android/gms/internal/zzcc;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvu:Lcom/google/android/gms/internal/zzcc;

    monitor-exit v1

    return-void

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method public zzdn()Ljava/lang/String;
    .registers 11

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzcd;->zzpc:Ljava/lang/Object;

    monitor-enter v2

    :try_start_8
    iget-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvr:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_e
    :goto_e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzcc;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcc;->getTime()J

    move-result-wide v4

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcc;->zzdj()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcc;->zzdk()Lcom/google/android/gms/internal/zzcc;

    move-result-object v0

    if-eqz v0, :cond_e

    const-wide/16 v8, 0x0

    cmp-long v7, v4, v8

    if-lez v7, :cond_e

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcc;->getTime()J

    move-result-wide v8

    sub-long/2addr v4, v8

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v6, 0x2e

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v4, 0x2c

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_e

    :catchall_47
    move-exception v0

    monitor-exit v2
    :try_end_49
    .catchall {:try_start_8 .. :try_end_49} :catchall_47

    throw v0

    :cond_4a
    :try_start_4a
    iget-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvr:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvt:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_62

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvt:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5c
    :goto_5c
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    monitor-exit v2

    return-object v0

    :cond_62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_5c

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->setLength(I)V
    :try_end_71
    .catchall {:try_start_4a .. :try_end_71} :catchall_47

    goto :goto_5c
.end method

.method public zzdo()Lcom/google/android/gms/internal/zzcc;
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcd;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvu:Lcom/google/android/gms/internal/zzcc;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method zzn()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcd;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzcd;->zzvs:Ljava/util/Map;

    monitor-exit v1

    return-object v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method
