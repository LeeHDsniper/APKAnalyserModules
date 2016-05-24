.class public Lcom/google/android/gms/internal/zzfx;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzfx$zza;
    }
.end annotation


# instance fields
.field private final zzCs:Landroid/os/Handler;

.field private final zzCt:J

.field private zzCu:J

.field private zzCv:Lcom/google/android/gms/internal/zziq$zza;

.field protected zzCw:Z

.field protected zzCx:Z

.field private final zznP:I

.field private final zznQ:I

.field protected final zzoL:Lcom/google/android/gms/internal/zzip;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zziq$zza;Lcom/google/android/gms/internal/zzip;II)V
    .registers 15

    const-wide/16 v6, 0xc8

    const-wide/16 v8, 0x32

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v1 .. v9}, Lcom/google/android/gms/internal/zzfx;-><init>(Lcom/google/android/gms/internal/zziq$zza;Lcom/google/android/gms/internal/zzip;IIJJ)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zziq$zza;Lcom/google/android/gms/internal/zzip;IIJJ)V
    .registers 12

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p5, p0, Lcom/google/android/gms/internal/zzfx;->zzCt:J

    iput-wide p7, p0, Lcom/google/android/gms/internal/zzfx;->zzCu:J

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCs:Landroid/os/Handler;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzfx;->zzoL:Lcom/google/android/gms/internal/zzip;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzfx;->zzCv:Lcom/google/android/gms/internal/zziq$zza;

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzfx;->zzCw:Z

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzfx;->zzCx:Z

    iput p4, p0, Lcom/google/android/gms/internal/zzfx;->zznQ:I

    iput p3, p0, Lcom/google/android/gms/internal/zzfx;->zznP:I

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzfx;)I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/zzfx;->zznP:I

    return v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzfx;)I
    .registers 2

    iget v0, p0, Lcom/google/android/gms/internal/zzfx;->zznQ:I

    return v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zzfx;)J
    .registers 5

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCu:J

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCu:J

    return-wide v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zzfx;)J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCu:J

    return-wide v0
.end method

.method static synthetic zze(Lcom/google/android/gms/internal/zzfx;)Lcom/google/android/gms/internal/zziq$zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCv:Lcom/google/android/gms/internal/zziq$zza;

    return-object v0
.end method

.method static synthetic zzf(Lcom/google/android/gms/internal/zzfx;)J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCt:J

    return-wide v0
.end method

.method static synthetic zzg(Lcom/google/android/gms/internal/zzfx;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCs:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public run()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfx;->zzoL:Lcom/google/android/gms/internal/zzip;

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzfx;->zzfn()Z

    move-result v0

    if-eqz v0, :cond_13

    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCv:Lcom/google/android/gms/internal/zziq$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfx;->zzoL:Lcom/google/android/gms/internal/zzip;

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zziq$zza;->zza(Lcom/google/android/gms/internal/zzip;Z)V

    :goto_12
    return-void

    :cond_13
    new-instance v0, Lcom/google/android/gms/internal/zzfx$zza;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfx;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v1}, Lcom/google/android/gms/internal/zzip;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/zzfx$zza;-><init>(Lcom/google/android/gms/internal/zzfx;Landroid/webkit/WebView;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzfx$zza;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_12
.end method

.method public zza(Lcom/google/android/gms/ads/internal/request/AdResponseParcel;)V
    .registers 5

    new-instance v0, Lcom/google/android/gms/internal/zzix;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzfx;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzEe:Ljava/lang/String;

    invoke-direct {v0, p0, v1, v2}, Lcom/google/android/gms/internal/zzix;-><init>(Lcom/google/android/gms/internal/zzfx;Lcom/google/android/gms/internal/zzip;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzfx;->zza(Lcom/google/android/gms/ads/internal/request/AdResponseParcel;Lcom/google/android/gms/internal/zzix;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/ads/internal/request/AdResponseParcel;Lcom/google/android/gms/internal/zzix;)V
    .registers 9

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfx;->zzoL:Lcom/google/android/gms/internal/zzip;

    invoke-interface {v0, p2}, Lcom/google/android/gms/internal/zzip;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfx;->zzoL:Lcom/google/android/gms/internal/zzip;

    iget-object v1, p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzAT:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1b

    move-object v1, v5

    :goto_11
    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->body:Ljava/lang/String;

    const-string v3, "text/html"

    const-string v4, "UTF-8"

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzip;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1b
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v1

    iget-object v2, p1, Lcom/google/android/gms/ads/internal/request/AdResponseParcel;->zzAT:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzhu;->zzaw(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_11
.end method

.method public zzfl()V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCs:Landroid/os/Handler;

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzfx;->zzCt:J

    invoke-virtual {v0, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public declared-synchronized zzfm()V
    .registers 2

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCw:Z
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_6

    monitor-exit p0

    return-void

    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized zzfn()Z
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCw:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public zzfo()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzfx;->zzCx:Z

    return v0
.end method
