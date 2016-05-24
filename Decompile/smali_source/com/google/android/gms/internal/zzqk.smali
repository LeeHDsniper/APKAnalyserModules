.class public Lcom/google/android/gms/internal/zzqk;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzqk$zzc;,
        Lcom/google/android/gms/internal/zzqk$zza;,
        Lcom/google/android/gms/internal/zzqk$zzb;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private zzaPw:Ljava/lang/String;

.field private final zzaTA:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzqz;",
            ">;"
        }
    .end annotation
.end field

.field private final zzaTy:Lcom/google/android/gms/internal/zzqr;

.field zzaTz:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzqk$zzc",
            "<",
            "Lcom/google/android/gms/internal/zzqp$zzc;",
            ">;>;"
        }
    .end annotation
.end field

.field private final zzpO:Lcom/google/android/gms/internal/zzlm;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v1, Lcom/google/android/gms/internal/zzqr;

    invoke-direct {v1, p1}, Lcom/google/android/gms/internal/zzqr;-><init>(Landroid/content/Context;)V

    invoke-static {}, Lcom/google/android/gms/internal/zzlo;->zzpN()Lcom/google/android/gms/internal/zzlm;

    move-result-object v2

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/google/android/gms/internal/zzqk;-><init>(Landroid/content/Context;Ljava/util/Map;Lcom/google/android/gms/internal/zzqr;Lcom/google/android/gms/internal/zzlm;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/util/Map;Lcom/google/android/gms/internal/zzqr;Lcom/google/android/gms/internal/zzlm;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/internal/zzqz;",
            ">;",
            "Lcom/google/android/gms/internal/zzqr;",
            "Lcom/google/android/gms/internal/zzlm;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqk;->zzaPw:Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqk;->zzaTz:Ljava/util/Map;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqk;->mContext:Landroid/content/Context;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzqk;->zzpO:Lcom/google/android/gms/internal/zzlm;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzqk;->zzaTy:Lcom/google/android/gms/internal/zzqr;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzqk;->zzaTA:Ljava/util/Map;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzqk;)Lcom/google/android/gms/internal/zzqr;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqk;->zzaTy:Lcom/google/android/gms/internal/zzqr;

    return-object v0
.end method

.method private zza(Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzqk$zza;)V
    .registers 7

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqn;->zzBv()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v0, :cond_19

    :goto_c
    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzZ(Z)V

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzqi;

    invoke-virtual {p0, v0, p2}, Lcom/google/android/gms/internal/zzqk;->zza(Lcom/google/android/gms/internal/zzqi;Lcom/google/android/gms/internal/zzqk$zza;)V

    return-void

    :cond_19
    move v0, v1

    goto :goto_c
.end method


# virtual methods
.method zza(Lcom/google/android/gms/internal/zzqi;Lcom/google/android/gms/internal/zzqk$zza;)V
    .registers 8

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqk;->zzaTy:Lcom/google/android/gms/internal/zzqr;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqi;->zzBr()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqi;->zzBp()Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/internal/zzqm;->zzaTG:Lcom/google/android/gms/internal/zzql;

    new-instance v4, Lcom/google/android/gms/internal/zzqk$1;

    invoke-direct {v4, p0, p1, p2}, Lcom/google/android/gms/internal/zzqk$1;-><init>(Lcom/google/android/gms/internal/zzqk;Lcom/google/android/gms/internal/zzqi;Lcom/google/android/gms/internal/zzqk$zza;)V

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/gms/internal/zzqr;->zza(Ljava/lang/String;Ljava/lang/Integer;Lcom/google/android/gms/internal/zzql;Lcom/google/android/gms/internal/zzqq;)V

    return-void
.end method

.method zza(Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzqk$zza;Lcom/google/android/gms/internal/zzqx;)V
    .registers 11

    const/4 v0, 0x0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqn;->zzBv()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v2, v0

    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_44

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzqi;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqk;->zzaTz:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqi;->getContainerId()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzqk$zzc;

    if-eqz v1, :cond_39

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqk$zzc;->zzBu()J

    move-result-wide v0

    :goto_28
    const-wide/32 v4, 0xdbba0

    add-long/2addr v0, v4

    iget-object v4, p0, Lcom/google/android/gms/internal/zzqk;->zzpO:Lcom/google/android/gms/internal/zzlm;

    invoke-interface {v4}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v4

    cmp-long v0, v0, v4

    if-gez v0, :cond_7f

    const/4 v0, 0x1

    :goto_37
    move v2, v0

    goto :goto_a

    :cond_39
    iget-object v1, p0, Lcom/google/android/gms/internal/zzqk;->zzaTy:Lcom/google/android/gms/internal/zzqr;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqi;->getContainerId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzqr;->zzfp(Ljava/lang/String;)J

    move-result-wide v0

    goto :goto_28

    :cond_44
    if-eqz v2, :cond_79

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqk;->zzaTA:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqn;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzqz;

    if-nez v0, :cond_7d

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqk;->zzaPw:Ljava/lang/String;

    if-nez v0, :cond_71

    new-instance v0, Lcom/google/android/gms/internal/zzqz;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzqz;-><init>()V

    :goto_5d
    iget-object v1, p0, Lcom/google/android/gms/internal/zzqk;->zzaTA:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqn;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v0

    :goto_67
    iget-object v2, p0, Lcom/google/android/gms/internal/zzqk;->mContext:Landroid/content/Context;

    const-wide/16 v4, 0x0

    move-object v3, p1

    move-object v6, p3

    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/internal/zzqz;->zza(Landroid/content/Context;Lcom/google/android/gms/internal/zzqn;JLcom/google/android/gms/internal/zzqx;)V

    :goto_70
    return-void

    :cond_71
    new-instance v0, Lcom/google/android/gms/internal/zzqz;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqk;->zzaPw:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzqz;-><init>(Ljava/lang/String;)V

    goto :goto_5d

    :cond_79
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/zzqk;->zza(Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzqk$zza;)V

    goto :goto_70

    :cond_7d
    move-object v1, v0

    goto :goto_67

    :cond_7f
    move v0, v2

    goto :goto_37
.end method

.method zza(Lcom/google/android/gms/internal/zzqo$zza;)V
    .registers 10

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqo$zza;->zzBz()Lcom/google/android/gms/internal/zzqi;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqi;->getContainerId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqo$zza;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqo$zza;->zzBA()Lcom/google/android/gms/internal/zzqp$zzc;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzqk;->zzaTz:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_34

    iget-object v3, p0, Lcom/google/android/gms/internal/zzqk;->zzaTz:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzqk$zzc;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzqk;->zzpO:Lcom/google/android/gms/internal/zzlm;

    invoke-interface {v3}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Lcom/google/android/gms/internal/zzqk$zzc;->zzU(J)V

    sget-object v3, Lcom/google/android/gms/common/api/Status;->zzaaD:Lcom/google/android/gms/common/api/Status;

    if-ne v1, v3, :cond_33

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzqk$zzc;->zzbh(Lcom/google/android/gms/common/api/Status;)V

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzqk$zzc;->zzQ(Ljava/lang/Object;)V

    :cond_33
    :goto_33
    return-void

    :cond_34
    iget-object v3, p0, Lcom/google/android/gms/internal/zzqk;->zzaTz:Ljava/util/Map;

    new-instance v4, Lcom/google/android/gms/internal/zzqk$zzc;

    iget-object v5, p0, Lcom/google/android/gms/internal/zzqk;->zzpO:Lcom/google/android/gms/internal/zzlm;

    invoke-interface {v5}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v6

    invoke-direct {v4, v1, v2, v6, v7}, Lcom/google/android/gms/internal/zzqk$zzc;-><init>(Lcom/google/android/gms/common/api/Status;Ljava/lang/Object;J)V

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_33
.end method

.method public zza(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lcom/google/android/gms/internal/zzqk$zza;)V
    .registers 8

    new-instance v0, Lcom/google/android/gms/internal/zzqn;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzqn;-><init>()V

    new-instance v1, Lcom/google/android/gms/internal/zzqi;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, p3, v2}, Lcom/google/android/gms/internal/zzqi;-><init>(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzqn;->zzb(Lcom/google/android/gms/internal/zzqi;)Lcom/google/android/gms/internal/zzqn;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzqk$zzb;

    sget-object v2, Lcom/google/android/gms/internal/zzqm;->zzaTG:Lcom/google/android/gms/internal/zzql;

    invoke-direct {v1, p0, v0, v2, p4}, Lcom/google/android/gms/internal/zzqk$zzb;-><init>(Lcom/google/android/gms/internal/zzqk;Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzql;Lcom/google/android/gms/internal/zzqk$zza;)V

    invoke-virtual {p0, v0, p4, v1}, Lcom/google/android/gms/internal/zzqk;->zza(Lcom/google/android/gms/internal/zzqn;Lcom/google/android/gms/internal/zzqk$zza;Lcom/google/android/gms/internal/zzqx;)V

    return-void
.end method

.method public zzfj(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqk;->zzaPw:Ljava/lang/String;

    return-void
.end method
