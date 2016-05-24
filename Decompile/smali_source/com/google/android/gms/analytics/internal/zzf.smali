.class public Lcom/google/android/gms/analytics/internal/zzf;
.super Ljava/lang/Object;


# static fields
.field private static zzLC:Lcom/google/android/gms/analytics/internal/zzf;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzLD:Landroid/content/Context;

.field private final zzLE:Lcom/google/android/gms/analytics/internal/zzr;

.field private final zzLF:Lcom/google/android/gms/analytics/internal/zzaf;

.field private final zzLG:Lcom/google/android/gms/internal/zzof;

.field private final zzLH:Lcom/google/android/gms/analytics/internal/zzb;

.field private final zzLI:Lcom/google/android/gms/analytics/internal/zzv;

.field private final zzLJ:Lcom/google/android/gms/analytics/internal/zzan;

.field private final zzLK:Lcom/google/android/gms/analytics/internal/zzai;

.field private final zzLL:Lcom/google/android/gms/analytics/GoogleAnalytics;

.field private final zzLM:Lcom/google/android/gms/analytics/internal/zzn;

.field private final zzLN:Lcom/google/android/gms/analytics/internal/zza;

.field private final zzLO:Lcom/google/android/gms/analytics/internal/zzk;

.field private final zzLP:Lcom/google/android/gms/analytics/internal/zzu;

