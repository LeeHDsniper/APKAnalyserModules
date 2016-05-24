.class public Lcom/google/android/gms/common/stats/zzb;
.super Ljava/lang/Object;


# static fields
.field private static final zzadT:Ljava/lang/Object;

.field private static zzafB:Ljava/lang/Integer;

.field private static zzafu:Lcom/google/android/gms/common/stats/zzb;

.field private static final zzafz:Landroid/content/ComponentName;


# instance fields
.field private zzafA:Lcom/google/android/gms/common/stats/zze;

.field private final zzafv:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final zzafw:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final zzafx:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final zzafy:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/stats/zzb;->zzadT:Ljava/lang/Object;

    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.google.android.gms"

    const-string v2, "com.google.android.gms.common.stats.GmsCoreStatsService"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/common/stats/zzb;->zzafz:Landroid/content/ComponentName;

    return-void
.end method

.method private constructor <init>()V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/android/gms/common/stats/zzb;->getLogLevel()I

    move-result v0

    sget v1, Lcom/google/android/gms/common/stats/zzd;->LOG_LEVEL_OFF:I

    if-ne v0, v1, :cond_1c

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lcom/google/android/gms/common/stats/zzb;->zzafv:Ljava/util/List;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lcom/google/android/gms/common/stats/zzb;->zzafw:Ljava/util/List;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lcom/google/android/gms/common/stats/zzb;->zzafx:Ljava/util/List;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lcom/google/android/gms/common/stats/zzb;->zzafy:Ljava/util/List;

    :goto_1b
    return-void

    :cond_1c
    sget-object v0, Lcom/google/android/gms/common/stats/zzc$zza;->zzafE:Lcom/google/android/gms/internal/zzkq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkq;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_6a

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_28
    iput-object v0, p0, Lcom/google/android/gms/common/stats/zzb;->zzafv:Ljava/util/List;

    sget-object v0, Lcom/google/android/gms/common/stats/zzc$zza;->zzafF:Lcom/google/android/gms/internal/zzkq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkq;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_75

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_36
    iput-object v0, p0, Lcom/google/android/gms/common/stats/zzb;->zzafw:Ljava/util/List;

    sget-object v0, Lcom/google/android/gms/common/stats/zzc$zza;->zzafG:Lcom/google/android/gms/internal/zzkq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkq;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_80

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_44
    iput-object v0, p0, Lcom/google/android/gms/common/stats/zzb;->zzafx:Ljava/util/List;

    sget-object v0, Lcom/google/android/gms/common/stats/zzc$zza;->zzafH:Lcom/google/android/gms/internal/zzkq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkq;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_8b

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_52
    iput-object v0, p0, Lcom/google/android/gms/common/stats/zzb;->zzafy:Ljava/util/List;

    new-instance v1, Lcom/google/android/gms/common/stats/zze;

    const/16 v2, 0x400

    sget-object v0, Lcom/google/android/gms/common/stats/zzc$zza;->zzafI:Lcom/google/android/gms/internal/zzkq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkq;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {v1, v2, v4, v5}, Lcom/google/android/gms/common/stats/zze;-><init>(IJ)V

    iput-object v1, p0, Lcom/google/android/gms/common/stats/zzb;->zzafA:Lcom/google/android/gms/common/stats/zze;

    goto :goto_1b

    :cond_6a
    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_28

    :cond_75
    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_36

    :cond_80
    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_44

    :cond_8b
    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_52
.end method

.method private static getLogLevel()I
    .registers 1

    sget-object v0, Lcom/google/android/gms/common/stats/zzb;->zzafB:Ljava/lang/Integer;

    if-nez v0, :cond_1c

    :try_start_4
    invoke-static {}, Lcom/google/android/gms/internal/zzll;->zzjk()Z

    move-result v0

    if-eqz v0, :cond_23

    sget-object v0, Lcom/google/android/gms/common/stats/zzc$zza;->zzafD:Lcom/google/android/gms/internal/zzkq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkq;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_16
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/common/stats/zzb;->zzafB:Ljava/lang/Integer;
    :try_end_1c
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_1c} :catch_26

    :cond_1c
    :goto_1c
    sget-object v0, Lcom/google/android/gms/common/stats/zzb;->zzafB:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    :cond_23
    :try_start_23
    sget v0, Lcom/google/android/gms/common/stats/zzd;->LOG_LEVEL_OFF:I
    :try_end_25
    .catch Ljava/lang/SecurityException; {:try_start_23 .. :try_end_25} :catch_26

    goto :goto_16

    :catch_26
    move-exception v0

    sget v0, Lcom/google/android/gms/common/stats/zzd;->LOG_LEVEL_OFF:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/common/stats/zzb;->zzafB:Ljava/lang/Integer;

    goto :goto_1c
