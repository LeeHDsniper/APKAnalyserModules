.class public Lcom/google/android/gms/internal/zzaz;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation


# instance fields
.field private zzpB:Z

.field private final zzpc:Ljava/lang/Object;

.field private zzqE:Lcom/google/android/gms/internal/zzib;

.field private final zzqO:Landroid/content/Context;

.field private final zzqQ:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/google/android/gms/internal/zzhj;",
            ">;"
        }
    .end annotation
.end field

.field private zzqR:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/ViewTreeObserver;",
            ">;"
        }
    .end annotation
.end field

.field private final zzqS:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final zzqT:Lcom/google/android/gms/internal/zzax;

.field private final zzqU:Lcom/google/android/gms/internal/zzdv;

.field private final zzqV:Lcom/google/android/gms/internal/zzdv$zzd;

.field private zzqW:Z

.field private final zzqX:Landroid/view/WindowManager;

.field private final zzqY:Landroid/os/PowerManager;

.field private final zzqZ:Landroid/app/KeyguardManager;

.field private zzra:Lcom/google/android/gms/internal/zzba;

.field private zzrb:Z

.field private zzrc:Z

.field private zzrd:Z

.field private zzre:Z

.field private zzrf:Landroid/content/BroadcastReceiver;

.field private final zzrg:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/google/android/gms/internal/zzaw;",
            ">;"
        }
    .end annotation
.end field

.field private final zzrh:Lcom/google/android/gms/internal/zzdg;

.field private final zzri:Lcom/google/android/gms/internal/zzdg;

