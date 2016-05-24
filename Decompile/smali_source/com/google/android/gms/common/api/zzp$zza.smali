.class Lcom/google/android/gms/common/api/zzp$zza;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/zzp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zza"
.end annotation


# instance fields
.field public final zzaaO:I

.field public final zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

.field public final zzaaQ:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

.field final synthetic zzaaR:Lcom/google/android/gms/common/api/zzp;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/api/zzp;ILcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .registers 5

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzp$zza;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/google/android/gms/common/api/zzp$zza;->zzaaO:I

    iput-object p3, p0, Lcom/google/android/gms/common/api/zzp$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    iput-object p4, p0, Lcom/google/android/gms/common/api/zzp$zza;->zzaaQ:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    invoke-interface {p3, p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->registerConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method


# virtual methods
.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 8
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .param p4, "args"    # [Ljava/lang/String;

    .prologue
    invoke-virtual {p3, p1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    const-string v1, "GoogleApiClient #"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    iget v1, p0, Lcom/google/android/gms/common/api/zzp$zza;->zzaaO:I

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->print(I)V

    const-string v0, ":"

    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2, p3, p4}, Lcom/google/android/gms/common/api/GoogleApiClient;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    return-void
.end method

.method public onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 6
    .param p1, "result"    # Lcom/google/android/gms/common/ConnectionResult;

    .prologue
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zza;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzp;->zzd(Lcom/google/android/gms/common/api/zzp;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/common/api/zzp$zzb;

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzp$zza;->zzaaR:Lcom/google/android/gms/common/api/zzp;

    iget v3, p0, Lcom/google/android/gms/common/api/zzp$zza;->zzaaO:I

    invoke-direct {v1, v2, v3, p1}, Lcom/google/android/gms/common/api/zzp$zzb;-><init>(Lcom/google/android/gms/common/api/zzp;ILcom/google/android/gms/common/ConnectionResult;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public zznK()V
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0, p0}, Lcom/google/android/gms/common/api/GoogleApiClient;->unregisterConnectionFailedListener(Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzp$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-interface {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    return-void
.end method
