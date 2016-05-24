.class Lcom/google/android/gms/internal/zzqg$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/ResultCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzqg;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/ResultCallback",
        "<",
        "Lcom/google/android/gms/tagmanager/ContainerHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzaTs:Lcom/google/android/gms/internal/zzqg;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzqg;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqg$1;->zzaTs:Lcom/google/android/gms/internal/zzqg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic onResult(Lcom/google/android/gms/common/api/Result;)V
    .registers 2
    .param p1, "x0"    # Lcom/google/android/gms/common/api/Result;

    .prologue
    check-cast p1, Lcom/google/android/gms/tagmanager/ContainerHolder;

    .end local p1    # "x0":Lcom/google/android/gms/common/api/Result;
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzqg$1;->zza(Lcom/google/android/gms/tagmanager/ContainerHolder;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/tagmanager/ContainerHolder;)V
    .registers 6

    invoke-interface {p1}, Lcom/google/android/gms/tagmanager/ContainerHolder;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v0

    if-eqz v0, :cond_2e

    invoke-interface {p1}, Lcom/google/android/gms/tagmanager/ContainerHolder;->getContainer()Lcom/google/android/gms/tagmanager/Container;

    move-result-object v0

    :goto_e
    new-instance v1, Lcom/google/android/gms/internal/zzqe;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzqg$1;->zzaTs:Lcom/google/android/gms/internal/zzqg;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzqg;->zza(Lcom/google/android/gms/internal/zzqg;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzqg$1;->zzaTs:Lcom/google/android/gms/internal/zzqg;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzqg;->zzBn()Lcom/google/android/gms/internal/zzqf;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lcom/google/android/gms/internal/zzqe;-><init>(Landroid/content/Context;Lcom/google/android/gms/tagmanager/Container;Lcom/google/android/gms/internal/zzqf;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqg$1;->zzaTs:Lcom/google/android/gms/internal/zzqg;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzqe;->zzBh()Lcom/google/android/gms/internal/zzqf;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzqg;->zza(Lcom/google/android/gms/internal/zzqg;Lcom/google/android/gms/internal/zzqf;)Lcom/google/android/gms/internal/zzqf;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqg$1;->zzaTs:Lcom/google/android/gms/internal/zzqg;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzqg;->zzb(Lcom/google/android/gms/internal/zzqg;)V

    return-void

    :cond_2e
    const/4 v0, 0x0

    goto :goto_e
.end method
