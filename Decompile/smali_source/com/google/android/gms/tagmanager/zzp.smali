.class public Lcom/google/android/gms/tagmanager/zzp;
.super Lcom/google/android/gms/common/api/zzb;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/zzp$zzd;,
        Lcom/google/android/gms/tagmanager/zzp$zze;,
        Lcom/google/android/gms/tagmanager/zzp$zzf;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/common/api/zzb",
        "<",
        "Lcom/google/android/gms/tagmanager/ContainerHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzYV:Landroid/os/Looper;

.field private final zzaOS:Ljava/lang/String;

.field private final zzaPe:Lcom/google/android/gms/tagmanager/TagManager;

.field private final zzaPh:Lcom/google/android/gms/tagmanager/zzp$zzd;

.field private final zzaPi:Lcom/google/android/gms/tagmanager/zzcd;

.field private final zzaPj:I

.field private zzaPk:Lcom/google/android/gms/tagmanager/zzp$zzf;

.field private zzaPl:Lcom/google/android/gms/internal/zzqk;

.field private volatile zzaPm:Lcom/google/android/gms/tagmanager/zzo;

.field private zzaPo:Lcom/google/android/gms/internal/zzaf$zzj;

.field private zzaPp:Ljava/lang/String;

.field private zzaPq:Lcom/google/android/gms/tagmanager/zzp$zze;

.field private final zzpO:Lcom/google/android/gms/internal/zzlm;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/zzp$zzf;Lcom/google/android/gms/tagmanager/zzp$zze;Lcom/google/android/gms/internal/zzqk;Lcom/google/android/gms/internal/zzlm;Lcom/google/android/gms/tagmanager/zzcd;)V
    .registers 13

    if-nez p3, :cond_44

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    :goto_6
    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzb;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzp;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPe:Lcom/google/android/gms/tagmanager/TagManager;

    if-nez p3, :cond_13

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p3

    :cond_13
    iput-object p3, p0, Lcom/google/android/gms/tagmanager/zzp;->zzYV:Landroid/os/Looper;

    iput-object p4, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaOS:Ljava/lang/String;

    iput p5, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPj:I

    iput-object p6, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPk:Lcom/google/android/gms/tagmanager/zzp$zzf;

    iput-object p7, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPq:Lcom/google/android/gms/tagmanager/zzp$zze;

    iput-object p8, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPl:Lcom/google/android/gms/internal/zzqk;

    new-instance v0, Lcom/google/android/gms/tagmanager/zzp$zzd;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/tagmanager/zzp$zzd;-><init>(Lcom/google/android/gms/tagmanager/zzp;Lcom/google/android/gms/tagmanager/zzp$1;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPh:Lcom/google/android/gms/tagmanager/zzp$zzd;

    new-instance v0, Lcom/google/android/gms/internal/zzaf$zzj;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzaf$zzj;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPo:Lcom/google/android/gms/internal/zzaf$zzj;

    iput-object p9, p0, Lcom/google/android/gms/tagmanager/zzp;->zzpO:Lcom/google/android/gms/internal/zzlm;

    iput-object p10, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPi:Lcom/google/android/gms/tagmanager/zzcd;

    invoke-direct {p0}, Lcom/google/android/gms/tagmanager/zzp;->zzzK()Z

    move-result v0

    if-eqz v0, :cond_43

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzcb;->zzAv()Lcom/google/android/gms/tagmanager/zzcb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzcb;->zzAx()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/tagmanager/zzp;->zzey(Ljava/lang/String;)V

    :cond_43
    return-void

    :cond_44
    move-object v0, p3

    goto :goto_6
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/zzs;)V
    .registers 21

    new-instance v13, Lcom/google/android/gms/tagmanager/zzcn;

    move-object/from16 v0, p4

    invoke-direct {v13, p1, v0}, Lcom/google/android/gms/tagmanager/zzcn;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    new-instance v10, Lcom/google/android/gms/tagmanager/zzcm;

    move-object/from16 v0, p4

    move-object/from16 v1, p6

    invoke-direct {v10, p1, v0, v1}, Lcom/google/android/gms/tagmanager/zzcm;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/google/android/gms/tagmanager/zzs;)V

    new-instance v11, Lcom/google/android/gms/internal/zzqk;

    invoke-direct {v11, p1}, Lcom/google/android/gms/internal/zzqk;-><init>(Landroid/content/Context;)V

    invoke-static {}, Lcom/google/android/gms/internal/zzlo;->zzpN()Lcom/google/android/gms/internal/zzlm;

    move-result-object v12

    new-instance v2, Lcom/google/android/gms/tagmanager/zzbe;

    const/16 v3, 0x1e

    const-wide/32 v4, 0xdbba0

    const-wide/16 v6, 0x1388

    const-string v8, "refreshing"

    invoke-static {}, Lcom/google/android/gms/internal/zzlo;->zzpN()Lcom/google/android/gms/internal/zzlm;

    move-result-object v9

    invoke-direct/range {v2 .. v9}, Lcom/google/android/gms/tagmanager/zzbe;-><init>(IJJLjava/lang/String;Lcom/google/android/gms/internal/zzlm;)V

    move-object v3, p0

    move-object v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move/from16 v8, p5

    move-object v9, v13

    move-object v13, v2

    invoke-direct/range {v3 .. v13}, Lcom/google/android/gms/tagmanager/zzp;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/TagManager;Landroid/os/Looper;Ljava/lang/String;ILcom/google/android/gms/tagmanager/zzp$zzf;Lcom/google/android/gms/tagmanager/zzp$zze;Lcom/google/android/gms/internal/zzqk;Lcom/google/android/gms/internal/zzlm;Lcom/google/android/gms/tagmanager/zzcd;)V

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPl:Lcom/google/android/gms/internal/zzqk;

    invoke-virtual/range {p6 .. p6}, Lcom/google/android/gms/tagmanager/zzs;->zzzN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzqk;->zzfj(Ljava/lang/String;)V

    return-void
