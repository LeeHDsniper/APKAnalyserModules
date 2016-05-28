.class Lcom/google/android/gms/common/api/zzq$zza;
.super Landroid/support/v4/content/Loader;

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/zzq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/content/Loader",
        "<",
        "Lcom/google/android/gms/common/ConnectionResult;",
        ">;",
        "Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;",
        "Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;"
    }
.end annotation


# instance fields
.field public final zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

.field private zzaaU:Z

.field private zzaaV:Lcom/google/android/gms/common/ConnectionResult;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v4/content/Loader;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    return-void
.end method

.method private zzh(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaV:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq$zza;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq$zza;->isAbandoned()Z

    move-result v0

    if-nez v0, :cond_11

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/zzq$zza;->deliverResult(Ljava/lang/Object;)V

    :cond_11
    return-void
.end method


# virtual methods
.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 6
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .param p4, "args"    # [Ljava/lang/String;

    .prologue
    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v4/content/Loader;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/google/android/gms/common/api/GoogleApiClient;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method public onConnected(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "connectionHint"    # Landroid/os/Bundle;

    .prologue
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaU:Z

    sget-object v0, Lcom/google/android/gms/common/ConnectionResult;->zzYi:Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/zzq$zza;->zzh(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 3
    .param p1, "result"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaU:Z

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzq$zza;->zzh(Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method public onConnectionSuspended(I)V
    .registers 2
    .param p1, "cause"    # I

    .prologue
    return-void
.end method

.method protected onReset()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaV:Lcom/google/android/gms/common/ConnectionResult;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaU:Z

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0, p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->unregisterConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0, p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->unregisterConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    return-void
.end method

.method protected onStartLoading()V
    .registers 2

    invoke-super {p0}, Landroid/support/v4/content/Loader;->onStartLoading()V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0, p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->registerConnectionCallbacks(Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0, p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->registerConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaV:Lcom/google/android/gms/common/ConnectionResult;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaV:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/common/api/zzq$zza;->deliverResult(Ljava/lang/Object;)V

    :cond_16
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnected()Z

    move-result v0

    if-nez v0, :cond_2f

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->isConnecting()Z

    move-result v0

    if-nez v0, :cond_2f

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaU:Z

    if-nez v0, :cond_2f

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V

    :cond_2f
    return-void
.end method

.method protected onStopLoading()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    return-void
.end method

.method public zznL()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaU:Z

    return v0
.end method
