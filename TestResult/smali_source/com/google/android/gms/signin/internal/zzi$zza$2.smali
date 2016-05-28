.class Lcom/google/android/gms/signin/internal/zzi$zza$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/signin/internal/zzi$zza;->zza(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/signin/internal/zzf;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaOq:Ljava/lang/String;

.field final synthetic zzaOr:Lcom/google/android/gms/signin/internal/zzf;

.field final synthetic zzaOs:Lcom/google/android/gms/signin/internal/zzi$zza;

.field final synthetic zzaOt:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/signin/internal/zzi$zza;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/signin/internal/zzf;)V
    .registers 5

    iput-object p1, p0, Lcom/google/android/gms/signin/internal/zzi$zza$2;->zzaOs:Lcom/google/android/gms/signin/internal/zzi$zza;

    iput-object p2, p0, Lcom/google/android/gms/signin/internal/zzi$zza$2;->zzaOq:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/signin/internal/zzi$zza$2;->zzaOt:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/signin/internal/zzi$zza$2;->zzaOr:Lcom/google/android/gms/signin/internal/zzf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/signin/internal/zzi$zza$2;->zzaOs:Lcom/google/android/gms/signin/internal/zzi$zza;

    invoke-static {v0}, Lcom/google/android/gms/signin/internal/zzi$zza;->zza(Lcom/google/android/gms/signin/internal/zzi$zza;)Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/signin/internal/zzi$zza$2;->zzaOq:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/signin/internal/zzi$zza$2;->zzaOt:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;->onUploadServerAuthCode(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/signin/internal/zzi$zza$2;->zzaOr:Lcom/google/android/gms/signin/internal/zzf;

    invoke-interface {v1, v0}, Lcom/google/android/gms/signin/internal/zzf;->zzaq(Z)V
    :try_end_13
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_13} :catch_14

    :goto_13
    return-void

    :catch_14
    move-exception v0

    const-string v1, "SignInClientImpl"

    const-string v2, "RemoteException thrown when processing uploadServerAuthCode callback"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_13
.end method
