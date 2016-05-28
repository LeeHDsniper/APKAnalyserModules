.class Lcom/google/android/gms/analytics/internal/zzl;
.super Lcom/google/android/gms/analytics/internal/zzd;


# instance fields
.field private mStarted:Z

.field private final zzMn:Lcom/google/android/gms/analytics/internal/zzj;

.field private final zzMo:Lcom/google/android/gms/analytics/internal/zzah;

.field private final zzMp:Lcom/google/android/gms/analytics/internal/zzag;

.field private final zzMq:Lcom/google/android/gms/analytics/internal/zzi;

.field private zzMr:J

.field private final zzMs:Lcom/google/android/gms/analytics/internal/zzt;

.field private final zzMt:Lcom/google/android/gms/analytics/internal/zzt;

.field private final zzMu:Lcom/google/android/gms/analytics/internal/zzaj;

.field private zzMv:J

.field private zzMw:Z


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;Lcom/google/android/gms/analytics/internal/zzg;)V
    .registers 5

    invoke-direct {p0, p1}, Lcom/google/android/gms/analytics/internal/zzd;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMr:J

    invoke-virtual {p2, p1}, Lcom/google/android/gms/analytics/internal/zzg;->zzk(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzag;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMp:Lcom/google/android/gms/analytics/internal/zzag;

    invoke-virtual {p2, p1}, Lcom/google/android/gms/analytics/internal/zzg;->zzm(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzj;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {p2, p1}, Lcom/google/android/gms/analytics/internal/zzg;->zzn(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzah;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMo:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-virtual {p2, p1}, Lcom/google/android/gms/analytics/internal/zzg;->zzo(Lcom/google/android/gms/analytics/internal/zzf;)Lcom/google/android/gms/analytics/internal/zzi;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMq:Lcom/google/android/gms/analytics/internal/zzi;

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzaj;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/analytics/internal/zzaj;-><init>(Lcom/google/android/gms/internal/zzlm;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMu:Lcom/google/android/gms/analytics/internal/zzaj;

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzl$1;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/analytics/internal/zzl$1;-><init>(Lcom/google/android/gms/analytics/internal/zzl;Lcom/google/android/gms/analytics/internal/zzf;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMs:Lcom/google/android/gms/analytics/internal/zzt;

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzl$2;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/analytics/internal/zzl$2;-><init>(Lcom/google/android/gms/analytics/internal/zzl;Lcom/google/android/gms/analytics/internal/zzf;)V

    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMt:Lcom/google/android/gms/analytics/internal/zzt;

    return-void
.end method

.method private zza(Lcom/google/android/gms/analytics/internal/zzh;Lcom/google/android/gms/internal/zzol;)V
    .registers 11

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/analytics/zza;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzia()Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/analytics/zza;-><init>(Lcom/google/android/gms/analytics/internal/zzf;)V

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zzix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/zza;->zzaN(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zziy()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/zza;->enableAdvertisingIdCollection(Z)V

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/zza;->zzhq()Lcom/google/android/gms/internal/zzob;

    move-result-object v5

    const-class v0, Lcom/google/android/gms/internal/zzjb;

    invoke-virtual {v5, v0}, Lcom/google/android/gms/internal/zzob;->zze(Ljava/lang/Class;)Lcom/google/android/gms/internal/zzod;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjb;

    const-string v1, "data"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzjb;->zzaS(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzjb;->zzH(Z)V

    invoke-virtual {v5, p2}, Lcom/google/android/gms/internal/zzob;->zzb(Lcom/google/android/gms/internal/zzod;)V

    const-class v1, Lcom/google/android/gms/internal/zzja;

    invoke-virtual {v5, v1}, Lcom/google/android/gms/internal/zzob;->zze(Ljava/lang/Class;)Lcom/google/android/gms/internal/zzod;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzja;

    const-class v2, Lcom/google/android/gms/internal/zzok;

    invoke-virtual {v5, v2}, Lcom/google/android/gms/internal/zzob;->zze(Ljava/lang/Class;)Lcom/google/android/gms/internal/zzod;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/zzok;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zzn()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_51
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v7, "an"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_75

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzok;->setAppName(Ljava/lang/String;)V

    goto :goto_51

    :cond_75
    const-string v7, "av"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_81

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzok;->setAppVersion(Ljava/lang/String;)V

    goto :goto_51

    :cond_81
    const-string v7, "aid"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8d

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzok;->setAppId(Ljava/lang/String;)V

    goto :goto_51

    :cond_8d
    const-string v7, "aiid"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_99

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzok;->setAppInstallerId(Ljava/lang/String;)V

    goto :goto_51

    :cond_99
    const-string v7, "uid"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a5

    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/zzjb;->setUserId(Ljava/lang/String;)V

    goto :goto_51

    :cond_a5
    invoke-virtual {v1, v4, v3}, Lcom/google/android/gms/internal/zzja;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_51

    :cond_a9
    const-string v0, "Sending installation campaign to"

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zzix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p2}, Lcom/google/android/gms/analytics/internal/zzl;->zzb(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzky()J

    move-result-wide v0

    invoke-virtual {v5, v0, v1}, Lcom/google/android/gms/internal/zzob;->zzL(J)V

    invoke-virtual {v5}, Lcom/google/android/gms/internal/zzob;->zzxl()V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/analytics/internal/zzl;)V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziO()V

    return-void
.end method

.method static synthetic zzb(Lcom/google/android/gms/analytics/internal/zzl;)V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziP()V

    return-void
.end method

.method private zzbf(Ljava/lang/String;)Z
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private zziM()V
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzia()Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/analytics/AnalyticsReceiver;->zzV(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1f

    const-string v1, "AnalyticsReceiver is not registered or is disabled. Register the receiver for reliable dispatching on non-Google Play devices. See http://goo.gl/8Rd3yj for instructions."

    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/internal/zzl;->zzbb(Ljava/lang/String;)V

    :cond_13
    :goto_13
    invoke-static {v0}, Lcom/google/android/gms/analytics/CampaignTrackingReceiver;->zzV(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_2b

    const-string v0, "CampaignTrackingReceiver is not registered, not exported or is disabled. Installation campaign tracking is not possible. See http://goo.gl/8Rd3yj for instructions."

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzbb(Ljava/lang/String;)V

    :cond_1e
    :goto_1e
    return-void

    :cond_1f
    invoke-static {v0}, Lcom/google/android/gms/analytics/AnalyticsService;->zzW(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_13

    const-string v1, "AnalyticsService is not registered or is disabled. Analytics service at risk of not starting. See http://goo.gl/8Rd3yj for instructions."

    invoke-virtual {p0, v1}, Lcom/google/android/gms/analytics/internal/zzl;->zzbc(Ljava/lang/String;)V

    goto :goto_13

    :cond_2b
    invoke-static {v0}, Lcom/google/android/gms/analytics/CampaignTrackingService;->zzW(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1e

    const-string v0, "CampaignTrackingService is not registered or is disabled. Installation campaign tracking is not possible. See http://goo.gl/8Rd3yj for instructions."

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzbb(Ljava/lang/String;)V

    goto :goto_1e
.end method

.method private zziO()V
    .registers 2

    new-instance v0, Lcom/google/android/gms/analytics/internal/zzl$4;

    invoke-direct {v0, p0}, Lcom/google/android/gms/analytics/internal/zzl$4;-><init>(Lcom/google/android/gms/analytics/internal/zzl;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzb(Lcom/google/android/gms/analytics/internal/zzw;)V

    return-void
.end method

.method private zziP()V
    .registers 5

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->zziG()I

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziU()V
    :try_end_8
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_8} :catch_16

    :goto_8
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMt:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzjM()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzt;->zzt(J)V

    return-void

    :catch_16
    move-exception v0

    const-string v1, "Failed to delete stale hits"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_8
.end method

.method private zziV()Z
    .registers 7

    const/4 v0, 0x0

    iget-boolean v1, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMw:Z

    if-eqz v1, :cond_6

    :cond_5
    :goto_5
    return v0

    :cond_6
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzjl()Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_1a
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzjb()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_5

    const/4 v0, 0x1

    goto :goto_5
.end method

.method private zziW()V
    .registers 7

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzih()Lcom/google/android/gms/analytics/internal/zzv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzv;->zzjU()Z

    move-result v1

    if-nez v1, :cond_b

    :cond_a
    :goto_a
    return-void

    :cond_b
    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzv;->zzbr()Z

    move-result v1

    if-nez v1, :cond_a

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziH()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_a

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v4

    sub-long v2, v4, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzju()J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-gtz v1, :cond_a

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzjt()J

    move-result-wide v2

    const-string v1, "Dispatch alarm scheduled (ms)"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzl;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzv;->zzjV()V

    goto :goto_a
.end method

.method private zziX()V
    .registers 9

    const-wide/16 v6, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziW()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzjb()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzkA()J

    move-result-wide v0

    cmp-long v4, v0, v6

    if-eqz v4, :cond_5a

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v4

    invoke-interface {v4}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v4

    sub-long v0, v4, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    sub-long v0, v2, v0

    cmp-long v4, v0, v6

    if-lez v4, :cond_4d

    :goto_29
    const-string v2, "Dispatch scheduled (ms)"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzl;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMs:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzt;->zzbr()Z

    move-result v2

    if-eqz v2, :cond_67

    const-wide/16 v2, 0x1

    iget-object v4, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMs:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-virtual {v4}, Lcom/google/android/gms/analytics/internal/zzt;->zzjR()J

    move-result-wide v4

    add-long/2addr v0, v4

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMs:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-virtual {v2, v0, v1}, Lcom/google/android/gms/analytics/internal/zzt;->zzu(J)V

    :goto_4c
    return-void

    :cond_4d
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjr()J

    move-result-wide v0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    goto :goto_29

    :cond_5a
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjr()J

    move-result-wide v0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    goto :goto_29

    :cond_67
    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMs:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-virtual {v2, v0, v1}, Lcom/google/android/gms/analytics/internal/zzt;->zzt(J)V

    goto :goto_4c
.end method

.method private zziY()V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziZ()V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzja()V

    return-void
.end method

.method private zziZ()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMs:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzt;->zzbr()Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "All hits dispatched or no network/service. Going to power save mode"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaY(Ljava/lang/String;)V

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMs:Lcom/google/android/gms/analytics/internal/zzt;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzt;->cancel()V

    return-void
.end method

.method private zzja()V
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzih()Lcom/google/android/gms/analytics/internal/zzv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzv;->zzbr()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzv;->cancel()V

    :cond_d
    return-void
.end method


# virtual methods
.method protected onServiceConnected()V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziR()V

    :cond_10
    return-void
.end method

.method start()V
    .registers 4

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzio()V

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->mStarted:Z

    if-nez v0, :cond_2a

    move v0, v1

    :goto_9
    const-string v2, "Analytics backend already started"

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    iput-boolean v1, p0, Lcom/google/android/gms/analytics/internal/zzl;->mStarted:Z

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-nez v0, :cond_1d

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziM()V

    :cond_1d
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/analytics/internal/zzl$3;

    invoke-direct {v1, p0}, Lcom/google/android/gms/analytics/internal/zzl$3;-><init>(Lcom/google/android/gms/analytics/internal/zzl;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzof;->zzf(Ljava/lang/Runnable;)V

    return-void

    :cond_2a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public zzI(Z)V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziU()V

    return-void
.end method

.method public zza(Lcom/google/android/gms/analytics/internal/zzh;Z)J
    .registers 8

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzic()V

    :try_start_9
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->beginTransaction()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zziw()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v3, v1}, Lcom/google/android/gms/analytics/internal/zzj;->zza(JLjava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zziw()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zzix()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v3, v1, v4}, Lcom/google/android/gms/analytics/internal/zzj;->zza(JLjava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    if-nez p2, :cond_42

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/analytics/internal/zzh;->zzn(J)V

    :goto_32
    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v2, p1}, Lcom/google/android/gms/analytics/internal/zzj;->zzb(Lcom/google/android/gms/analytics/internal/zzh;)V

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzj;->setTransactionSuccessful()V
    :try_end_3c
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_9 .. :try_end_3c} :catch_49
    .catchall {:try_start_9 .. :try_end_3c} :catchall_65

    :try_start_3c
    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzj;->endTransaction()V
    :try_end_41
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3c .. :try_end_41} :catch_5e

    :goto_41
    return-wide v0

    :cond_42
    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    :try_start_45
    invoke-virtual {p1, v2, v3}, Lcom/google/android/gms/analytics/internal/zzh;->zzn(J)V
    :try_end_48
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_45 .. :try_end_48} :catch_49
    .catchall {:try_start_45 .. :try_end_48} :catchall_65

    goto :goto_32

    :catch_49
    move-exception v0

    :try_start_4a
    const-string v1, "Failed to update Analytics property"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4f
    .catchall {:try_start_4a .. :try_end_4f} :catchall_65

    const-wide/16 v0, -0x1

    :try_start_51
    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzj;->endTransaction()V
    :try_end_56
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_51 .. :try_end_56} :catch_57

    goto :goto_41

    :catch_57
    move-exception v2

    const-string v3, "Failed to end transaction"

    invoke-virtual {p0, v3, v2}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_41

    :catch_5e
    move-exception v2

    const-string v3, "Failed to end transaction"

    invoke-virtual {p0, v3, v2}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_41

    :catchall_65
    move-exception v0

    :try_start_66
    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzj;->endTransaction()V
    :try_end_6b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_66 .. :try_end_6b} :catch_6c

    :goto_6b
    throw v0

    :catch_6c
    move-exception v1

    const-string v2, "Failed to end transaction"

    invoke-virtual {p0, v2, v1}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_6b
.end method

.method public zza(Lcom/google/android/gms/analytics/internal/zzab;)V
    .registers 5

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/google/android/gms/internal/zzof;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzio()V

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMw:Z

    if-eqz v0, :cond_27

    const-string v0, "Hit delivery not possible. Missing network permissions. See http://goo.gl/8Rd3yj for instructions"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaZ(Ljava/lang/String;)V

    :goto_12
    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/internal/zzl;->zzf(Lcom/google/android/gms/analytics/internal/zzab;)Lcom/google/android/gms/analytics/internal/zzab;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziQ()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMq:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/internal/zzi;->zzb(Lcom/google/android/gms/analytics/internal/zzab;)Z

    move-result v0

    if-eqz v0, :cond_2d

    const-string v0, "Hit sent to the device AnalyticsService for delivery"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaZ(Ljava/lang/String;)V

    :goto_26
    return-void

    :cond_27
    const-string v0, "Delivering hit"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/internal/zzl;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_12

    :cond_2d
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-eqz v0, :cond_41

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v2, "Service unavailable on package side"

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Lcom/google/android/gms/analytics/internal/zzab;Ljava/lang/String;)V

    goto :goto_26

    :cond_41
    :try_start_41
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/internal/zzj;->zzc(Lcom/google/android/gms/analytics/internal/zzab;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziU()V
    :try_end_49
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_41 .. :try_end_49} :catch_4a

    goto :goto_26

    :catch_4a
    move-exception v0

    const-string v2, "Delivery failed to save hit to a database"

    invoke-virtual {p0, v2, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    const-string v2, "deliver: failed to insert hit to database"

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/analytics/internal/zzaf;->zza(Lcom/google/android/gms/analytics/internal/zzab;Ljava/lang/String;)V

    goto :goto_26
.end method

.method public zza(Lcom/google/android/gms/analytics/internal/zzw;J)V
    .registers 10

    invoke-static {}, Lcom/google/android/gms/internal/zzof;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzio()V

    const-wide/16 v0, -0x1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzai;->zzkA()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-eqz v4, :cond_23

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    :cond_23
    const-string v2, "Dispatching local hits. Elapsed time since last dispatch (ms)"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v2, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-nez v0, :cond_39

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziQ()V

    :cond_39
    :try_start_39
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziS()Z

    move-result v0

    if-eqz v0, :cond_4c

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/analytics/internal/zzl$5;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/gms/analytics/internal/zzl$5;-><init>(Lcom/google/android/gms/analytics/internal/zzl;Lcom/google/android/gms/analytics/internal/zzw;J)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzof;->zzf(Ljava/lang/Runnable;)V

    :cond_4b
    :goto_4b
    return-void

    :cond_4c
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzkB()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziU()V

    if-eqz p1, :cond_5c

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/google/android/gms/analytics/internal/zzw;->zzc(Ljava/lang/Throwable;)V

    :cond_5c
    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMv:J

    cmp-long v0, v0, p2

    if-eqz v0, :cond_4b

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMp:Lcom/google/android/gms/analytics/internal/zzag;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzag;->zzkt()V
    :try_end_67
    .catch Ljava/lang/Throwable; {:try_start_39 .. :try_end_67} :catch_68

    goto :goto_4b

    :catch_68
    move-exception v0

    const-string v1, "Local dispatch failed"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzai;->zzkB()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziU()V

    if-eqz p1, :cond_4b

    invoke-interface {p1, v0}, Lcom/google/android/gms/analytics/internal/zzw;->zzc(Ljava/lang/Throwable;)V

    goto :goto_4b
.end method

.method public zzb(Lcom/google/android/gms/analytics/internal/zzw;)V
    .registers 4

    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMv:J

    invoke-virtual {p0, p1, v0, v1}, Lcom/google/android/gms/analytics/internal/zzl;->zza(Lcom/google/android/gms/analytics/internal/zzw;J)V

    return-void
.end method

.method public zzbg(Ljava/lang/String;)V
    .registers 6

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzib()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/android/gms/analytics/internal/zzam;->zza(Lcom/google/android/gms/analytics/internal/zzaf;Ljava/lang/String;)Lcom/google/android/gms/internal/zzol;

    move-result-object v1

    if-nez v1, :cond_19

    const-string v0, "Parsing failed. Ignoring invalid campaign data"

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/analytics/internal/zzl;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_18
    :goto_18
    return-void

    :cond_19
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzkC()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    const-string v0, "Ignoring duplicate install campaign"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzbb(Ljava/lang/String;)V

    goto :goto_18

    :cond_2d
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_39

    const-string v1, "Ignoring multiple install campaigns. original, new"

    invoke-virtual {p0, v1, v0, p1}, Lcom/google/android/gms/analytics/internal/zzl;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_18

    :cond_39
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/analytics/internal/zzai;->zzbk(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzkz()Lcom/google/android/gms/analytics/internal/zzaj;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzr;->zzjP()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzaj;->zzv(J)Z

    move-result v0

    if-eqz v0, :cond_5c

    const-string v0, "Campaign received too late, ignoring"

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzl;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_18

    :cond_5c
    const-string v0, "Received installation campaign"

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzl;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzj;->zzr(J)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_6d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/analytics/internal/zzh;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzl;->zza(Lcom/google/android/gms/analytics/internal/zzh;Lcom/google/android/gms/internal/zzol;)V

    goto :goto_6d
.end method

.method protected zzc(Lcom/google/android/gms/analytics/internal/zzh;)V
    .registers 6

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzic()V

    const-string v0, "Sending first hit to property"

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzh;->zzix()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzl;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzkz()Lcom/google/android/gms/analytics/internal/zzaj;

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzjP()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzaj;->zzv(J)Z

    move-result v0

    if-eqz v0, :cond_23

    :cond_22
    :goto_22
    return-void

    :cond_23
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzkC()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_22

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzie()Lcom/google/android/gms/analytics/internal/zzaf;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/google/android/gms/analytics/internal/zzam;->zza(Lcom/google/android/gms/analytics/internal/zzaf;Ljava/lang/String;)Lcom/google/android/gms/internal/zzol;

    move-result-object v0

    const-string v1, "Found relevant installation campaign"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zza(Lcom/google/android/gms/analytics/internal/zzh;Lcom/google/android/gms/internal/zzol;)V

    goto :goto_22
.end method

.method zzf(Lcom/google/android/gms/analytics/internal/zzab;)Lcom/google/android/gms/analytics/internal/zzab;
    .registers 5

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzko()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b

    :cond_a
    :goto_a
    return-object p1

    :cond_b
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzkD()Lcom/google/android/gms/analytics/internal/zzai$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai$zza;->zzkG()Landroid/util/Pair;

    move-result-object v1

    if-eqz v1, :cond_a

    iget-object v0, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    iget-object v1, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ":"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzab;->zzn()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    const-string v2, "_m"

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0, p1, v1}, Lcom/google/android/gms/analytics/internal/zzab;->zza(Lcom/google/android/gms/analytics/internal/zzc;Lcom/google/android/gms/analytics/internal/zzab;Ljava/util/Map;)Lcom/google/android/gms/analytics/internal/zzab;

    move-result-object p1

    goto :goto_a
.end method

.method protected zzhB()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->zza()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMo:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzah;->zza()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMq:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzi;->zza()V

    return-void
.end method

.method public zzhX()V
    .registers 2

    invoke-static {}, Lcom/google/android/gms/internal/zzof;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzio()V

    const-string v0, "Service disconnected"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaY(Ljava/lang/String;)V

    return-void
.end method

.method zzhZ()V
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzlm;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMv:J

    return-void
.end method

.method public zziH()J
    .registers 3

    invoke-static {}, Lcom/google/android/gms/internal/zzof;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzio()V

    :try_start_6
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->zziH()J
    :try_end_b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6 .. :try_end_b} :catch_d

    move-result-wide v0

    :goto_c
    return-wide v0

    :catch_d
    move-exception v0

    const-string v1, "Failed to get min/max hit times from local store"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 v0, 0x0

    goto :goto_c
.end method

.method protected zziN()V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzii()Lcom/google/android/gms/analytics/internal/zzai;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzai;->zzky()J

    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzbf(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1a

    const-string v0, "Missing required android.permission.ACCESS_NETWORK_STATE. Google Analytics disabled. See http://goo.gl/8Rd3yj for instructions"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzbc(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzjc()V

    :cond_1a
    const-string v0, "android.permission.INTERNET"

    invoke-direct {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzbf(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2a

    const-string v0, "Missing required android.permission.INTERNET. Google Analytics disabled. See http://goo.gl/8Rd3yj for instructions"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzbc(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzjc()V

    :cond_2a
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/analytics/AnalyticsService;->zzW(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_56

    const-string v0, "AnalyticsService registered in the app manifest and enabled"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaY(Ljava/lang/String;)V

    :goto_39
    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMw:Z

    if-nez v0, :cond_52

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-nez v0, :cond_52

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_52

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziQ()V

    :cond_52
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziU()V

    return-void

    :cond_56
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-eqz v0, :cond_66

    const-string v0, "Device AnalyticsService not registered! Hits will not be delivered reliably."

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzbc(Ljava/lang/String;)V

    goto :goto_39

    :cond_66
    const-string v0, "AnalyticsService not registered in the app manifest. Hits might not be delivered reliably. See http://goo.gl/8Rd3yj for instructions."

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzbb(Ljava/lang/String;)V

    goto :goto_39
.end method

.method protected zziQ()V
    .registers 4

    iget-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMw:Z

    if-eqz v0, :cond_5

    :cond_4
    :goto_4
    return-void

    :cond_5
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjm()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMq:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzi;->isConnected()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjH()J

    move-result-wide v0

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMu:Lcom/google/android/gms/analytics/internal/zzaj;

    invoke-virtual {v2, v0, v1}, Lcom/google/android/gms/analytics/internal/zzaj;->zzv(J)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMu:Lcom/google/android/gms/analytics/internal/zzaj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzaj;->start()V

    const-string v0, "Connecting to service"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaY(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMq:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzi;->connect()Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "Connected to service"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaY(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMu:Lcom/google/android/gms/analytics/internal/zzaj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzaj;->clear()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->onServiceConnected()V

    goto :goto_4
.end method

.method public zziR()V
    .registers 7

    invoke-static {}, Lcom/google/android/gms/internal/zzof;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzib()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjm()Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "Service client disabled. Can\'t dispatch local hits to device AnalyticsService"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzbb(Ljava/lang/String;)V

    :cond_18
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMq:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzi;->isConnected()Z

    move-result v0

    if-nez v0, :cond_26

    const-string v0, "Service not connected"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaY(Ljava/lang/String;)V

    :cond_25
    :goto_25
    return-void

    :cond_26
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_25

    const-string v0, "Dispatching local hits to device AnalyticsService"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaY(Ljava/lang/String;)V

    :cond_33
    :try_start_33
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzjv()I

    move-result v1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/analytics/internal/zzj;->zzp(J)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_62

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziU()V
    :try_end_4b
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_33 .. :try_end_4b} :catch_4c

    goto :goto_25

    :catch_4c
    move-exception v0

    const-string v1, "Failed to read hits from store"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    goto :goto_25

    :cond_56
    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :try_start_59
    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzab;->zzkj()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Lcom/google/android/gms/analytics/internal/zzj;->zzq(J)V
    :try_end_62
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_59 .. :try_end_62} :catch_7b

    :cond_62
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_33

    const/4 v0, 0x0

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/analytics/internal/zzab;

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMq:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v2, v0}, Lcom/google/android/gms/analytics/internal/zzi;->zzb(Lcom/google/android/gms/analytics/internal/zzab;)Z

    move-result v2

    if-nez v2, :cond_56

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziU()V

    goto :goto_25

    :catch_7b
    move-exception v0

    const-string v1, "Failed to remove hit that was send for delivery"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    goto :goto_25
.end method

.method protected zziS()Z
    .registers 13

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {}, Lcom/google/android/gms/internal/zzof;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzio()V

    const-string v0, "Dispatching a batch of local hits"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaY(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMq:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzi;->isConnected()Z

    move-result v0

    if-nez v0, :cond_32

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-nez v0, :cond_32

    move v0, v1

    :goto_20
    iget-object v3, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMo:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-virtual {v3}, Lcom/google/android/gms/analytics/internal/zzah;->zzku()Z

    move-result v3

    if-nez v3, :cond_34

    :goto_28
    if-eqz v0, :cond_36

    if-eqz v1, :cond_36

    const-string v0, "No network or service available. Will retry later"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaY(Ljava/lang/String;)V

    :goto_31
    return v2

    :cond_32
    move v0, v2

    goto :goto_20

    :cond_34
    move v1, v2

    goto :goto_28

    :cond_36
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjv()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzr;->zzjw()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-long v6, v0

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const-wide/16 v4, 0x0

    :goto_52
    :try_start_52
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->beginTransaction()V

    invoke-interface {v3}, Ljava/util/List;->clear()V
    :try_end_5a
    .catchall {:try_start_52 .. :try_end_5a} :catchall_1ee

    :try_start_5a
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0, v6, v7}, Lcom/google/android/gms/analytics/internal/zzj;->zzp(J)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_83

    const-string v0, "Store is empty, nothing to dispatch"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaY(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V
    :try_end_6e
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_5a .. :try_end_6e} :catch_d3
    .catchall {:try_start_5a .. :try_end_6e} :catchall_1ee

    :try_start_6e
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->setTransactionSuccessful()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->endTransaction()V
    :try_end_78
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6e .. :try_end_78} :catch_79

    goto :goto_31

    :catch_79
    move-exception v0

    const-string v1, "Failed to commit local dispatch transaction"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    goto :goto_31

    :cond_83
    :try_start_83
    const-string v0, "Hits loaded from store. count"

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/analytics/internal/zzl;->zza(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_90
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_83 .. :try_end_90} :catch_d3
    .catchall {:try_start_83 .. :try_end_90} :catchall_1ee

    :try_start_90
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_94
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/analytics/internal/zzab;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzab;->zzkj()J

    move-result-wide v10

    cmp-long v0, v10, v4

    if-nez v0, :cond_94

    const-string v0, "Database contains successfully uploaded hit"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0, v0, v1, v3}, Lcom/google/android/gms/analytics/internal/zzl;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V
    :try_end_bc
    .catchall {:try_start_90 .. :try_end_bc} :catchall_1ee

    :try_start_bc
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->setTransactionSuccessful()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->endTransaction()V
    :try_end_c6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_bc .. :try_end_c6} :catch_c8

    goto/16 :goto_31

    :catch_c8
    move-exception v0

    const-string v1, "Failed to commit local dispatch transaction"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    goto/16 :goto_31

    :catch_d3
    move-exception v0

    :try_start_d4
    const-string v1, "Failed to read hits from persisted store"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzd(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V
    :try_end_dc
    .catchall {:try_start_d4 .. :try_end_dc} :catchall_1ee

    :try_start_dc
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->setTransactionSuccessful()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->endTransaction()V
    :try_end_e6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_dc .. :try_end_e6} :catch_e8

    goto/16 :goto_31

    :catch_e8
    move-exception v0

    const-string v1, "Failed to commit local dispatch transaction"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    goto/16 :goto_31

    :cond_f3
    :try_start_f3
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMq:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzi;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_205

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjk()Z

    move-result v0

    if-nez v0, :cond_205

    const-string v0, "Service connected, sending hits to the service"

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzaY(Ljava/lang/String;)V

    :goto_10a
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_205

    const/4 v0, 0x0

    invoke-interface {v8, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/analytics/internal/zzab;

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMq:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/analytics/internal/zzi;->zzb(Lcom/google/android/gms/analytics/internal/zzab;)Z

    move-result v1

    if-nez v1, :cond_148

    move-wide v0, v4

    :goto_120
    iget-object v4, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMo:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-virtual {v4}, Lcom/google/android/gms/analytics/internal/zzah;->zzku()Z

    move-result v4

    if-eqz v4, :cond_199

    iget-object v4, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMo:Lcom/google/android/gms/analytics/internal/zzah;

    invoke-virtual {v4, v8}, Lcom/google/android/gms/analytics/internal/zzah;->zzf(Ljava/util/List;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    move-wide v4, v0

    :goto_133
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18d

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    goto :goto_133

    :cond_148
    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzab;->zzkj()J

    move-result-wide v10

    invoke-static {v4, v5, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v4

    invoke-interface {v8, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    const-string v1, "Hit sent do device AnalyticsService for delivery"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_158
    .catchall {:try_start_f3 .. :try_end_158} :catchall_1ee

    :try_start_158
    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzab;->zzkj()J

    move-result-wide v10

    invoke-virtual {v1, v10, v11}, Lcom/google/android/gms/analytics/internal/zzj;->zzq(J)V

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzab;->zzkj()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_16c
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_158 .. :try_end_16c} :catch_16d
    .catchall {:try_start_158 .. :try_end_16c} :catchall_1ee

    goto :goto_10a

    :catch_16d
    move-exception v0

    :try_start_16e
    const-string v1, "Failed to remove hit that was send for delivery"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V
    :try_end_176
    .catchall {:try_start_16e .. :try_end_176} :catchall_1ee

    :try_start_176
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->setTransactionSuccessful()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->endTransaction()V
    :try_end_180
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_176 .. :try_end_180} :catch_182

    goto/16 :goto_31

    :catch_182
    move-exception v0

    const-string v1, "Failed to commit local dispatch transaction"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    goto/16 :goto_31

    :cond_18d
    :try_start_18d
    invoke-interface {v8, v9}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z
    :try_end_190
    .catchall {:try_start_18d .. :try_end_190} :catchall_1ee

    :try_start_190
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0, v9}, Lcom/google/android/gms/analytics/internal/zzj;->zzd(Ljava/util/List;)V

    invoke-interface {v3, v9}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_198
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_190 .. :try_end_198} :catch_1b6
    .catchall {:try_start_190 .. :try_end_198} :catchall_1ee

    move-wide v0, v4

    :cond_199
    :try_start_199
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z
    :try_end_19c
    .catchall {:try_start_199 .. :try_end_19c} :catchall_1ee

    move-result v4

    if-eqz v4, :cond_1d6

    :try_start_19f
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->setTransactionSuccessful()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->endTransaction()V
    :try_end_1a9
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_19f .. :try_end_1a9} :catch_1ab

    goto/16 :goto_31

    :catch_1ab
    move-exception v0

    const-string v1, "Failed to commit local dispatch transaction"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    goto/16 :goto_31

    :catch_1b6
    move-exception v0

    :try_start_1b7
    const-string v1, "Failed to remove successfully uploaded hits"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V
    :try_end_1bf
    .catchall {:try_start_1b7 .. :try_end_1bf} :catchall_1ee

    :try_start_1bf
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->setTransactionSuccessful()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->endTransaction()V
    :try_end_1c9
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1bf .. :try_end_1c9} :catch_1cb

    goto/16 :goto_31

    :catch_1cb
    move-exception v0

    const-string v1, "Failed to commit local dispatch transaction"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    goto/16 :goto_31

    :cond_1d6
    :try_start_1d6
    iget-object v4, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v4}, Lcom/google/android/gms/analytics/internal/zzj;->setTransactionSuccessful()V

    iget-object v4, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v4}, Lcom/google/android/gms/analytics/internal/zzj;->endTransaction()V
    :try_end_1e0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1d6 .. :try_end_1e0} :catch_1e3

    move-wide v4, v0

    goto/16 :goto_52

    :catch_1e3
    move-exception v0

    const-string v1, "Failed to commit local dispatch transaction"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    goto/16 :goto_31

    :catchall_1ee
    move-exception v0

    :try_start_1ef
    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzj;->setTransactionSuccessful()V

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzj;->endTransaction()V
    :try_end_1f9
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1ef .. :try_end_1f9} :catch_1fa

    throw v0

    :catch_1fa
    move-exception v0

    const-string v1, "Failed to commit local dispatch transaction"

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/analytics/internal/zzl;->zze(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    goto/16 :goto_31

    :cond_205
    move-wide v0, v4

    goto/16 :goto_120
.end method

.method public zziU()V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzia()Lcom/google/android/gms/analytics/internal/zzf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzf;->zzic()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzio()V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziV()Z

    move-result v0

    if-nez v0, :cond_19

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMp:Lcom/google/android/gms/analytics/internal/zzag;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzag;->unregister()V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    :goto_18
    return-void

    :cond_19
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMn:Lcom/google/android/gms/analytics/internal/zzj;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzj;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMp:Lcom/google/android/gms/analytics/internal/zzag;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzag;->unregister()V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    goto :goto_18

    :cond_2a
    sget-object v0, Lcom/google/android/gms/analytics/internal/zzy;->zzNH:Lcom/google/android/gms/analytics/internal/zzy$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzy$zza;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_49

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMp:Lcom/google/android/gms/analytics/internal/zzag;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzag;->zzkr()V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMp:Lcom/google/android/gms/analytics/internal/zzag;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzag;->isConnected()Z

    move-result v0

    :goto_43
    if-eqz v0, :cond_4b

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziX()V

    goto :goto_18

    :cond_49
    const/4 v0, 0x1

    goto :goto_43

    :cond_4b
    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziY()V

    invoke-direct {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziW()V

    goto :goto_18
.end method

.method public zzjb()J
    .registers 5

    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMr:J

    const-wide/high16 v2, -0x8000000000000000L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_b

    iget-wide v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMr:J

    :cond_a
    :goto_a
    return-wide v0

    :cond_b
    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjs()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzhA()Lcom/google/android/gms/analytics/internal/zzan;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzan;->zzke()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzhA()Lcom/google/android/gms/analytics/internal/zzan;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzan;->zzkV()I

    move-result v0

    int-to-long v0, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    goto :goto_a
.end method

.method public zzjc()V
    .registers 2

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzio()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zzic()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMw:Z

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzl;->zzMq:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzi;->disconnect()V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/internal/zzl;->zziU()V

    return-void
.end method
