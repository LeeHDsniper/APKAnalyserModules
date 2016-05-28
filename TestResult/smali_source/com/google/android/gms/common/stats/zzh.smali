.class public Lcom/google/android/gms/common/stats/zzh;
.super Ljava/lang/Object;


# static fields
.field private static TAG:Ljava/lang/String;

.field private static zzafB:Ljava/lang/Integer;

.field private static final zzafz:Landroid/content/ComponentName;

.field private static zzaga:Lcom/google/android/gms/common/stats/zzh;

.field private static zzagb:Landroid/content/IntentFilter;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const-string v0, "WakeLockTracker"

    sput-object v0, Lcom/google/android/gms/common/stats/zzh;->TAG:Ljava/lang/String;

    new-instance v0, Lcom/google/android/gms/common/stats/zzh;

    invoke-direct {v0}, Lcom/google/android/gms/common/stats/zzh;-><init>()V

    sput-object v0, Lcom/google/android/gms/common/stats/zzh;->zzaga:Lcom/google/android/gms/common/stats/zzh;

    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.google.android.gms"

    const-string v2, "com.google.android.gms.common.stats.GmsCoreStatsService"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/common/stats/zzh;->zzafz:Landroid/content/ComponentName;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/google/android/gms/common/stats/zzh;->zzagb:Landroid/content/IntentFilter;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getLogLevel()I
    .registers 1

    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/zzll;->zzjk()Z

    move-result v0

    if-eqz v0, :cond_13

    sget-object v0, Lcom/google/android/gms/common/stats/zzc$zzb;->zzafD:Lcom/google/android/gms/internal/zzkq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzkq;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_12
    return v0

    :cond_13
    sget v0, Lcom/google/android/gms/common/stats/zzd;->LOG_LEVEL_OFF:I
    :try_end_15
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_15} :catch_16

    goto :goto_12

    :catch_16
    move-exception v0

    sget v0, Lcom/google/android/gms/common/stats/zzd;->LOG_LEVEL_OFF:I

    goto :goto_12
.end method

.method private zzal(Landroid/content/Context;)I
    .registers 7

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    sget-object v4, Lcom/google/android/gms/common/stats/zzh;->zzagb:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    if-nez v0, :cond_30

    move v0, v3

    :goto_10
    and-int/lit8 v0, v0, 0x7

    if-eqz v0, :cond_37

    move v1, v2

    :goto_15
    invoke-static {}, Lcom/google/android/gms/internal/zzlv;->zzpW()Z

    move-result v0

    if-eqz v0, :cond_39

    const-string v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isInteractive()Z

    move-result v0

    :goto_27
    if-eqz v0, :cond_46

    move v0, v2

    :goto_2a
    shl-int/lit8 v0, v0, 0x1

    if-eqz v1, :cond_48

    :goto_2e
    or-int/2addr v0, v2

    return v0

    :cond_30
    const-string v1, "plugged"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    goto :goto_10

    :cond_37
    move v1, v3

    goto :goto_15

    :cond_39
    const-string v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    goto :goto_27

    :cond_46
    move v0, v3

    goto :goto_2a

    :cond_48
    move v2, v3

    goto :goto_2e
.end method

.method private zzam(Landroid/content/Context;)F
    .registers 6

    const/4 v3, -0x1

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v1

    const/high16 v0, 0x7fc00000

    if-eqz v1, :cond_24

    const-string v0, "level"

    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const-string v2, "scale"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    int-to-float v0, v0

    int-to-float v1, v1

    div-float/2addr v0, v1

    :cond_24
    return v0
.end method

.method private static zzan(Landroid/content/Context;)Z
    .registers 3

    sget-object v0, Lcom/google/android/gms/common/stats/zzh;->zzafB:Ljava/lang/Integer;

    if-nez v0, :cond_e

    invoke-static {}, Lcom/google/android/gms/common/stats/zzh;->getLogLevel()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/common/stats/zzh;->zzafB:Ljava/lang/Integer;

    :cond_e
    sget-object v0, Lcom/google/android/gms/common/stats/zzh;->zzafB:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sget v1, Lcom/google/android/gms/common/stats/zzd;->LOG_LEVEL_OFF:I

    if-eq v0, v1, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public static zzpL()Lcom/google/android/gms/common/stats/zzh;
    .registers 1

    sget-object v0, Lcom/google/android/gms/common/stats/zzh;->zzaga:Lcom/google/android/gms/common/stats/zzh;

    return-object v0
.end method


# virtual methods
.method public zza(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/util/List;)V
    .registers 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static/range {p1 .. p1}, Lcom/google/android/gms/common/stats/zzh;->zzan(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_7

    :cond_6
    :goto_6
    return-void

    :cond_7
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_28

    sget-object v1, Lcom/google/android/gms/common/stats/zzh;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "missing wakeLock key. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    :cond_28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const/4 v1, 0x7

    move/from16 v0, p3

    if-eq v1, v0, :cond_43

    const/16 v1, 0x8

    move/from16 v0, p3

    if-eq v1, v0, :cond_43

    const/16 v1, 0xa

    move/from16 v0, p3

    if-eq v1, v0, :cond_43

    const/16 v1, 0xb

    move/from16 v0, p3

    if-ne v1, v0, :cond_6

    :cond_43
    new-instance v1, Lcom/google/android/gms/common/stats/WakeLockEvent;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v9

    invoke-direct/range {p0 .. p1}, Lcom/google/android/gms/common/stats/zzh;->zzal(Landroid/content/Context;)I

    move-result v11

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    invoke-direct/range {p0 .. p1}, Lcom/google/android/gms/common/stats/zzh;->zzam(Landroid/content/Context;)F

    move-result v14

    move/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p2

    move-object/from16 v12, p5

    invoke-direct/range {v1 .. v14}, Lcom/google/android/gms/common/stats/WakeLockEvent;-><init>(JILjava/lang/String;ILjava/util/List;Ljava/lang/String;JILjava/lang/String;Ljava/lang/String;F)V

    :try_start_64
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    sget-object v3, Lcom/google/android/gms/common/stats/zzh;->zzafz:Landroid/content/ComponentName;

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "com.google.android.gms.common.stats.EXTRA_LOG_EVENT"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_7a} :catch_7b

    goto :goto_6

    :catch_7b
    move-exception v1

    sget-object v2, Lcom/google/android/gms/common/stats/zzh;->TAG:Ljava/lang/String;

    invoke-static {v2, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6
.end method
