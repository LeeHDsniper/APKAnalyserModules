.class public Lcom/google/android/gms/internal/zzqd;
.super Ljava/lang/Object;


# static fields
.field private static DEBUG:Z

.field private static TAG:Ljava/lang/String;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private zzaOA:I

.field private final zzaOu:Landroid/os/PowerManager$WakeLock;

.field private zzaOv:Landroid/os/WorkSource;

.field private final zzaOw:I

.field private final zzaOx:Ljava/lang/String;

.field private zzaOy:Z

.field private zzaOz:I

.field private final zzafS:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "WakeLock"

    sput-object v0, Lcom/google/android/gms/internal/zzqd;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/android/gms/internal/zzqd;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;)V
    .registers 10

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzqd;-><init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOy:Z

    const-string v0, "Wake lock name can NOT be empty"

    invoke-static {p3, v0}, Lcom/google/android/gms/common/internal/zzx;->zzh(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    iput p2, p0, Lcom/google/android/gms/internal/zzqd;->zzaOw:I

    iput-object p3, p0, Lcom/google/android/gms/internal/zzqd;->zzafS:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzqd;->zzaOx:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqd;->mContext:Landroid/content/Context;

    const-string v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    invoke-virtual {v0, p2, p3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOu:Landroid/os/PowerManager$WakeLock;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqd;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzma;->zzaq(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_6a

    invoke-static {p5}, Lcom/google/android/gms/internal/zzlz;->zzcB(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5f

    sget-boolean v0, Lcom/google/android/gms/common/internal/zzd;->zzacF:Z

    if-eqz v0, :cond_6b

    invoke-static {}, Lcom/google/android/gms/internal/zzkq;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_6b

    sget-object v0, Lcom/google/android/gms/internal/zzqd;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "callingPackage is not supposed to be empty for wakelock "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzqd;->zzafS:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string p5, "com.google.android.gms"

    :cond_5f
    :goto_5f
    invoke-static {p1, p5}, Lcom/google/android/gms/internal/zzma;->zzj(Landroid/content/Context;Ljava/lang/String;)Landroid/os/WorkSource;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOv:Landroid/os/WorkSource;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOv:Landroid/os/WorkSource;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzqd;->zzc(Landroid/os/WorkSource;)V

    :cond_6a
    return-void

    :cond_6b
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p5

    goto :goto_5f
.end method

.method private zzen(Ljava/lang/String;)V
    .registers 10

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzqd;->zzep(Ljava/lang/String;)Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzqd;->zzi(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    sget-boolean v1, Lcom/google/android/gms/internal/zzqd;->DEBUG:Z

    if-eqz v1, :cond_68

    sget-object v1, Lcom/google/android/gms/internal/zzqd;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Acquire:\n mWakeLockName: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzqd;->zzafS:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n mSecondaryName: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzqd;->zzaOx:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nmReferenceCounted: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzqd;->zzaOy:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nreason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nmOpenEventCount"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/google/android/gms/internal/zzqd;->zzaOA:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nuseWithReason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\ntrackingName: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_68
    monitor-enter p0

    :try_start_69
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzqd;->zzaOy:Z

    if-eqz v1, :cond_77

    iget v1, p0, Lcom/google/android/gms/internal/zzqd;->zzaOz:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/android/gms/internal/zzqd;->zzaOz:I

    if-eqz v1, :cond_7f

    if-nez v0, :cond_7f

    :cond_77
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOy:Z

    if-nez v0, :cond_9f

    iget v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOA:I

    if-nez v0, :cond_9f

    :cond_7f
    invoke-static {}, Lcom/google/android/gms/common/stats/zzh;->zzpL()Lcom/google/android/gms/common/stats/zzh;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqd;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzqd;->zzaOu:Landroid/os/PowerManager$WakeLock;

    invoke-static {v2, v5}, Lcom/google/android/gms/common/stats/zzf;->zza(Landroid/os/PowerManager$WakeLock;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x7

    iget-object v4, p0, Lcom/google/android/gms/internal/zzqd;->zzafS:Ljava/lang/String;

    iget v6, p0, Lcom/google/android/gms/internal/zzqd;->zzaOw:I

    iget-object v7, p0, Lcom/google/android/gms/internal/zzqd;->zzaOv:Landroid/os/WorkSource;

    invoke-static {v7}, Lcom/google/android/gms/internal/zzma;->zzb(Landroid/os/WorkSource;)Ljava/util/List;

    move-result-object v7

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/gms/common/stats/zzh;->zza(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/util/List;)V

    iget v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOA:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOA:I

    :cond_9f
    monitor-exit p0

    return-void

    :catchall_a1
    move-exception v0

    monitor-exit p0
    :try_end_a3
    .catchall {:try_start_69 .. :try_end_a3} :catchall_a1

    throw v0
.end method

.method private zzeo(Ljava/lang/String;)V
    .registers 10

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzqd;->zzep(Ljava/lang/String;)Z

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzqd;->zzi(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    sget-boolean v1, Lcom/google/android/gms/internal/zzqd;->DEBUG:Z

    if-eqz v1, :cond_68

    sget-object v1, Lcom/google/android/gms/internal/zzqd;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Release:\n mWakeLockName: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzqd;->zzafS:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n mSecondaryName: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzqd;->zzaOx:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nmReferenceCounted: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzqd;->zzaOy:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nreason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n mOpenEventCount"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/google/android/gms/internal/zzqd;->zzaOA:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\nuseWithReason: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\ntrackingName: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_68
    monitor-enter p0

    :try_start_69
    iget-boolean v1, p0, Lcom/google/android/gms/internal/zzqd;->zzaOy:Z

    if-eqz v1, :cond_77

    iget v1, p0, Lcom/google/android/gms/internal/zzqd;->zzaOz:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/android/gms/internal/zzqd;->zzaOz:I

    if-eqz v1, :cond_80

    if-nez v0, :cond_80

    :cond_77
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOy:Z

    if-nez v0, :cond_a1

    iget v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOA:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_a1

    :cond_80
    invoke-static {}, Lcom/google/android/gms/common/stats/zzh;->zzpL()Lcom/google/android/gms/common/stats/zzh;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqd;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzqd;->zzaOu:Landroid/os/PowerManager$WakeLock;

    invoke-static {v2, v5}, Lcom/google/android/gms/common/stats/zzf;->zza(Landroid/os/PowerManager$WakeLock;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x8

    iget-object v4, p0, Lcom/google/android/gms/internal/zzqd;->zzafS:Ljava/lang/String;

    iget v6, p0, Lcom/google/android/gms/internal/zzqd;->zzaOw:I

    iget-object v7, p0, Lcom/google/android/gms/internal/zzqd;->zzaOv:Landroid/os/WorkSource;

    invoke-static {v7}, Lcom/google/android/gms/internal/zzma;->zzb(Landroid/os/WorkSource;)Ljava/util/List;

    move-result-object v7

    invoke-virtual/range {v0 .. v7}, Lcom/google/android/gms/common/stats/zzh;->zza(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/util/List;)V

    iget v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOA:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOA:I

    :cond_a1
    monitor-exit p0

    return-void

    :catchall_a3
    move-exception v0

    monitor-exit p0
    :try_end_a5
    .catchall {:try_start_69 .. :try_end_a5} :catchall_a3

    throw v0
.end method

.method private zzep(Ljava/lang/String;)Z
    .registers 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_10

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOx:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private zzi(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 4

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOy:Z

    if-eqz v0, :cond_a

    if-eqz p2, :cond_7

    :goto_6
    return-object p1

    :cond_7
    iget-object p1, p0, Lcom/google/android/gms/internal/zzqd;->zzaOx:Ljava/lang/String;

    goto :goto_6

    :cond_a
    iget-object p1, p0, Lcom/google/android/gms/internal/zzqd;->zzaOx:Ljava/lang/String;

    goto :goto_6
.end method


# virtual methods
.method public acquire(J)V
    .registers 6
    .param p1, "timeout"    # J

    .prologue
    invoke-static {}, Lcom/google/android/gms/internal/zzlv;->zzpR()Z

    move-result v0

    if-nez v0, :cond_24

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOy:Z

    if-eqz v0, :cond_24

    sget-object v0, Lcom/google/android/gms/internal/zzqd;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Do not acquire with timeout on reference counted WakeLocks before ICS. wakelock: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzqd;->zzafS:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    :cond_24
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzqd;->zzen(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOu:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0, p1, p2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    return-void
.end method

.method public isHeld()Z
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOu:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    return v0
.end method

.method public release()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/zzqd;->zzeo(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOu:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    return-void
.end method

.method public setReferenceCounted(Z)V
    .registers 3
    .param p1, "value"    # Z

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOu:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0, p1}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzqd;->zzaOy:Z

    return-void
.end method

.method public zzc(Landroid/os/WorkSource;)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqd;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzma;->zzaq(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1a

    if-eqz p1, :cond_1a

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOv:Landroid/os/WorkSource;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOv:Landroid/os/WorkSource;

    invoke-virtual {v0, p1}, Landroid/os/WorkSource;->add(Landroid/os/WorkSource;)Z

    :goto_13
    iget-object v0, p0, Lcom/google/android/gms/internal/zzqd;->zzaOu:Landroid/os/PowerManager$WakeLock;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqd;->zzaOv:Landroid/os/WorkSource;

    invoke-virtual {v0, v1}, Landroid/os/PowerManager$WakeLock;->setWorkSource(Landroid/os/WorkSource;)V

    :cond_1a
    return-void

    :cond_1b
    iput-object p1, p0, Lcom/google/android/gms/internal/zzqd;->zzaOv:Landroid/os/WorkSource;

    goto :goto_13
.end method