.end method

.method private zza(Landroid/content/Context;Landroid/content/ServiceConnection;Ljava/lang/String;Landroid/content/Intent;I)V
    .registers 28

    sget-boolean v2, Lcom/google/android/gms/common/internal/zzd;->zzacF:Z

    if-nez v2, :cond_5

    :cond_4
    :goto_4
    return-void

    :cond_5
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/stats/zzb;->zzb(Landroid/content/ServiceConnection;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v7, p5

    invoke-direct/range {v2 .. v7}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    const/16 v16, 0x0

    invoke-static {}, Lcom/google/android/gms/common/stats/zzb;->getLogLevel()I

    move-result v2

    sget v3, Lcom/google/android/gms/common/stats/zzd;->zzafM:I

    and-int/2addr v2, v3

    if-eqz v2, :cond_32

    const/4 v2, 0x3

    const/4 v3, 0x5

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzlw;->zzm(II)Ljava/lang/String;

    move-result-object v16

    :cond_32
    const-wide/16 v20, 0x0

    invoke-static {}, Lcom/google/android/gms/common/stats/zzb;->getLogLevel()I

    move-result v2

    sget v3, Lcom/google/android/gms/common/stats/zzd;->zzafO:I

    and-int/2addr v2, v3

    if-eqz v2, :cond_41

    invoke-static {}, Landroid/os/Debug;->getNativeHeapAllocatedSize()J

    move-result-wide v20

    :cond_41
    const/4 v2, 0x1

    move/from16 v0, p5

    if-eq v0, v2, :cond_4b

    const/4 v2, 0x4

    move/from16 v0, p5

    if-ne v0, v2, :cond_73

    :cond_4b
    new-instance v8, Lcom/google/android/gms/common/stats/ConnectionEvent;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v18

    move/from16 v11, p5

    move-object/from16 v17, v6

    invoke-direct/range {v8 .. v21}, Lcom/google/android/gms/common/stats/ConnectionEvent;-><init>(JILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    :goto_5c
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    sget-object v3, Lcom/google/android/gms/common/stats/zzb;->zzafz:Landroid/content/ComponentName;

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "com.google.android.gms.common.stats.EXTRA_LOG_EVENT"

    invoke-virtual {v2, v3, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_4

    :cond_73
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Lcom/google/android/gms/common/stats/zzb;->zzc(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/pm/ServiceInfo;

    move-result-object v2

    new-instance v8, Lcom/google/android/gms/common/stats/ConnectionEvent;

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/internal/zzlw;->zzap(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    iget-object v14, v2, Landroid/content/pm/ServiceInfo;->processName:Ljava/lang/String;

    iget-object v15, v2, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v18

    move/from16 v11, p5

    move-object/from16 v13, p3

    move-object/from16 v17, v6

    invoke-direct/range {v8 .. v21}, Lcom/google/android/gms/common/stats/ConnectionEvent;-><init>(JILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    goto :goto_5c
.end method

.method private zza(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;I)Z
    .registers 13

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-static {}, Lcom/google/android/gms/common/stats/zzb;->getLogLevel()I

    move-result v2

    sget v3, Lcom/google/android/gms/common/stats/zzd;->LOG_LEVEL_OFF:I

    if-eq v2, v3, :cond_e

    iget-object v3, p0, Lcom/google/android/gms/common/stats/zzb;->zzafA:Lcom/google/android/gms/common/stats/zze;

    if-nez v3, :cond_f

    :cond_e
    :goto_e
    return v0

    :cond_f
    const/4 v3, 0x4

    if-eq p5, v3, :cond_14

    if-ne p5, v1, :cond_1e

    :cond_14
    iget-object v2, p0, Lcom/google/android/gms/common/stats/zzb;->zzafA:Lcom/google/android/gms/common/stats/zze;

    invoke-virtual {v2, p4}, Lcom/google/android/gms/common/stats/zze;->zzcz(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e

    move v0, v1

    goto :goto_e

    :cond_1e
    invoke-static {p1, p3}, Lcom/google/android/gms/common/stats/zzb;->zzc(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/pm/ServiceInfo;

    move-result-object v3

    if-nez v3, :cond_3b

    const-string v2, "ConnectionTracker"

    const-string v3, "Client %s made an invalid request %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p2, v4, v0

    invoke-virtual {p3, v0}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_e

    :cond_3b
    invoke-static {p1}, Lcom/google/android/gms/internal/zzlw;->zzap(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v3, Landroid/content/pm/ServiceInfo;->processName:Ljava/lang/String;

    iget-object v3, v3, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    iget-object v6, p0, Lcom/google/android/gms/common/stats/zzb;->zzafv:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_e

    iget-object v6, p0, Lcom/google/android/gms/common/stats/zzb;->zzafw:Ljava/util/List;

    invoke-interface {v6, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_e

    iget-object v6, p0, Lcom/google/android/gms/common/stats/zzb;->zzafx:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_e

    iget-object v6, p0, Lcom/google/android/gms/common/stats/zzb;->zzafy:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_e

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6e

    sget v3, Lcom/google/android/gms/common/stats/zzd;->zzafN:I

    and-int/2addr v2, v3

    if-nez v2, :cond_e

    :cond_6e
    iget-object v0, p0, Lcom/google/android/gms/common/stats/zzb;->zzafA:Lcom/google/android/gms/common/stats/zze;

    invoke-virtual {v0, p4}, Lcom/google/android/gms/common/stats/zze;->zzcy(Ljava/lang/String;)Ljava/lang/Long;

    move v0, v1

    goto :goto_e
.end method

.method private zzb(Landroid/content/ServiceConnection;)Ljava/lang/String;
    .registers 4

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    shl-int/lit8 v0, v0, 0x20

    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    or-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private zzb(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 6

    invoke-virtual {p2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-eqz v0, :cond_16

    sget-boolean v1, Lcom/google/android/gms/common/internal/zzd;->zzacF:Z

    if-eqz v1, :cond_18

    const-string v1, "com.google.android.gms"

    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    :cond_16
    const/4 v0, 0x0

    :goto_17
    return v0

    :cond_18
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzll;->zzi(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    goto :goto_17
.end method

.method private static zzc(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/pm/ServiceInfo;
    .registers 11

    const/16 v8, 0x14

    const/4 v7, 0x3

    const/4 v3, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/16 v1, 0x80

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_18

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_33

    :cond_18
    const-string v0, "ConnectionTracker"

    const-string v1, "There are no handler of this intent: %s\n Stack trace: %s"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p1, v5}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v7, v8}, Lcom/google/android/gms/internal/zzlw;->zzm(II)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :goto_32
    return-object v0

    :cond_33
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v6, :cond_6d

    const-string v1, "ConnectionTracker"

    const-string v2, "Multiple handlers found for this intent: %s\n Stack trace: %s"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p1, v5}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v7, v8}, Lcom/google/android/gms/internal/zzlw;->zzm(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    const-string v1, "ConnectionTracker"

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v0, v0, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    goto :goto_32

    :cond_6d
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    goto :goto_32
.end method

.method public static zzpD()Lcom/google/android/gms/common/stats/zzb;
    .registers 2

    sget-object v1, Lcom/google/android/gms/common/stats/zzb;->zzadT:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/google/android/gms/common/stats/zzb;->zzafu:Lcom/google/android/gms/common/stats/zzb;

    if-nez v0, :cond_e

    new-instance v0, Lcom/google/android/gms/common/stats/zzb;

    invoke-direct {v0}, Lcom/google/android/gms/common/stats/zzb;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/stats/zzb;->zzafu:Lcom/google/android/gms/common/stats/zzb;

    :cond_e
    monitor-exit v1
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_12

    sget-object v0, Lcom/google/android/gms/common/stats/zzb;->zzafu:Lcom/google/android/gms/common/stats/zzb;

    return-object v0

    :catchall_12
    move-exception v0

    :try_start_13
    monitor-exit v1
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_12

    throw v0
.end method


# virtual methods
.method public zza(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    .registers 9

    const/4 v3, 0x0

    invoke-virtual {p1, p2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Landroid/content/ServiceConnection;Ljava/lang/String;Landroid/content/Intent;I)V

    return-void
.end method

.method public zza(Landroid/content/Context;Landroid/content/ServiceConnection;Ljava/lang/String;Landroid/content/Intent;)V
    .registers 11

    const/4 v5, 0x3

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Landroid/content/ServiceConnection;Ljava/lang/String;Landroid/content/Intent;I)V

    return-void
.end method

.method public zza(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    return v0
.end method

.method public zza(Landroid/content/Context;Ljava/lang/String;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    .registers 13

    invoke-direct {p0, p1, p3}, Lcom/google/android/gms/common/stats/zzb;->zzb(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_f

    const-string v0, "ConnectionTracker"

    const-string v1, "Attempted to bind to a service in a STOPPED package."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :goto_e
    return v0

    :cond_f
    invoke-virtual {p1, p3, p4, p5}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v6

    if-eqz v6, :cond_1e

    const/4 v5, 0x2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p4

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Landroid/content/ServiceConnection;Ljava/lang/String;Landroid/content/Intent;I)V

    :cond_1e
    move v0, v6

    goto :goto_e
.end method

.method public zzb(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    .registers 9

    const/4 v3, 0x0

    const/4 v5, 0x4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Landroid/content/ServiceConnection;Ljava/lang/String;Landroid/content/Intent;I)V

    return-void
.end method
