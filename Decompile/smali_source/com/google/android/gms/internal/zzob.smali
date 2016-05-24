.class public final Lcom/google/android/gms/internal/zzob;
.super Ljava/lang/Object;


# instance fields
.field private final zzaHQ:Lcom/google/android/gms/internal/zzoe;

.field private zzaHR:Z

.field private zzaHS:J

.field private zzaHT:J

.field private zzaHU:J

.field private zzaHV:J

.field private zzaHW:J

.field private zzaHX:Z

.field private final zzaHY:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lcom/google/android/gms/internal/zzod;",
            ">;",
            "Lcom/google/android/gms/internal/zzod;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaHZ:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzoh;",
            ">;"
        }
    .end annotation
.end field

.field private final zzpO:Lcom/google/android/gms/internal/zzlm;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzob;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/google/android/gms/internal/zzob;->zzaHQ:Lcom/google/android/gms/internal/zzoe;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHQ:Lcom/google/android/gms/internal/zzoe;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzob;->zzpO:Lcom/google/android/gms/internal/zzlm;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzpO:Lcom/google/android/gms/internal/zzlm;

    iget-wide v0, p1, Lcom/google/android/gms/internal/zzob;->zzaHS:J

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHS:J

    iget-wide v0, p1, Lcom/google/android/gms/internal/zzob;->zzaHT:J

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHT:J

    iget-wide v0, p1, Lcom/google/android/gms/internal/zzob;->zzaHU:J

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHU:J

    iget-wide v0, p1, Lcom/google/android/gms/internal/zzob;->zzaHV:J

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHV:J

    iget-wide v0, p1, Lcom/google/android/gms/internal/zzob;->zzaHW:J

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHW:J

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzob;->zzaHZ:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHZ:Ljava/util/List;

    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzob;->zzaHY:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHY:Ljava/util/Map;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzob;->zzaHY:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_68

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzob;->zzf(Ljava/lang/Class;)Lcom/google/android/gms/internal/zzod;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzod;

    invoke-virtual {v1, v3}, Lcom/google/android/gms/internal/zzod;->zza(Lcom/google/android/gms/internal/zzod;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzob;->zzaHY:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3f

    :cond_68
    return-void
.end method

.method constructor <init>(Lcom/google/android/gms/internal/zzoe;Lcom/google/android/gms/internal/zzlm;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzob;->zzaHQ:Lcom/google/android/gms/internal/zzoe;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzob;->zzpO:Lcom/google/android/gms/internal/zzlm;

    const-wide/32 v0, 0x1b7740

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHV:J

    const-wide v0, 0xb43e9400L

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHW:J

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHY:Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHZ:Ljava/util/List;

    return-void
.end method

.method private static zzf(Ljava/lang/Class;)Lcom/google/android/gms/internal/zzod;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/google/android/gms/internal/zzod;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzod;
    :try_end_6
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_6} :catch_7
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_6} :catch_10

    return-object v0

    :catch_7
    move-exception v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "dataType doesn\'t have default constructor"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_10
    move-exception v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "dataType default constructor is not accessible"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public zzL(J)V
    .registers 4

    iput-wide p1, p0, Lcom/google/android/gms/internal/zzob;->zzaHT:J

    return-void
.end method

.method public zzb(Lcom/google/android/gms/internal/zzod;)V
    .registers 5

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lcom/google/android/gms/internal/zzod;

    if-eq v1, v2, :cond_15

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_15
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzob;->zze(Ljava/lang/Class;)Lcom/google/android/gms/internal/zzod;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzod;->zza(Lcom/google/android/gms/internal/zzod;)V

    return-void
.end method

.method public zzd(Ljava/lang/Class;)Lcom/google/android/gms/internal/zzod;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/google/android/gms/internal/zzod;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHY:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzod;

    return-object v0
.end method

.method public zze(Ljava/lang/Class;)Lcom/google/android/gms/internal/zzod;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/google/android/gms/internal/zzod;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHY:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzod;

    if-nez v0, :cond_13

    invoke-static {p1}, Lcom/google/android/gms/internal/zzob;->zzf(Ljava/lang/Class;)Lcom/google/android/gms/internal/zzod;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzob;->zzaHY:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_13
    return-object v0
.end method

.method public zzxh()Lcom/google/android/gms/internal/zzob;
    .registers 2

    new-instance v0, Lcom/google/android/gms/internal/zzob;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzob;-><init>(Lcom/google/android/gms/internal/zzob;)V

    return-object v0
.end method

.method public zzxi()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/android/gms/internal/zzod;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHY:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public zzxj()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzoh;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHZ:Ljava/util/List;

    return-object v0
.end method

.method public zzxk()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHS:J

    return-wide v0
.end method

.method public zzxl()V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzob;->zzxp()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzof;->zze(Lcom/google/android/gms/internal/zzob;)V

    return-void
.end method

.method public zzxm()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHR:Z

    return v0
.end method

.method zzxn()V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzpO:Lcom/google/android/gms/internal/zzlm;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHU:J

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHT:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_18

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHT:J

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHS:J

    :goto_14
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHR:Z

    return-void

    :cond_18
    iget-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzpO:Lcom/google/android/gms/internal/zzlm;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHS:J

    goto :goto_14
.end method

.method zzxo()Lcom/google/android/gms/internal/zzoe;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHQ:Lcom/google/android/gms/internal/zzoe;

    return-object v0
.end method

.method zzxp()Lcom/google/android/gms/internal/zzof;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHQ:Lcom/google/android/gms/internal/zzoe;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzoe;->zzxp()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    return-object v0
.end method

.method zzxq()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHX:Z

    return v0
.end method

.method zzxr()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzob;->zzaHX:Z

    return-void
.end method