.field private final zzrj:Lcom/google/android/gms/internal/zzdg;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/ads/internal/client/AdSizeParcel;Lcom/google/android/gms/internal/zzhj;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Landroid/view/View;Lcom/google/android/gms/internal/zzdv;)V
    .registers 12

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzpc:Ljava/lang/Object;

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzaz;->zzpB:Z

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzaz;->zzrc:Z

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrg:Ljava/util/HashSet;

    new-instance v0, Lcom/google/android/gms/internal/zzaz$6;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzaz$6;-><init>(Lcom/google/android/gms/internal/zzaz;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrh:Lcom/google/android/gms/internal/zzdg;

    new-instance v0, Lcom/google/android/gms/internal/zzaz$7;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzaz$7;-><init>(Lcom/google/android/gms/internal/zzaz;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzri:Lcom/google/android/gms/internal/zzdg;

    new-instance v0, Lcom/google/android/gms/internal/zzaz$8;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzaz$8;-><init>(Lcom/google/android/gms/internal/zzaz;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrj:Lcom/google/android/gms/internal/zzdg;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzaz;->zzqU:Lcom/google/android/gms/internal/zzdv;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqQ:Ljava/lang/ref/WeakReference;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqS:Ljava/lang/ref/WeakReference;

    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqR:Ljava/lang/ref/WeakReference;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrd:Z

    new-instance v0, Lcom/google/android/gms/internal/zzib;

    const-wide/16 v2, 0xc8

    invoke-direct {v0, v2, v3}, Lcom/google/android/gms/internal/zzib;-><init>(J)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqE:Lcom/google/android/gms/internal/zzib;

    new-instance v0, Lcom/google/android/gms/internal/zzax;

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v3, p1, Lcom/google/android/gms/ads/internal/client/AdSizeParcel;->zzsG:Ljava/lang/String;

    iget-object v4, p2, Lcom/google/android/gms/internal/zzhj;->zzGF:Lorg/json/JSONObject;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzhj;->zzbY()Z

    move-result v5

    move-object v2, p3

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/internal/zzax;-><init>(Ljava/lang/String;Lcom/google/android/gms/ads/internal/util/client/VersionInfoParcel;Ljava/lang/String;Lorg/json/JSONObject;Z)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqT:Lcom/google/android/gms/internal/zzax;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqU:Lcom/google/android/gms/internal/zzdv;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdv;->zzdL()Lcom/google/android/gms/internal/zzdv$zzd;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqV:Lcom/google/android/gms/internal/zzdv$zzd;

    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqX:Landroid/view/WindowManager;

    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqY:Landroid/os/PowerManager;

    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "keyguard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqZ:Landroid/app/KeyguardManager;

    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqO:Landroid/content/Context;

    :try_start_a7
    invoke-virtual {p0, p4}, Lcom/google/android/gms/internal/zzaz;->zzd(Landroid/view/View;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzqV:Lcom/google/android/gms/internal/zzdv$zzd;

    new-instance v2, Lcom/google/android/gms/internal/zzaz$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzaz$1;-><init>(Lcom/google/android/gms/internal/zzaz;Lorg/json/JSONObject;)V

    new-instance v0, Lcom/google/android/gms/internal/zzaz$2;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzaz$2;-><init>(Lcom/google/android/gms/internal/zzaz;)V

    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/internal/zzdv$zzd;->zza(Lcom/google/android/gms/internal/zzij$zzc;Lcom/google/android/gms/internal/zzij$zza;)V
    :try_end_ba
    .catch Lorg/json/JSONException; {:try_start_a7 .. :try_end_ba} :catch_ed
    .catch Ljava/lang/RuntimeException; {:try_start_a7 .. :try_end_ba} :catch_e6

    :goto_ba
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqV:Lcom/google/android/gms/internal/zzdv$zzd;

    new-instance v1, Lcom/google/android/gms/internal/zzaz$3;

    invoke-direct {v1, p0}, Lcom/google/android/gms/internal/zzaz$3;-><init>(Lcom/google/android/gms/internal/zzaz;)V

    new-instance v2, Lcom/google/android/gms/internal/zzaz$4;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzaz$4;-><init>(Lcom/google/android/gms/internal/zzaz;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzdv$zzd;->zza(Lcom/google/android/gms/internal/zzij$zzc;Lcom/google/android/gms/internal/zzij$zza;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Tracking ad unit: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzqT:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzax;->zzbX()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    return-void

    :catch_e6
    move-exception v0

    const-string v1, "Failure while processing active view data."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_ba

    :catch_ed
    move-exception v0

    goto :goto_ba
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzaz;)Lcom/google/android/gms/internal/zzax;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqT:Lcom/google/android/gms/internal/zzax;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzaz;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzaz;->zzqW:Z

    return p1
.end method


# virtual methods
.method protected destroy()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaz;->zzcf()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaz;->zzca()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrd:Z

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaz;->zzcc()V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqV:Lcom/google/android/gms/internal/zzdv$zzd;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdv$zzd;->release()V

    monitor-exit v1

    return-void

    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_16

    throw v0
.end method

.method isScreenOn()Z
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqY:Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    return v0
.end method

.method public onGlobalLayout()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaz;->zzh(Z)V

    return-void
.end method

.method public onScrollChanged()V
    .registers 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaz;->zzh(Z)V

    return-void
.end method

.method public pause()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaz;->zzpB:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaz;->zzh(Z)V

    monitor-exit v1

    return-void

    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_4 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public resume()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_4
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaz;->zzpB:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaz;->zzh(Z)V

    monitor-exit v1

    return-void

    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_4 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public stop()V
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrc:Z

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaz;->zzh(Z)V

    monitor-exit v1

    return-void

    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_4 .. :try_end_e} :catchall_c

    throw v0
.end method

.method protected zza(ILandroid/util/DisplayMetrics;)I
    .registers 5

    iget v0, p2, Landroid/util/DisplayMetrics;->density:F

    int-to-float v1, p1

    div-float v0, v1, v0

    float-to-int v0, v0

    return v0
.end method

.method protected zza(Landroid/view/View;Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaz;->zzh(Z)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzaw;)V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrg:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzba;)V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iput-object p1, p0, Lcom/google/android/gms/internal/zzaz;->zzra:Lcom/google/android/gms/internal/zzba;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method protected zza(Lcom/google/android/gms/internal/zzbe;)V
    .registers 4

    const-string v0, "/updateActiveView"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzrh:Lcom/google/android/gms/internal/zzdg;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzbe;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/untrackActiveViewUnit"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzri:Lcom/google/android/gms/internal/zzdg;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzbe;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    const-string v0, "/visibilityChanged"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzrj:Lcom/google/android/gms/internal/zzdg;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzbe;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzdg;)V

    return-void
.end method

.method protected zza(Lorg/json/JSONObject;)V
    .registers 5

    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const-string v2, "units"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqV:Lcom/google/android/gms/internal/zzdv$zzd;

    new-instance v2, Lcom/google/android/gms/internal/zzaz$9;

    invoke-direct {v2, p0, v1}, Lcom/google/android/gms/internal/zzaz$9;-><init>(Lcom/google/android/gms/internal/zzaz;Lorg/json/JSONObject;)V

    new-instance v1, Lcom/google/android/gms/internal/zzij$zzb;

    invoke-direct {v1}, Lcom/google/android/gms/internal/zzij$zzb;-><init>()V

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/internal/zzdv$zzd;->zza(Lcom/google/android/gms/internal/zzij$zzc;Lcom/google/android/gms/internal/zzij$zza;)V
    :try_end_21
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_21} :catch_22

    :goto_21
    return-void

    :catch_22
    move-exception v0

    const-string v1, "Skipping active view message."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_21
.end method

.method protected zzb(Ljava/util/Map;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    const/4 v1, 0x0

    if-nez p1, :cond_4

    :goto_3
    return v1

    :cond_4
    const-string v0, "hashCode"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_21

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaz;->zzqT:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzax;->zzbX()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    const/4 v0, 0x1

    :goto_1f
    move v1, v0

    goto :goto_3

    :cond_21
    move v0, v1

    goto :goto_1f
.end method

.method protected zzbZ()V
    .registers 5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrf:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_9

    monitor-exit v1

    :goto_8
    return-void

    :cond_9
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v2, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v2, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    new-instance v2, Lcom/google/android/gms/internal/zzaz$5;

    invoke-direct {v2, p0}, Lcom/google/android/gms/internal/zzaz$5;-><init>(Lcom/google/android/gms/internal/zzaz;)V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzaz;->zzrf:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaz;->zzqO:Landroid/content/Context;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaz;->zzrf:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    monitor-exit v1

    goto :goto_8

    :catchall_28
    move-exception v0

    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_3 .. :try_end_2a} :catchall_28

    throw v0
.end method

.method protected zzca()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrf:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqO:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaz;->zzrf:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrf:Landroid/content/BroadcastReceiver;

    :cond_11
    monitor-exit v1

    return-void

    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v0
.end method

.method public zzcb()V
    .registers 4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrd:Z

    if-eqz v0, :cond_2d

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzaz;->zzre:Z
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_36

    :try_start_a
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaz;->zzch()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaz;->zza(Lorg/json/JSONObject;)V
    :try_end_11
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_11} :catch_2f
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_11} :catch_39
    .catchall {:try_start_a .. :try_end_11} :catchall_36

    :goto_11
    :try_start_11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Untracking ad unit: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaz;->zzqT:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzax;->zzbX()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaC(Ljava/lang/String;)V

    :cond_2d
    monitor-exit v1

    return-void

    :catch_2f
    move-exception v0

    const-string v2, "JSON failure while processing active view data."

    invoke-static {v2, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_11

    :catchall_36
    move-exception v0

    monitor-exit v1
    :try_end_38
    .catchall {:try_start_11 .. :try_end_38} :catchall_36

    throw v0

    :catch_39
    move-exception v0

    :try_start_3a
    const-string v2, "Failure while processing active view data."

    invoke-static {v2, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3f
    .catchall {:try_start_3a .. :try_end_3f} :catchall_36

    goto :goto_11
.end method

.method protected zzcc()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzra:Lcom/google/android/gms/internal/zzba;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzra:Lcom/google/android/gms/internal/zzba;

    invoke-interface {v0, p0}, Lcom/google/android/gms/internal/zzba;->zza(Lcom/google/android/gms/internal/zzaz;)V

    :cond_9
    return-void
.end method

.method public zzcd()Z
    .registers 3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzpc:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrd:Z

    monitor-exit v1

    return v0

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method protected zzce()V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqS:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_b

    :cond_a
    :goto_a
    return-void

    :cond_b
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzqR:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    if-eq v0, v1, :cond_a

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaz;->zzcf()V

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzaz;->zzrb:Z

    if-eqz v2, :cond_28

    if-eqz v1, :cond_31

    invoke-virtual {v1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_31

    :cond_28
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzaz;->zzrb:Z

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_31
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzqR:Ljava/lang/ref/WeakReference;

    goto :goto_a
.end method

.method protected zzcf()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqR:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_10

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-nez v1, :cond_11

    :cond_10
    :goto_10
    return-void

    :cond_11
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    goto :goto_10
.end method

.method protected zzcg()Lorg/json/JSONObject;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "afmaVersion"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaz;->zzqT:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzax;->zzbV()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "activeViewJSON"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaz;->zzqT:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzax;->zzbW()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "timestamp"

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbB()Lcom/google/android/gms/internal/zzlm;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/android/gms/internal/zzlm;->elapsedRealtime()J

    move-result-wide v4

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "adFormat"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaz;->zzqT:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzax;->zzbU()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "hashCode"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaz;->zzqT:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzax;->zzbX()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "isMraid"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzaz;->zzqT:Lcom/google/android/gms/internal/zzax;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzax;->zzbY()Z

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-object v0
.end method

.method protected zzch()Lorg/json/JSONObject;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaz;->zzcg()Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "doneReasonCode"

    const-string v2, "u"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-object v0
.end method

.method protected zzd(Landroid/view/View;)Lorg/json/JSONObject;
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const/4 v3, 0x2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbz()Lcom/google/android/gms/internal/zzhv;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzhv;->isAttachedToWindow(Landroid/view/View;)Z

    move-result v1

    new-array v2, v3, [I

    new-array v0, v3, [I

    :try_start_d
    invoke-virtual {p1, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationInWindow([I)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_13} :catch_1e2

    :goto_13
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    const/4 v4, 0x0

    aget v4, v2, v4

    iput v4, v3, Landroid/graphics/Rect;->left:I

    const/4 v4, 0x1

    aget v2, v2, v4

    iput v2, v3, Landroid/graphics/Rect;->top:I

    iget v2, v3, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v4

    add-int/2addr v2, v4

    iput v2, v3, Landroid/graphics/Rect;->right:I

    iget v2, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    add-int/2addr v2, v4

    iput v2, v3, Landroid/graphics/Rect;->bottom:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaz;->zzqX:Landroid/view/WindowManager;

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Display;->getWidth()I

    move-result v4

    iput v4, v2, Landroid/graphics/Rect;->right:I

    iget-object v4, p0, Lcom/google/android/gms/internal/zzaz;->zzqX:Landroid/view/WindowManager;

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Display;->getHeight()I

    move-result v4

    iput v4, v2, Landroid/graphics/Rect;->bottom:I

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;Landroid/graphics/Point;)Z

    move-result v5

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p1, v6}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v7

    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p1, v8}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaz;->zzcg()Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "windowVisibility"

    invoke-virtual {p1}, Landroid/view/View;->getWindowVisibility()I

    move-result v11

    invoke-virtual {v9, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "isStopped"

    iget-boolean v12, p0, Lcom/google/android/gms/internal/zzaz;->zzrc:Z

    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "isPaused"

    iget-boolean v12, p0, Lcom/google/android/gms/internal/zzaz;->zzpB:Z

    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "isAttachedToWindow"

    invoke-virtual {v10, v11, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    const-string v10, "viewBox"

    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11}, Lorg/json/JSONObject;-><init>()V

    const-string v12, "top"

    iget v13, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0, v13, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v13

    invoke-virtual {v11, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "bottom"

    iget v13, v2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v13, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v13

    invoke-virtual {v11, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "left"

    iget v13, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0, v13, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v13

    invoke-virtual {v11, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v11

    const-string v12, "right"

    iget v2, v2, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0, v2, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v2

    invoke-virtual {v11, v12, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v10, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "adBox"

    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    const-string v11, "top"

    iget v12, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0, v12, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v12

    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "bottom"

    iget v12, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v12, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v12

    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "left"

    iget v12, v3, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0, v12, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v12

    invoke-virtual {v10, v11, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "right"

    iget v3, v3, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0, v3, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v3

    invoke-virtual {v10, v11, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "globalVisibleBox"

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v10, "top"

    iget v11, v4, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0, v11, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v11

    invoke-virtual {v3, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v10, "bottom"

    iget v11, v4, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v11, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v11

    invoke-virtual {v3, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v10, "left"

    iget v11, v4, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0, v11, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v11

    invoke-virtual {v3, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v10, "right"

    iget v4, v4, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0, v4, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v4

    invoke-virtual {v3, v10, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "globalVisibleBoxVisible"

    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "localVisibleBox"

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "top"

    iget v5, v6, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0, v5, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "bottom"

    iget v5, v6, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v5, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "left"

    iget v5, v6, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0, v5, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "right"

    iget v5, v6, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0, v5, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "localVisibleBoxVisible"

    invoke-virtual {v1, v2, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "hitBox"

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "top"

    iget v5, v8, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0, v5, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "bottom"

    iget v5, v8, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v5, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "left"

    iget v5, v8, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0, v5, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "right"

    iget v5, v8, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0, v5, v0}, Lcom/google/android/gms/internal/zzaz;->zza(ILandroid/util/DisplayMetrics;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "screenDensity"

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    float-to-double v4, v0

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "isVisible"

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzaz;->zze(Landroid/view/View;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    return-object v9

    :catch_1e2
    move-exception v0

    const-string v3, "Failure getting view location."

    invoke-static {v3, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzb(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_13
.end method

.method protected zze(Landroid/view/View;)Z
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_26

    invoke-virtual {p1}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaz;->isScreenOn()Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqZ:Landroid/app/KeyguardManager;

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->inKeyguardRestrictedInputMode()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzp;->zzbx()Lcom/google/android/gms/internal/zzhu;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzhu;->zzgq()Z

    move-result v0

    if-eqz v0, :cond_26

    :cond_24
    const/4 v0, 0x1

    :goto_25
    return v0

    :cond_26
    const/4 v0, 0x0

    goto :goto_25
.end method

.method protected zzg(Z)V
    .registers 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrg:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaw;

    invoke-interface {v0, p0, p1}, Lcom/google/android/gms/internal/zzaw;->zza(Lcom/google/android/gms/internal/zzaz;Z)V

    goto :goto_6

    :cond_16
    return-void
.end method

.method protected zzh(Z)V
    .registers 5

    iget-object v2, p0, Lcom/google/android/gms/internal/zzaz;->zzpc:Ljava/lang/Object;

    monitor-enter v2

    :try_start_3
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqW:Z

    if-eqz v0, :cond_b

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzaz;->zzrd:Z

    if-nez v0, :cond_d

    :cond_b
    monitor-exit v2

    :goto_c
    return-void

    :cond_d
    if-eqz p1, :cond_1c

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqE:Lcom/google/android/gms/internal/zzib;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzib;->tryAcquire()Z

    move-result v0

    if-nez v0, :cond_1c

    monitor-exit v2

    goto :goto_c

    :catchall_19
    move-exception v0

    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw v0

    :cond_1c
    :try_start_1c
    iget-object v0, p0, Lcom/google/android/gms/internal/zzaz;->zzqQ:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzhj;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaz;->zzqS:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz v1, :cond_30

    if-nez v0, :cond_38

    :cond_30
    const/4 v0, 0x1

    :goto_31
    if-eqz v0, :cond_3a

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaz;->zzcb()V

    monitor-exit v2
    :try_end_37
    .catchall {:try_start_1c .. :try_end_37} :catchall_19

    goto :goto_c

    :cond_38
    const/4 v0, 0x0

    goto :goto_31

    :cond_3a
    :try_start_3a
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzaz;->zzd(Landroid/view/View;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzaz;->zza(Lorg/json/JSONObject;)V
    :try_end_41
    .catch Lorg/json/JSONException; {:try_start_3a .. :try_end_41} :catch_49
    .catch Ljava/lang/RuntimeException; {:try_start_3a .. :try_end_41} :catch_50
    .catchall {:try_start_3a .. :try_end_41} :catchall_19

    :goto_41
    :try_start_41
    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaz;->zzce()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzaz;->zzcc()V

    monitor-exit v2

    goto :goto_c

    :catch_49
    move-exception v0

    :goto_4a
    const-string v1, "Active view update failed."

    invoke-static {v1, v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zza(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4f
    .catchall {:try_start_41 .. :try_end_4f} :catchall_19

    goto :goto_41

    :catch_50
    move-exception v0

    goto :goto_4a
.end method
