.class public Lcom/google/android/gms/analytics/internal/zzi$zza;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/analytics/internal/zzi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "zza"
.end annotation


# instance fields
.field final synthetic zzMa:Lcom/google/android/gms/analytics/internal/zzi;

.field private volatile zzMb:Lcom/google/android/gms/analytics/internal/zzac;

.field private volatile zzMc:Z


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/analytics/internal/zzi;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 7
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "binder"    # Landroid/os/IBinder;

    .prologue
    const-string v0, "AnalyticsServiceConnection.onServiceConnected"

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    monitor-enter p0

    if-nez p2, :cond_14

    :try_start_8
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    const-string v1, "Service connected with null binder"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/internal/zzi;->zzbc(Ljava/lang/String;)V
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_5a

    :try_start_f
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0
    :try_end_13
    .catchall {:try_start_f .. :try_end_13} :catchall_46

    :goto_13
    return-void

    :cond_14
    const/4 v0, 0x0

    :try_start_15
    invoke-interface {p2}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    move-result-object v1

    const-string v2, "com.google.android.gms.analytics.internal.IAnalyticsService"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_49

    invoke-static {p2}, Lcom/google/android/gms/analytics/internal/zzac$zza;->zzae(Landroid/os/IBinder;)Lcom/google/android/gms/analytics/internal/zzac;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    const-string v2, "Bound to IAnalyticsService interface"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/analytics/internal/zzi;->zzaY(Ljava/lang/String;)V
    :try_end_2c
    .catch Landroid/os/RemoteException; {:try_start_15 .. :try_end_2c} :catch_51
    .catchall {:try_start_15 .. :try_end_2c} :catchall_5a

    :goto_2c
    if-nez v0, :cond_5f

    :try_start_2e
    invoke-static {}, Lcom/google/android/gms/common/stats/zzb;->zzpD()Lcom/google/android/gms/common/stats/zzb;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzi;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-static {v2}, Lcom/google/android/gms/analytics/internal/zzi;->zza(Lcom/google/android/gms/analytics/internal/zzi;)Lcom/google/android/gms/analytics/internal/zzi$zza;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    :try_end_41
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2e .. :try_end_41} :catch_7c
    .catchall {:try_start_2e .. :try_end_41} :catchall_5a

    :goto_41
    :try_start_41
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p0

    goto :goto_13

    :catchall_46
    move-exception v0

    monitor-exit p0
    :try_end_48
    .catchall {:try_start_41 .. :try_end_48} :catchall_46

    throw v0

    :cond_49
    :try_start_49
    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    const-string v3, "Got binder with a wrong descriptor"

    invoke-virtual {v2, v3, v1}, Lcom/google/android/gms/analytics/internal/zzi;->zze(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_50
    .catch Landroid/os/RemoteException; {:try_start_49 .. :try_end_50} :catch_51
    .catchall {:try_start_49 .. :try_end_50} :catchall_5a

    goto :goto_2c

    :catch_51
    move-exception v1

    :try_start_52
    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    const-string v2, "Service connect failed to get IAnalyticsService"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/analytics/internal/zzi;->zzbc(Ljava/lang/String;)V
    :try_end_59
    .catchall {:try_start_52 .. :try_end_59} :catchall_5a

    goto :goto_2c

    :catchall_5a
    move-exception v0

    :try_start_5b
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    throw v0
    :try_end_5f
    .catchall {:try_start_5b .. :try_end_5f} :catchall_46

    :cond_5f
    :try_start_5f
    iget-boolean v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMc:Z

    if-nez v1, :cond_79

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    const-string v2, "onServiceConnected received after the timeout limit"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/analytics/internal/zzi;->zzbb(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzi;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/analytics/internal/zzi$zza$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/analytics/internal/zzi$zza$1;-><init>(Lcom/google/android/gms/analytics/internal/zzi$zza;Lcom/google/android/gms/analytics/internal/zzac;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzof;->zzf(Ljava/lang/Runnable;)V

    goto :goto_41

    :cond_79
    iput-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMb:Lcom/google/android/gms/analytics/internal/zzac;
    :try_end_7b
    .catchall {:try_start_5f .. :try_end_7b} :catchall_5a

    goto :goto_41

    :catch_7c
    move-exception v0

    goto :goto_41
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 4
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    const-string v0, "AnalyticsServiceConnection.onServiceDisconnected"

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzi;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/analytics/internal/zzi$zza$2;

    invoke-direct {v1, p0, p1}, Lcom/google/android/gms/analytics/internal/zzi$zza$2;-><init>(Lcom/google/android/gms/analytics/internal/zzi$zza;Landroid/content/ComponentName;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzof;->zzf(Ljava/lang/Runnable;)V

    return-void
.end method

.method public zziD()Lcom/google/android/gms/analytics/internal/zzac;
    .registers 7

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzi;->zzic()V

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.google.android.gms.analytics.service.START"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v2, Landroid/content/ComponentName;

    const-string v3, "com.google.android.gms"

    const-string v4, "com.google.android.gms.analytics.service.AnalyticsService"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v2}, Lcom/google/android/gms/analytics/internal/zzi;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "app_package_name"

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {}, Lcom/google/android/gms/common/stats/zzb;->zzpD()Lcom/google/android/gms/common/stats/zzb;

    move-result-object v3

    monitor-enter p0

    const/4 v4, 0x0

    :try_start_2e
    iput-object v4, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMb:Lcom/google/android/gms/analytics/internal/zzac;

    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMc:Z

    iget-object v4, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-static {v4}, Lcom/google/android/gms/analytics/internal/zzi;->zza(Lcom/google/android/gms/analytics/internal/zzi;)Lcom/google/android/gms/analytics/internal/zzi$zza;

    move-result-object v4

    const/16 v5, 0x81

    invoke-virtual {v3, v2, v1, v4, v5}, Lcom/google/android/gms/common/stats/zzb;->zza(Landroid/content/Context;Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    iget-object v2, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    const-string v3, "Bind to service requested"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/google/android/gms/analytics/internal/zzi;->zza(Ljava/lang/String;Ljava/lang/Object;)V

    if-nez v1, :cond_51

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMc:Z

    monitor-exit p0
    :try_end_50
    .catchall {:try_start_2e .. :try_end_50} :catchall_71

    :goto_50
    return-object v0

    :cond_51
    :try_start_51
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzi;->zzif()Lcom/google/android/gms/analytics/internal/zzr;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/analytics/internal/zzr;->zzjG()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_5e
    .catch Ljava/lang/InterruptedException; {:try_start_51 .. :try_end_5e} :catch_74
    .catchall {:try_start_51 .. :try_end_5e} :catchall_71

    :goto_5e
    const/4 v0, 0x0

    :try_start_5f
    iput-boolean v0, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMc:Z

    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMb:Lcom/google/android/gms/analytics/internal/zzac;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMb:Lcom/google/android/gms/analytics/internal/zzac;

    if-nez v0, :cond_6f

    iget-object v1, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    const-string v2, "Successfully bound to service but never got onServiceConnected callback"

    invoke-virtual {v1, v2}, Lcom/google/android/gms/analytics/internal/zzi;->zzbc(Ljava/lang/String;)V

    :cond_6f
    monitor-exit p0

    goto :goto_50

    :catchall_71
    move-exception v0

    monitor-exit p0
    :try_end_73
    .catchall {:try_start_5f .. :try_end_73} :catchall_71

    throw v0

    :catch_74
    move-exception v0

    :try_start_75
    iget-object v0, p0, Lcom/google/android/gms/analytics/internal/zzi$zza;->zzMa:Lcom/google/android/gms/analytics/internal/zzi;

    const-string v1, "Wait for service connect was interrupted"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/analytics/internal/zzi;->zzbb(Ljava/lang/String;)V
    :try_end_7c
    .catchall {:try_start_75 .. :try_end_7c} :catchall_71

    goto :goto_5e
.end method