.field private final zzpO:Lcom/google/android/gms/internal/zzlm;


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/analytics/internal/zzg;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzg;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Application context can\'t be null"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    instance-of v1, v0, Landroid/app/Application;

    const-string v2, "getApplicationContext didn\'t return the application"

    invoke-static {v1, v2}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzg;->zziq()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->mContext:Landroid/content/Context;

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLD:Landroid/content/Context;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzh(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/internal/zzlm;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzpO:Lcom/google/android/gms/internal/zzlm;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzg(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLE:Lcom/google/android/gms/analytics/internal/zzr;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzf(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzaf;->zza()V

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLF:Lcom/google/android/gms/analytics/internal/zzaf;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v1

    if-eqz v1, :cond_d6

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Google Analytics "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/analytics/internal/zze;->VERSION:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is starting up."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/analytics/internal/zzaf;->zzba(Ljava/lang/String;)V

    :goto_5f
    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzq(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzai;->zza()V

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLK:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zze(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzan;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzan;->zza()V

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLJ:Lcom/google/android/gms/analytics/internal/zzan;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzl(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzb;

    move-result-object v1

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzd(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzn;

    move-result-object v2

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzc(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zza;

    move-result-object v3

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzb(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzk;

    move-result-object v4

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zza(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzu;

    move-result-object v5

    invoke-virtual {p1, v0}, Lcom/google/android/gms/analytics/internal/zzg;->zzY(Landroid/content/Context;)Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzip()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/google/android/gms/internal/zzof;->zza(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLG:Lcom/google/android/gms/internal/zzof;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzi(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v0

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzn;->zza()V

    iput-object v2, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLM:Lcom/google/android/gms/analytics/internal/zzn;

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/internal/zza;->zza()V

    iput-object v3, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLN:Lcom/google/android/gms/analytics/internal/zza;

    invoke-virtual {v4}, Lcom/google/android/gms/analytics/internal/zzk;->zza()V

    iput-object v4, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLO:Lcom/google/android/gms/analytics/internal/zzk;

    invoke-virtual {v5}, Lcom/google/android/gms/analytics/internal/zzu;->zza()V

    iput-object v5, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLP:Lcom/google/android/gms/analytics/internal/zzu;

    invoke-virtual {p1, p0}, Lcom/google/android/gms/analytics/internal/zzg;->zzp(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzv;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzv;->zza()V

    iput-object v2, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLI:Lcom/google/android/gms/analytics/internal/zzv;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzb;->zza()V

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLH:Lcom/google/android/gms/analytics/internal/zzb;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v2

    if-eqz v2, :cond_cd

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v2

    const-string v3, "Device AnalyticsService version"

    sget-object v4, Lcom/google/android/gms/analytics/internal/zze;->VERSION:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/analytics/internal/zzaf;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_cd
    invoke-virtual {v0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->zza()V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLL:Lcom/google/android/gms/analytics/GoogleAnalytics;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzb;->start()V

    return-void

    :cond_d6
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Google Analytics "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/google/android/gms/analytics/internal/zze;->VERSION:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is starting up. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "To enable debug logging on a device run:\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  adb shell setprop log.tag.GAv4 DEBUG\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  adb logcat -s GAv4"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/analytics/internal/zzaf;->zzba(Ljava/lang/String;)V

    goto/16 :goto_5f
.end method

.method public static zzX(Landroid/content/Context;)Lcom/google/android/gms/analytics/internal/zzf;
    .registers 9

    invoke-static {p0}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzf;->zzLC:Lcom/google/android/gms/analytics/internal/zzf;

    if-nez v0, :cond_51

    const-class v1, Lcom/google/android/gms/analytics/internal/zzf;

    monitor-enter v1

    :try_start_a
    sget-object v0, Lcom/google/android/gms/analytics/internal/zzf;->zzLC:Lcom/google/android/gms/analytics/internal/zzf;

    if-nez v0, :cond_50

    invoke-static {}, Lcom/google/android/gms/internal/zzlo;->zzpN()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->elapsedRealtime()J

    move-result-wide v2

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    new-instance v5, Lcom/google/android/gms/analytics/internal/zzg;

    invoke-direct {v5, v4}, Lcom/google/android/gms/analytics/internal/zzg;-><init>(Landroid/content/Context;)V

    new-instance v4, Lcom/google/android/gms/analytics/internal/zzf;

    invoke-direct {v4, v5}, Lcom/google/android/gms/analytics/internal/zzf;-><init>(Lcom/google/android/gms/analytics/internal/zzg;)V

    sput-object v4, Lcom/google/android/gms/analytics/internal/zzf;->zzLC:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-static {}, Lcom/google/android/gms/analytics/GoogleAnalytics;->zzhx()V

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->elapsedRealtime()J

    move-result-wide v6

    sub-long v2, v6, v2

    sget-object v0, Lcom/google/android/gms/analytics/internal/zzy;->zzNO:Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzy$zza;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v0, v2, v6

    if-lez v0, :cond_50

    invoke-virtual {v4}, Lcom/google/android/gms/analytics/internal/zzf;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v4, "Slow initialization (ms)"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v4, v2, v3}, Lcom/google/android/gms/analytics/internal/zzaf;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_50
    monitor-exit v1
    :try_end_51
    .catchall {:try_start_a .. :try_end_51} :catchall_54

    :cond_51
    sget-object v0, Lcom/google/android/gms/analytics/internal/zzf;->zzLC:Lcom/google/android/gms/analytics/internal/zzf;

    return-object v0

    :catchall_54
    move-exception v0

    :try_start_55
    monitor-exit v1
    :try_end_56
    .catchall {:try_start_55 .. :try_end_56} :catchall_54

    throw v0
.end method

.method private zza(Lcom/google/android/gms/analytics/internal/zzd;)V
    .registers 4

    const-string v0, "Analytics service not created/initialized"

    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzd;->isInitialized()Z

    move-result v0

    const-string v1, "Analytics service not initialized"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getContext()Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public zzhA()Lcom/google/android/gms/analytics/internal/zzan;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLJ:Lcom/google/android/gms/analytics/internal/zzan;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLJ:Lcom/google/android/gms/analytics/internal/zzan;

    return-object v0
.end method

.method public zzhz()Lcom/google/android/gms/analytics/internal/zzb;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLH:Lcom/google/android/gms/analytics/internal/zzb;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLH:Lcom/google/android/gms/analytics/internal/zzb;

    return-object v0
.end method

.method public zzic()V
    .registers 1

    invoke-static {}, Lcom/google/android/gms/internal/zzof;->zzic()V

    return-void
.end method

.method public zzid()Lcom/google/android/gms/internal/zzlm;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzpO:Lcom/google/android/gms/internal/zzlm;

    return-object v0
.end method

.method public zzie()Lcom/google/android/gms/analytics/internal/zzaf;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLF:Lcom/google/android/gms/analytics/internal/zzaf;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLF:Lcom/google/android/gms/analytics/internal/zzaf;

    return-object v0
.end method

.method public zzif()Lcom/google/android/gms/analytics/internal/zzr;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLE:Lcom/google/android/gms/analytics/internal/zzr;

    return-object v0
.end method

.method public zzig()Lcom/google/android/gms/internal/zzof;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLG:Lcom/google/android/gms/internal/zzof;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLG:Lcom/google/android/gms/internal/zzof;

    return-object v0
.end method

.method public zzih()Lcom/google/android/gms/analytics/internal/zzv;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLI:Lcom/google/android/gms/analytics/internal/zzv;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLI:Lcom/google/android/gms/analytics/internal/zzv;

    return-object v0
.end method

.method public zzii()Lcom/google/android/gms/analytics/internal/zzai;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLK:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLK:Lcom/google/android/gms/analytics/internal/zzai;

    return-object v0
.end method

.method public zzil()Lcom/google/android/gms/analytics/internal/zzk;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLO:Lcom/google/android/gms/analytics/internal/zzk;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLO:Lcom/google/android/gms/analytics/internal/zzk;

    return-object v0
.end method

.method public zzim()Lcom/google/android/gms/analytics/internal/zzu;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLP:Lcom/google/android/gms/analytics/internal/zzu;

    return-object v0
.end method

.method protected zzip()Ljava/lang/Thread$UncaughtExceptionHandler;
    .registers 2

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzf$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/analytics/internal/zzf$1;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    return-object v0
.end method

.method public zziq()Landroid/content/Context;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLD:Landroid/content/Context;

    return-object v0
.end method

.method public zzir()Lcom/google/android/gms/analytics/internal/zzaf;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLF:Lcom/google/android/gms/analytics/internal/zzaf;

    return-object v0
.end method

.method public zzis()Lcom/google/android/gms/analytics/GoogleAnalytics;
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLL:Lcom/google/android/gms/analytics/GoogleAnalytics;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLL:Lcom/google/android/gms/analytics/GoogleAnalytics;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->isInitialized()Z

    move-result v0

    const-string v1, "Analytics instance not initialized"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLL:Lcom/google/android/gms/analytics/GoogleAnalytics;

    return-object v0
.end method

.method public zzit()Lcom/google/android/gms/analytics/internal/zzai;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLK:Lcom/google/android/gms/analytics/internal/zzai;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLK:Lcom/google/android/gms/analytics/internal/zzai;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_e

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return-object v0

    :cond_e
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLK:Lcom/google/android/gms/analytics/internal/zzai;

    goto :goto_d
.end method

.method public zziu()Lcom/google/android/gms/analytics/internal/zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLN:Lcom/google/android/gms/analytics/internal/zza;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLN:Lcom/google/android/gms/analytics/internal/zza;

    return-object v0
.end method

.method public zziv()Lcom/google/android/gms/analytics/internal/zzn;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLM:Lcom/google/android/gms/analytics/internal/zzn;

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzf;->zza(Lcom/google/android/gms/analytics/internal/zzd;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzf;->zzLM:Lcom/google/android/gms/analytics/internal/zzn;

    return-object v0
.end method