.end method

.method private declared-synchronized zzR(J)V
    .registers 6

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPq:Lcom/google/android/gms/tagmanager/zzp$zze;

    if-nez v0, :cond_c

    const-string v0, "Refresh requested, but no network load scheduler."

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->zzaE(Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_16

    :goto_a
    monitor-exit p0

    return-void

    :cond_c
    :try_start_c
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPq:Lcom/google/android/gms/tagmanager/zzp$zze;

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPo:Lcom/google/android/gms/internal/zzaf$zzj;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzaf$zzj;->zziS:Ljava/lang/String;

    invoke-interface {v0, p1, p2, v1}, Lcom/google/android/gms/tagmanager/zzp$zze;->zzf(JLjava/lang/String;)V
    :try_end_15
    .catchall {:try_start_c .. :try_end_15} :catchall_16

    goto :goto_a

    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method static synthetic zza(Lcom/google/android/gms/tagmanager/zzp;Lcom/google/android/gms/tagmanager/zzo;)Lcom/google/android/gms/tagmanager/zzo;
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPm:Lcom/google/android/gms/tagmanager/zzo;

    return-object p1
.end method

.method static synthetic zza(Lcom/google/android/gms/tagmanager/zzp;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaOS:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/tagmanager/zzp;J)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/tagmanager/zzp;->zzR(J)V

    return-void
.end method

.method static synthetic zzb(Lcom/google/android/gms/tagmanager/zzp;)Lcom/google/android/gms/tagmanager/TagManager;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPe:Lcom/google/android/gms/tagmanager/TagManager;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/tagmanager/zzp;)Landroid/os/Looper;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzYV:Landroid/os/Looper;

    return-object v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/tagmanager/zzp;)Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic zze(Lcom/google/android/gms/tagmanager/zzp;)Lcom/google/android/gms/tagmanager/zzcd;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPi:Lcom/google/android/gms/tagmanager/zzcd;

    return-object v0
.end method

.method static synthetic zzf(Lcom/google/android/gms/tagmanager/zzp;)Lcom/google/android/gms/tagmanager/zzo;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPm:Lcom/google/android/gms/tagmanager/zzo;

    return-object v0
.end method

.method private zzzK()Z
    .registers 4

    invoke-static {}, Lcom/google/android/gms/tagmanager/zzcb;->zzAv()Lcom/google/android/gms/tagmanager/zzcb;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzcb;->zzAw()Lcom/google/android/gms/tagmanager/zzcb$zza;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/tagmanager/zzcb$zza;->zzaRd:Lcom/google/android/gms/tagmanager/zzcb$zza;

    if-eq v1, v2, :cond_14

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzcb;->zzAw()Lcom/google/android/gms/tagmanager/zzcb$zza;

    move-result-object v1

    sget-object v2, Lcom/google/android/gms/tagmanager/zzcb$zza;->zzaRe:Lcom/google/android/gms/tagmanager/zzcb$zza;

    if-ne v1, v2, :cond_22

    :cond_14
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaOS:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzcb;->getContainerId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    const/4 v0, 0x1

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method


# virtual methods
.method public load(Ljava/lang/String;)V
    .registers 6
    .param p1, "resourceIdParameterName"    # Ljava/lang/String;

    .prologue
    iget v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPj:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_18

    iget v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPj:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :goto_b
    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPl:Lcom/google/android/gms/internal/zzqk;

    iget-object v2, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaOS:Ljava/lang/String;

    new-instance v3, Lcom/google/android/gms/tagmanager/zzp$1;

    invoke-direct {v3, p0, p1}, Lcom/google/android/gms/tagmanager/zzp$1;-><init>(Lcom/google/android/gms/tagmanager/zzp;Ljava/lang/String;)V

    invoke-virtual {v1, v2, v0, p1, v3}, Lcom/google/android/gms/internal/zzqk;->zza(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Lcom/google/android/gms/internal/zzqk$zza;)V

    return-void

    :cond_18
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected synthetic zzb(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .registers 3

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tagmanager/zzp;->zzbg(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/tagmanager/ContainerHolder;

    move-result-object v0

    return-object v0
.end method

.method protected zzbg(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/tagmanager/ContainerHolder;
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPm:Lcom/google/android/gms/tagmanager/zzo;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPm:Lcom/google/android/gms/tagmanager/zzo;

    :goto_6
    return-object v0

    :cond_7
    sget-object v0, Lcom/google/android/gms/common/api/Status;->zzaaG:Lcom/google/android/gms/common/api/Status;

    if-ne p1, v0, :cond_10

    const-string v0, "timer expired: setting result to failure"

    invoke-static {v0}, Lcom/google/android/gms/tagmanager/zzbg;->e(Ljava/lang/String;)V

    :cond_10
    new-instance v0, Lcom/google/android/gms/tagmanager/zzo;

    invoke-direct {v0, p1}, Lcom/google/android/gms/tagmanager/zzo;-><init>(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_6
.end method

.method declared-synchronized zzey(Ljava/lang/String;)V
    .registers 3

    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPp:Ljava/lang/String;

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPq:Lcom/google/android/gms/tagmanager/zzp$zze;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPq:Lcom/google/android/gms/tagmanager/zzp$zze;

    invoke-interface {v0, p1}, Lcom/google/android/gms/tagmanager/zzp$zze;->zzeB(Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    :cond_c
    monitor-exit p0

    return-void

    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized zzzE()Ljava/lang/String;
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzp;->zzaPp:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method
