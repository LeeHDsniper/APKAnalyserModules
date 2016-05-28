.class public final Lcom/google/android/gms/internal/zzot;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# instance fields
.field private final zzaIR:Lcom/google/android/gms/internal/zzoj;

.field private final zzaIS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/internal/zzoq;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzoj;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzot;->zzaIR:Lcom/google/android/gms/internal/zzoj;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzot;->zzaIS:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    if-nez p2, :cond_3

    :cond_2
    :goto_2
    return-void

    :cond_3
    const-string v0, "com.google.android.gms.measurement.screen_view"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v1, "id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    if-gtz v1, :cond_1b

    const-string v0, "com.google.android.gms.measurement.internal.ActivityLifecycleTracker"

    const-string v1, "Invalid screenId in saved activity state"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_1b
    invoke-virtual {p0, p1, v1}, Lcom/google/android/gms/internal/zzot;->zza(Landroid/app/Activity;I)Lcom/google/android/gms/internal/zzoq;

    move-result-object v1

    const-string v2, "name"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzoq;->setScreenName(Ljava/lang/String;)V

    const-string v2, "referrer_id"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzoq;->zzhT(I)V

    const-string v2, "referrer_name"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzoq;->zzdU(Ljava/lang/String;)V

    const-string v2, "interstitial"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzoq;->zzam(Z)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzoq;->zzxX()V

    goto :goto_2
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/internal/zzot;->zzaIS:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .registers 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "outState"    # Landroid/os/Bundle;

    .prologue
    if-nez p2, :cond_3

    :cond_2
    :goto_2
    return-void

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzot;->zzaIS:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzoq;

    if-eqz v0, :cond_2

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "id"

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzoq;->zzbp()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "name"

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzoq;->zzxT()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "referrer_id"

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzoq;->zzxU()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "referrer_name"

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzoq;->zzxV()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "interstitial"

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzoq;->zzxY()Z

    move-result v0

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "com.google.android.gms.measurement.screen_view"

    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_2
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/gms/internal/zzot;->zza(Landroid/app/Activity;I)Lcom/google/android/gms/internal/zzoq;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzot;->zzaIR:Lcom/google/android/gms/internal/zzoj;

    invoke-virtual {v1, v0, p1}, Lcom/google/android/gms/internal/zzoj;->zzb(Lcom/google/android/gms/internal/zzoq;Landroid/app/Activity;)V

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    return-void
.end method

.method zza(Landroid/app/Activity;I)Lcom/google/android/gms/internal/zzoq;
    .registers 5

    const/4 v1, 0x1

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzv(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzot;->zzaIS:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzoq;

    if-nez v0, :cond_25

    if-nez p2, :cond_26

    new-instance v0, Lcom/google/android/gms/internal/zzoq;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzoq;-><init>(Z)V

    :goto_15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzoq;->setScreenName(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzot;->zzaIS:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_25
    return-object v0

    :cond_26
    new-instance v0, Lcom/google/android/gms/internal/zzoq;

    invoke-direct {v0, v1, p2}, Lcom/google/android/gms/internal/zzoq;-><init>(ZI)V

    goto :goto_15
.end method
