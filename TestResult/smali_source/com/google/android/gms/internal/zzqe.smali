.class Lcom/google/android/gms/internal/zzqe;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzqe$zza;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final zzpo:Lcom/google/android/gms/internal/zzqf;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/internal/zzqf;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqe;->mContext:Landroid/content/Context;

    invoke-static {p2, p3}, Lcom/google/android/gms/internal/zzqe;->zza(Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/internal/zzqf;)Lcom/google/android/gms/internal/zzqf;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzqe;->zzpo:Lcom/google/android/gms/internal/zzqf;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzqe;->zzBi()V

    return-void
.end method

.method private zzBi()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqe;->zzpo:Lcom/google/android/gms/internal/zzqf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqf;->zzBk()Z

    move-result v0

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqe;->zzpo:Lcom/google/android/gms/internal/zzqf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqf;->getTrackingId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqe;->zzpo:Lcom/google/android/gms/internal/zzqf;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqf;->getTrackingId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzqe;->zzfg(Ljava/lang/String;)Lcom/google/android/gms/analytics/Tracker;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqe;->zzpo:Lcom/google/android/gms/internal/zzqf;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqf;->zzBl()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/Tracker;->enableAdvertisingIdCollection(Z)V

    new-instance v1, Lcom/google/android/gms/internal/zzqe$zza;

    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/zzqe$zza;-><init>(Lcom/google/android/gms/analytics/Tracker;)V

    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzqe;->zzb(Lcom/google/android/gms/internal/zzoj$zza;)V

    :cond_2f
    return-void
.end method

.method static zza(Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/internal/zzqf;)Lcom/google/android/gms/internal/zzqf;
    .registers 5

    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/Container;->isDefault()Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_8
    :goto_8
    return-object p1

    :cond_9
    new-instance v0, Lcom/google/android/gms/internal/zzqf$zza;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzqf;->zzBj()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzqf$zza;-><init>(Ljava/lang/String;)V

    const-string v1, "trackingId"

    invoke-virtual {p0, v1}, Lcom/google/android/gms/tagmanager/Container;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzqf$zza;->zzfh(Ljava/lang/String;)Lcom/google/android/gms/internal/zzqf$zza;

    move-result-object v1

    const-string v2, "trackScreenViews"

    invoke-virtual {p0, v2}, Lcom/google/android/gms/tagmanager/Container;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzqf$zza;->zzau(Z)Lcom/google/android/gms/internal/zzqf$zza;

    move-result-object v1

    const-string v2, "collectAdIdentifiers"

    invoke-virtual {p0, v2}, Lcom/google/android/gms/tagmanager/Container;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzqf$zza;->zzav(Z)Lcom/google/android/gms/internal/zzqf$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzqf$zza;->zzBm()Lcom/google/android/gms/internal/zzqf;

    move-result-object p1

    goto :goto_8
.end method


# virtual methods
.method public zzBh()Lcom/google/android/gms/internal/zzqf;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqe;->zzpo:Lcom/google/android/gms/internal/zzqf;

    return-object v0
.end method

.method zzb(Lcom/google/android/gms/internal/zzoj$zza;)V
    .registers 4

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqe;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzoj;->zzaJ(Landroid/content/Context;)Lcom/google/android/gms/internal/zzoj;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzoj;->zzaj(Z)V

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzoj;->zza(Lcom/google/android/gms/internal/zzoj$zza;)V

    return-void
.end method

.method zzfg(Ljava/lang/String;)Lcom/google/android/gms/analytics/Tracker;
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqe;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/analytics/GoogleAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/analytics/GoogleAnalytics;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/analytics/GoogleAnalytics;->newTracker(Ljava/lang/String;)Lcom/google/android/gms/analytics/Tracker;

    move-result-object v0

    return-object v0
.end method
